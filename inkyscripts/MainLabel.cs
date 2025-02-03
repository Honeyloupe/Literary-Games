using Godot;
using GodotInk;
using System;

public partial class MainLabel : RichTextLabel
{
	// Called when the node enters the scene tree for the first time.
	private InkStory story;
	public override void _Ready()
	{
		VBoxContainer parent = GetParent() as VBoxContainer;
		
	}

	// Called every frame. 'delta' is the elapsed time since the previous frame.
	public override void _Process(double delta)
	{
	}
}
