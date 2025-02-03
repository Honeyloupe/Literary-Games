using Godot;
using GodotInk;
using System.Collections.Generic;
using System.Threading.Tasks;
/* Things to investigate:
	- False flag in .ink file for two peaks and 1 type at end.
	- Terrible UI and rudimentary set-up
	- Delimiting by anything but @ symbol
	- Potential of the Rich Tech Editor
	- Parent-CHild relationships for different nodes
*/
public partial class Quick : VBoxContainer
{
	[Export]
	private InkStory story;

	private Queue<string> textQueue = new();

	public override void _Ready()
	{
		if (story == null)
		{
			GD.PrintErr("No story");
			return;
		}
		ShowNext();
	}

	private async void ShowNext()
	{
		foreach (Node child in GetChildren())
			child.QueueFree();

		if (textQueue.Count == 0)
		{
			GD.Print("Fetching new text from Ink...");
			string fullText = story.ContinueMaximally();
			GD.Print($"Raw Text: \"{fullText}\"");
		
			string[] lines = fullText.Split(new[] {"@"}, System.StringSplitOptions.RemoveEmptyEntries);

			foreach (string line in lines)
			{
				if (!string.IsNullOrWhiteSpace(line))
					textQueue.Enqueue(line.Trim());
			}
			GD.Print("Current Queue Contents:");
			foreach (string line in textQueue)
			{
				GD.Print($"- {line}");
			}
			GD.Print($"Text queue filled with {textQueue.Count} items.");
		}

		if (textQueue.Count > 0)
		{
			string nextLine = textQueue.Dequeue();
			GD.Print($"Showing: {nextLine}");
			Label contentLabel = new() { Text = nextLine };
			contentLabel.Modulate = new Color(1, 1, 1, 0);
			AddChild(contentLabel);

			Button continueButton = new Button { Text = "Continue", Visible = false };
			continueButton.Pressed += async () =>
			{
				continueButton.Disabled = true;
				await Wait(0.5f);
				ShowNext();
			};
			AddChild(continueButton);
			await FadeIn(contentLabel);
			continueButton.Visible = true;
			if (textQueue.Count == 0)
			{
				continueButton.Visible = false;
				ShowChoices();
			}
		}
		else
		{
			GD.Print("No more text in queue.");
		}
	}

	private void ShowChoices()
	{
		foreach (InkChoice choice in story.CurrentChoices)
		{
			Button button = new() { Text = choice.Text };
			button.Pressed += () =>
			{
				story.ChooseChoiceIndex(choice.Index);
				textQueue.Clear();
				ShowNext();
			};
			AddChild(button);
		}
	}
	
	private async Task FadeIn(CanvasItem item)
	{
		item.Modulate = new Color(1, 1, 1, 0);
		var tween = CreateTween();
		tween.TweenProperty(item, "modulate:a", 1.0f, 1.0f);

		await ToSignal(tween, "finished");
	}
	
	private async Task Wait(float seconds)
	{
		await Task.Delay((int)(seconds * 1000));
	}
}
