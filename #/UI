local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local players = game.Players
local player = players.LocalPlayer

local Library = {
	Connections = {}
}

pcall(function()
	shared.HUILibrary:Destroy()
end)

local function Validate(Values, options)
	for i,v in pairs(Values) do
		if options[i] == nil then
			options[i] = v
		end
	end

	return options
end

local function Round(Number, Factor)
	local Result = math.floor(Number/Factor + (math.sign(Number) * 0.5)) * Factor
	if Result < 0 then Result = Result + Factor end
	return Result
end

local function Create(Name, Parent, Properties, Children)
	local Object = Instance.new(Name)
	for i, v in next, Properties or {} do
		Object[i] = v
	end
	for i, v in next, Children or {} do
		v.Parent = Object
	end
	if Parent then
		Object.Parent = Parent
	end
	return Object
end

local function AddConnection(Signal, Function)
	local Connection = Signal:Connect(Function)
	table.insert(Library.Connections, Connection)
	return Connection
end

local function AddDraggingFunctionality(DragPoint, Main)
	pcall(function()
		local Dragging, DragInput, MousePos, FramePos = false,nil,nil,nil
		DragPoint.InputBegan:Connect(function(Input)
			if Input.UserInputType == Enum.UserInputType.MouseButton1 then
				Dragging = true
				MousePos = Input.Position
				FramePos = Main.Position

				Input.Changed:Connect(function()
					if Input.UserInputState == Enum.UserInputState.End then
						Dragging = false
					end
				end)
			end
		end)
		DragPoint.InputChanged:Connect(function(Input)
			if Input.UserInputType == Enum.UserInputType.MouseMovement then
				DragInput = Input
			end
		end)
		UserInputService.InputChanged:Connect(function(Input)
			if Input == DragInput and Dragging then
				local Delta = Input.Position - MousePos
				TweenService:Create(Main, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
					{ Position = UDim2.new(FramePos.X.Scale, FramePos.X.Offset + Delta.X, FramePos.Y.Scale,
						FramePos.Y.Offset + Delta.Y) }):Play()
			end
		end)
	end)
end

local ScreenGui = Create("ScreenGui", player.PlayerGui, {
	IgnoreGuiInset = false,
	ResetOnSpawn = false,
	ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
})

shared.HUILibrary = ScreenGui

function Library.LoadMain()
	local NuclearBomba = true

	local CanvasGroup = Create("CanvasGroup", ScreenGui, {
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = Color3.fromRGB(35, 35, 35),
		BorderColor3 = Color3.new(0, 0, 0),
		BorderSizePixel = 0,
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Size = UDim2.new(0, 500, 0, 350),
		Visible = true,
	}, {
		Create("UICorner", nil, {
			CornerRadius = UDim.new(0, 6)
		})
	})

	shared.SexyMainUi = CanvasGroup

	local TopBar = Create("Frame", CanvasGroup, {
		Size = UDim2.new(1, 0, 0, 35),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	}, {
		Create("UIStroke", nil, {
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
			LineJoinMode = Enum.LineJoinMode.Miter,
			Color = Color3.fromRGB(40, 40, 40),
			Thickness = 0.6000000238418579
		})
	})

	local NameHub = Create("TextLabel", TopBar, {
		Size = UDim2.new(0, 140, 0, 34),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BackgroundTransparency = 1,
		Position = UDim2.new(0.0219999999, 0, 0, 0),
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		RichText = true,
		TextColor3 = Color3.fromRGB(230, 230, 230),
		Text = "<font color=\"#dc2828\">Demonic</font> Hub",
		TextXAlignment = Enum.TextXAlignment.Left,
		TextSize = 15,
		TextTruncate = Enum.TextTruncate.AtEnd,
		FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal),
		LineHeight = 0.8999999761581421
	})
	local SomeTextTopBar = Create("TextLabel", TopBar, {
		Size = UDim2.new(0, 340, 0, 34),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BackgroundTransparency = 1,
		Position = UDim2.new(0.319999993, 0, 0, 0),
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		RichText = true,
		TextColor3 = Color3.fromRGB(200, 200, 200),
		Text = `Yo <font color=\"#dc2828\">{player.Name}</font>. Welcome to <font color=\"#dc2828\">Demonic</font> Hub!`,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextSize = 15,
		TextTruncate = Enum.TextTruncate.AtEnd,
		FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal),
		LineHeight = 0.8999999761581421
	})

	local TabHolder = Create("Frame", CanvasGroup, {
		BackgroundColor3 = Color3.fromRGB(35, 35, 35),
		BackgroundTransparency = 1.000,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		Size = UDim2.new(0, 150, 1, 0)
	}, {
		Create("UIStroke", nil, {
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
			Color = Color3.fromRGB(40, 40, 40),
			LineJoinMode = Enum.LineJoinMode.Miter,
			Thickness = 0.6
		})
	})

	local ScrollingFrame = Create("ScrollingFrame", TabHolder, {
		Active = true,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1.000,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		Position = UDim2.new(0, 0, 0.0971428603, 0),
		Size = UDim2.new(0, 150, 0, 316),
		ScrollBarThickness = 3
	}, {
		Create("UIListLayout", nil, {
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 5)
		}),
		Create("UIPadding", nil, {
			PaddingBottom = UDim.new(0, 9),
			PaddingLeft = UDim.new(0, 8),
			PaddingRight = UDim.new(0, 10),
			PaddingTop = UDim.new(0, 9)
		})
	})

	local InsertTab = Create("Frame", CanvasGroup, {
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1.000,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		Position = UDim2.new(0.301999807, 0, 0.0971428603, 0),
		Size = UDim2.new(0, 349, 0, 316)
	}, {
		Create("UIPageLayout", nil, {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
	})

	local aphone_lmfao_close = Create("TextButton", ScreenGui, {
		Font = Enum.Font.Gotham,
		Text = "D",
		TextColor3 = Color3.fromHex("#dc2828"),
		TextSize = 18,
		BackgroundColor3 = Color3.fromRGB(35,35,35),
		BorderColor3 = Color3.new(0,0,0),
		BorderSizePixel = 0,
		Position = UDim2.new(0, 20, 0, 20),
		Size = UDim2.new(0, 50, 0, 50),
		Visible = false,
	}, { Create("UICorner", nil, { CornerRadius = UDim.new(0, 8) }) })
	
	local UIS = game:GetService("UserInputService")

	if UIS.TouchEnabled then
		aphone_lmfao_close.Visible = true
	end
	
	local lolbruh = true

	AddConnection(aphone_lmfao_close.MouseButton1Click, function()
		lolbruh = not lolbruh
		shared.SexyMainUi.Visible = lolbruh
	end)

	AddDraggingFunctionality(aphone_lmfao_close, aphone_lmfao_close)

	AddDraggingFunctionality(TopBar, CanvasGroup)

	local TableTab = {}
	function TableTab.AddTab(name: str)
		local EnabledAnimation = false

		-- #TabButton
		local TextButton = Create("TextButton", ScrollingFrame, {
			BackgroundColor3 = Color3.fromRGB(220, 40, 40),
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, 30),
			AutoButtonColor = false,
			Font = Enum.Font.Gotham,
			Text = "",
			TextColor3 = Color3.fromRGB(255, 255, 255),
			TextSize = 14.000,
			TextStrokeColor3 = Color3.fromRGB(254, 254, 254),
			TextXAlignment = Enum.TextXAlignment.Left,
			BackgroundTransparency = 1
		})

		local UICorner = Create("UICorner", TextButton, {
			CornerRadius = UDim.new(0, 4)
		})

		local UIPadding = Create("UIPadding", TextButton, {
			PaddingLeft = UDim.new(0, 12),
			PaddingRight = UDim.new(0, 12)
		})

		local UIGradient = Create("UIGradient", TextButton, {
			Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(220, 40, 40)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(140, 0, 0))},
			Rotation = 90
		})

		local TextLabel = Create("TextLabel", TextButton, {
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1.000,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, 0),
			Font = Enum.Font.Gotham,
			TextSize = 14.000,
			TextXAlignment = Enum.TextXAlignment.Left,
			Text = name,
			TextColor3 = Color3.fromRGB(150,150,150)
		})

		local CoolBorder = Create("Frame", TextButton, {
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1.000,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Position = UDim2.new(0.5, 0, 0.5, 0),
			Size = UDim2.new(0, 130, 0, 29)
		})

		local UIStroke = Create("UIStroke", CoolBorder, {
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
			Transparency = 0.8,
			Thickness = 0
		})

		local UICorner_2 = Create("UICorner", CoolBorder, {
			CornerRadius = UDim.new(0, 3)
		})

		-- #TabPage

		local TabPage = Create("ScrollingFrame", InsertTab, {
			Active = true,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			BackgroundTransparency = 1.000,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			BorderSizePixel = 0,
			Position = UDim2.new(0, 0, 0.0971428603, 0),
			Size = UDim2.new(1, 0, 1, 0),
			ScrollBarThickness = 3,
		}, {
			Create("UIListLayout", nil, {
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 5)
			}),
			Create("UIPadding", nil, {
				PaddingBottom = UDim.new(0, 9),
				PaddingLeft = UDim.new(0, 8),
				PaddingRight = UDim.new(0, 10),
				PaddingTop = UDim.new(0, 9)
			})
		})

		-- #TabAnimations

		if NuclearBomba then
			NuclearBomba = false
			TweenService:Create(TextButton, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundTransparency = 0}):Play()
			TweenService:Create(UIStroke, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Thickness = 1}):Play()
			TweenService:Create(TextLabel, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(235, 235, 235)}):Play()
			InsertTab.UIPageLayout:JumpTo(TabPage)
		end

		AddConnection(TextButton.MouseButton1Click, function()
			for _, Tab in next, TabHolder.ScrollingFrame:GetChildren() do
				if Tab:IsA("TextButton") then
					TweenService:Create(Tab, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
					TweenService:Create(Tab.CoolBorder.UIStroke, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Thickness = 0}):Play()
					TweenService:Create(Tab.TextLabel, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(150,150,150)}):Play()
				end
			end

			TweenService:Create(TextButton, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundTransparency = 0}):Play()
			TweenService:Create(UIStroke, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Thickness = 1}):Play()
			TweenService:Create(TextLabel, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(235, 235, 235)}):Play()

			InsertTab.UIPageLayout:JumpTo(TabPage)
		end)

		local Sections = {}
		function Sections.AddSection(name: str)
			local SectionSetting = {Toggled = true}
			local section_holder = Create("CanvasGroup", TabPage, {
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundColor3 = Color3.new(0.129412, 0.129412, 0.129412),
				BorderColor3 = Color3.new(0, 0, 0),
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, 0),
				Visible = true,
			}, {
				Create("UICorner", nil, {
					CornerRadius = UDim.new(0, 6)
				}),
				Create("UIStroke", nil, {
					ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
					Color = Color3.fromRGB(40,40,40),
					Thickness = 0.8
				}),
				Create("UIListLayout", nil, {
					SortOrder = Enum.SortOrder.LayoutOrder
				})
			})

			local top_section_name = Create("Frame", section_holder, {
				BackgroundColor3 = Color3.new(1, 1, 1),
				BorderColor3 = Color3.new(0, 0, 0),
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, 31),
				Visible = true,
			}, {
				Create("UIStroke", nil, {
					ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
					Color = Color3.new(0.156863, 0.156863, 0.156863),
					Thickness = 0.800000011920929
				}),
				Create("UIGradient", nil, {
					Color = ColorSequence.new({
						ColorSequenceKeypoint.new(0, Color3.fromHex("#dc2828")),
						ColorSequenceKeypoint.new(0.4000000059604645, Color3.fromHex("#202020")),
						ColorSequenceKeypoint.new(1, Color3.fromHex("#202020"))
					})
				})
			})

			local text_button = Create("TextButton", top_section_name, {
				Font = Enum.Font.SourceSans,
				Text = "",
				TextColor3 = Color3.new(0, 0, 0),
				TextSize = 14,
				AnchorPoint = Vector2.new(1, 0.5),
				BackgroundColor3 = Color3.new(1, 1, 1),
				BackgroundTransparency = 0.9900000095367432,
				BorderColor3 = Color3.new(0, 0, 0),
				BorderSizePixel = 0,
				Position = UDim2.new(1, -5, 0.5, 0),
				Size = UDim2.new(0, 24, 0, 24),
				Visible = true
			}, {
				Create("UIStroke", nil, {
					ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
					Color = Color3.new(1, 1, 1),
					Thickness = 0.6,
					Transparency = 0.96
				}),
				Create("UICorner", nil, {
					CornerRadius = UDim.new(0, 4)
				})
			})

			local name_section = Create("TextLabel", top_section_name, {
				Font = Enum.Font.Gotham,
				Text = name,
				TextColor3 = Color3.new(1, 1, 1),
				TextSize = 14,
				TextXAlignment = Enum.TextXAlignment.Left,
				BackgroundColor3 = Color3.new(1, 1, 1),
				BackgroundTransparency = 1,
				BorderColor3 = Color3.new(0, 0, 0),
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 1, 0),
				Visible = true,
			}, {
				Create("UIPadding", nil, {
					PaddingLeft = UDim.new(0, 10)
				})
			})

			local image_label = Create("ImageLabel", text_button, {
				Image = "rbxassetid://10709791281",
				AnchorPoint = Vector2.new(0.5, 0.5),
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Position = UDim2.new(0.5, 0, 0.5, 0),
				Size = UDim2.new(0, 19, 0, 19),
				Visible = true
			})

			local section_holder_2 = Create("Frame", section_holder, {
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundColor3 = Color3.new(1, 1, 1),
				BackgroundTransparency = 1,
				BorderColor3 = Color3.new(0, 0, 0),
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, 0),
				Visible = true,
			}, {
				Create("UIListLayout", nil, {
					Padding = UDim.new(0, 5),
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				Create("UIPadding", nil, {
					PaddingBottom = UDim.new(0, 5),
					PaddingLeft = UDim.new(0, 10),
					PaddingRight = UDim.new(0, 10),
					PaddingTop = UDim.new(0, 5)
				})
			})

			AddConnection(text_button.MouseButton1Click, function()
				SectionSetting.Toggled = not SectionSetting.Toggled
				TweenService:Create(image_label,TweenInfo.new(.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{Rotation = SectionSetting.Toggled and -90 or 0}):Play() --270
				section_holder_2.Visible = SectionSetting.Toggled
			end)
			
			local ItemHold = {}
			function ItemHold.Button(ButtonSettings) -- text: str, callback: function
				ButtonSettings = Validate({
					Name = "NewButton",
					Callback = nil
				}, ButtonSettings or {})

				local Button = {}
				
				local button = Create("TextButton", section_holder_2, {
					Font = Enum.Font.Gotham,
					RichText = true,
					Text = ButtonSettings.Name,
					TextColor3 = Color3.fromRGB(255,255,255),
					TextSize = 14,
					TextXAlignment = Enum.TextXAlignment.Left,
					BackgroundColor3 = Color3.fromRGB(31,31,31),
					BorderColor3 = Color3.fromRGB(0,0,0),
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 0, 25),
					Visible = true,
					AutoButtonColor = false
				}, {
					Create("UICorner", nil, {
						CornerRadius = UDim.new(0, 4),
					}),
					Create("UIStroke", nil, {
						ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
						Color = Color3.fromRGB(220,40,40),
						Transparency = 1
					}),
					Create("UIPadding", nil, {
						PaddingLeft = UDim.new(0, 15),
					})
				})

				AddConnection(button.MouseEnter, function()
					TweenService:Create(button.UIStroke,TweenInfo.new(.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{ Transparency = 0 }):Play()
				end)

				AddConnection(button.MouseLeave, function()
					TweenService:Create(button.UIStroke,TweenInfo.new(.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{ Transparency = 1 }):Play()
				end)

				AddConnection(button.MouseButton1Click, function()
					if typeof(ButtonSettings.Callback) == "function" then
						pcall(function()ButtonSettings.Callback()end)
					end
				end)

				function Button.NewText(str)
					button.Text = str
				end

				function Button.Visible(bool)
					button.Visible = bool
				end

				return Button
			end
			function ItemHold.Toggle(ToggleSettings)
				ToggleSettings = Validate({
					Name = "NewToggle",
					Default = false,
					IgnoreFirst = false,
					Callback = nil
				}, ToggleSettings or {})
				
				local toggle = Create("TextButton", section_holder_2, {
					Font = Enum.Font.SourceSans,
					TextColor3 = Color3.fromRGB(0,0,0),
					TextSize = 14,
					TextTransparency = 1,
					TextXAlignment = Enum.TextXAlignment.Left,
					BackgroundColor3 = Color3.fromRGB(31,31,31),
					Size = UDim2.new(1, 0, 0, 25),
					Visible = true,
					AutoButtonColor = false
				}, {
					Create("UICorner", nil, {
						CornerRadius = UDim.new(0, 5),
					}),
					Create("UIStroke", nil, {
						ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
						Color = Color3.fromRGB(220,40,40),
						Transparency = 1
					})
				})

				local toggletext = Create("TextLabel", toggle, {
					Font = Enum.Font.Gotham,
					Text = ToggleSettings.Name,
					TextColor3 = Color3.fromRGB(255,255,255),
					TextSize = 14,
					TextXAlignment = Enum.TextXAlignment.Left,
					BackgroundColor3 = Color3.fromRGB(255,255,255),
					BackgroundTransparency = 1,
					Size = UDim2.new(0.900321543, 1, 1, 0),
					Visible = true,
				}, {
					Create("UIPadding", nil, {
						PaddingLeft = UDim.new(0, 15),
					})
				})

				local toggle_frame = Create("Frame", toggle, {
					AnchorPoint = Vector2.new(1, 0.5),
					BackgroundColor3 = Color3.fromRGB(220,40,40),
					BackgroundTransparency = 1,
					Position = UDim2.new(1, -6, 0.5, 0),
					Size = UDim2.new(0, 18, 0, 18),
					Visible = true,
				}, {})

				local uicorner_2 = Create("UICorner", toggle_frame, {
					CornerRadius = UDim.new(0, 4),
				}, {})

				local toggle_ico = Create("ImageLabel", toggle_frame, {
					AnchorPoint = Vector2.new(0.5, 0.5),
					BackgroundTransparency = 1,
					Position = UDim2.new(0.5, 0, 0.5, 0),
					Size = UDim2.new(1, -2, 1, -2),
					Image = "http://www.roblox.com/asset/?id=6031094667",
					ImageTransparency = 1,
				}, {})

				local uistroketg = Create("UIStroke", toggle_frame, {
					ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
					Color = Color3.fromRGB(220,40,40),
					Thickness = 0.8,
				}, {})

				local Toggle = {Value = ToggleSettings.Default}

				function Toggle.Set(Value,ignore)
					Toggle.Value = Value
					TweenService:Create(toggle_frame, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),{BackgroundTransparency = Toggle.Value and 0 or 1}):Play()
					--TweenService:Create(uistroketg, TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),{Thickness = self.Value and 0.8 or 0}):Play()
					TweenService:Create(toggle_ico, TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),{ImageTransparency = Toggle.Value and 0 or 1}):Play()
					if not ignore then return ToggleSettings.Callback(Toggle.Value) end
				end

				AddConnection(toggle.MouseEnter, function()
					TweenService:Create(toggle.UIStroke,TweenInfo.new(.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{ Transparency = 0 }):Play()
				end)

				AddConnection(toggle.MouseLeave, function()
					TweenService:Create(toggle.UIStroke,TweenInfo.new(.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{ Transparency = 1 }):Play()
				end)

				AddConnection(toggle.MouseButton1Click, function()
					Toggle.Set(not Toggle.Value)
				end)

				function Toggle.Visible(bool)
					toggle.Visible = bool
				end
				
				Toggle.Set(Toggle.Value,ToggleSettings.IgnoreFirst)
				return Toggle
			end
			function ItemHold.TextBox(BoxSettings)
				BoxSettings = Validate({
					Name = "NewTextBox",
					Default = "",
					TextDisappear = false,
					Callback = nil
				}, BoxSettings or {})

				local textbox = Create("TextButton", section_holder_2, {
					Font = Enum.Font.Gotham,
					Text = "",
					TextColor3 = Color3.fromRGB(255,255,255),
					TextSize = 14,
					TextXAlignment = Enum.TextXAlignment.Left,
					BackgroundColor3 = Color3.fromRGB(31,31,31),
					BorderColor3 = Color3.fromRGB(0,0,0),
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 0, 25),
					Visible = true,
					AutoButtonColor = false
				}, {
					Create("UICorner", nil, {
						CornerRadius = UDim.new(0, 5),
					}),
					Create("UIStroke", nil, {
						ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
						Color = Color3.fromRGB(220,40,40),
						Transparency = 1
					})
				})

				local box = Create("TextBox", textbox, {
					Font = Enum.Font.Gotham,
					PlaceholderText = "Enter Here Something...",
					Text = "",
					TextColor3 = Color3.fromRGB(255,255,255),
					TextSize = 14,
					TextTruncate = Enum.TextTruncate.AtEnd,
					TextXAlignment = Enum.TextXAlignment.Right,
					AnchorPoint = Vector2.new(1, 0.5),
					AutomaticSize = Enum.AutomaticSize.X,
					BackgroundColor3 = Color3.fromRGB(28,28,28),
					BorderSizePixel = 0,
					Position = UDim2.new(1, -6, 0.5, 0),
					Size = UDim2.new(0, 25, 0, 18),
					Visible = true,
				}, {
					Create("UICorner", nil, {
						CornerRadius = UDim.new(0, 4),
					}),
					Create("UIPadding", nil, {
						PaddingLeft = UDim.new(0, 5),
						PaddingRight = UDim.new(0, 5),
					})
				})

				local title = Create("TextLabel", textbox, {
					Font = Enum.Font.Gotham,
					Text = "TextBox",
					TextColor3 = Color3.fromRGB(255,255,255),
					TextSize = 14,
					TextXAlignment = Enum.TextXAlignment.Left,
					AnchorPoint = Vector2.new(0, 0.5),
					BackgroundColor3 = Color3.fromRGB(255,255,255),
					BackgroundTransparency = 1,
					Position = UDim2.new(0, 0, 0.5, 0),
					Selectable = true,
					Size = UDim2.new(0, 222, 1, 0),
					Visible = true,
				}, {
					Create("UIPadding", nil, {
						PaddingLeft = UDim.new(0, 15),
					})
				})

				AddConnection(textbox.MouseEnter, function()
					TweenService:Create(textbox.UIStroke,TweenInfo.new(.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{ Transparency = 0 }):Play()
				end)

				AddConnection(textbox.MouseLeave, function()
					TweenService:Create(textbox.UIStroke,TweenInfo.new(.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{ Transparency = 1 }):Play()
				end)

				AddConnection(textbox.MouseButton1Click, function()
					box:CaptureFocus()
				end)

				AddConnection(box.FocusLost, function()
					BoxSettings.Callback(box.Text)
					if BoxSettings.TextDisappear then
						box.Text = ""
					end	
				end)
			end
			function ItemHold.Slider(SliderSetting)
				SliderSetting = Validate({
					Name = "Slider",
					Default = 5,
					Minimum = 0,
					Maximum = 10,
					Incrementation = 1,
					IgnoreFirst = false,
					Callback = nil
				}, SliderSetting or {})

				local slider = Create("TextButton", section_holder_2, {
					Font = Enum.Font.Gotham,
					RichText = true,
					Text = "",
					TextColor3 = Color3.fromRGB(255,255,255),
					TextSize = 14,
					TextXAlignment = Enum.TextXAlignment.Left,
					BackgroundColor3 = Color3.fromRGB(31,31,31),
					BorderColor3 = Color3.fromRGB(0,0,0),
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 0, 25),
					Visible = true,
					AutoButtonColor = false
				}, {
					Create("UICorner", nil, {
						CornerRadius = UDim.new(0, 4),
					}),
					Create("UIStroke", nil, {
						ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
						Color = Color3.fromRGB(220,40,40),
						Transparency = 1
					})
				})

				local text_label = Create("TextLabel", slider, {
					Font = Enum.Font.Gotham,
					RichText = true,
					Text = SliderSetting.Name,
					TextColor3 = Color3.fromRGB(255,255,255),
					TextSize = 14,
					TextXAlignment = Enum.TextXAlignment.Left,
					BackgroundColor3 = Color3.fromRGB(255,255,255),
					BackgroundTransparency = 1,
					BorderColor3 = Color3.fromRGB(0,0,0),
					BorderSizePixel = 0,
					Position = UDim2.new(-0.00244415388, 0, 0, 0),
					Size = UDim2.new(0, 311, 0, 25),
					Visible = true,
					ZIndex = 3,
				}, {
					Create("UIPadding", nil, {
						PaddingLeft = UDim.new(0, 15),
					})
				})

				local val = Create("TextLabel", slider, {
					Font = Enum.Font.Gotham,
					RichText = true,
					Text = "0",
					TextColor3 = Color3.fromRGB(225,225,225),
					TextSize = 14,
					TextXAlignment = Enum.TextXAlignment.Right,
					AnchorPoint = Vector2.new(1, 0.5),
					BackgroundColor3 = Color3.fromRGB(255,255,255),
					BackgroundTransparency = 1,
					BorderColor3 = Color3.fromRGB(0,0,0),
					BorderSizePixel = 0,
					Position = UDim2.new(1, 0, 0.5, 0),
					Size = UDim2.new(0, 52, 0, 25),
					Visible = true,
					ZIndex = 3,
				}, {
					Create("UIPadding", nil, {
						PaddingRight = UDim.new(0, 15),
					})
				})

				local slide = Create("Frame", slider, {
					BackgroundColor3 = Color3.fromRGB(28,28,28),
					BorderColor3 = Color3.fromRGB(0,0,0),
					BorderSizePixel = 0,
					Size = UDim2.new(0, 0, 1, 0),
					Visible = true,
				}, {
					Create("UICorner", nil, {
						CornerRadius = UDim.new(0, 4),
					})
				})

				local Slider = {Value = SliderSetting.Default}
				local Dragging = false

				AddConnection(slider.MouseEnter, function()
					TweenService:Create(slider.UIStroke,TweenInfo.new(.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{ Transparency = 0 }):Play()
				end)

				AddConnection(slider.MouseLeave, function()
					TweenService:Create(slider.UIStroke,TweenInfo.new(.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{ Transparency = 1 }):Play()
				end)

				AddConnection(slider.InputBegan, function(Input)
					if Input.UserInputType == Enum.UserInputType.MouseButton1 then 
						Dragging = true;
					end 
				end)

				AddConnection(slider.InputEnded, function(Input)
					if Input.UserInputType == Enum.UserInputType.MouseButton1 then 
						Dragging = false;
					end 
				end)

				function Slider.Set(Value,ignore)
					Slider.Value = math.clamp(Round(Value, SliderSetting.Increment), SliderSetting.Min, SliderSetting.Max)
					val.Text = tostring(Slider.Value)
					TweenService:Create(slide,TweenInfo.new(.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{Size = UDim2.fromScale((Slider.Value - SliderSetting.Min) / (SliderSetting.Max - SliderSetting.Min), 1)}):Play()
					if not ignore then return SliderSetting.Callback(Slider.Value) end
				end

				AddConnection(UserInputService.InputChanged, function(Input)
					if Dragging and Input.UserInputType == Enum.UserInputType.MouseMovement then 
						local SizeScale = math.clamp((Input.Position.X - slider.AbsolutePosition.X) / slider.AbsoluteSize.X, 0, 1)
						Slider.Set(SliderSetting.Min + ((SliderSetting.Max - SliderSetting.Min) * SizeScale)) 
					end
				end)

				function Slider.Visible(bool)
					slider.Visible = bool
				end

				Slider.Set(Slider.Value,SliderSetting.IgnoreFirst)
				return Slider
			end
			function ItemHold:Dropdown(DropSettings)
				DropSettings = Validate({
					Name = "Dropdown",
					Default = "",
					List = {},
					Callback = nil
				}, DropSettings or {})

				-- Element Drop
				local dropdown = Create("TextButton", section_holder_2, {
					Font = Enum.Font.Gotham,
					RichText = true,
					Text = DropSettings.Name,
					TextColor3 = Color3.fromRGB(255,255,255),
					TextSize = 14,
					TextXAlignment = Enum.TextXAlignment.Left,
					BackgroundColor3 = Color3.fromRGB(31,31,31),
					BorderColor3 = Color3.fromRGB(0,0,0),
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 0, 25),
					Visible = true,
					AutoButtonColor = false
				}, {
					Create("UICorner", nil, {
						CornerRadius = UDim.new(0, 4),
					}),
					Create("UIStroke", nil, {
						ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
						Color = Color3.fromRGB(220,40,40),
						Transparency = 1
					}),
					Create("UIPadding", nil, {
						PaddingLeft = UDim.new(0, 15),
					})
				})
				local image_label = Create("ImageLabel", dropdown, {
					Image = "rbxassetid://10709791281",
					AnchorPoint = Vector2.new(1, 0.5),
					BackgroundColor3 = Color3.fromRGB(255,255,255),
					BackgroundTransparency = 1,
					BorderColor3 = Color3.fromRGB(0,0,0),
					BorderSizePixel = 0,
					Position = UDim2.new(1, -5, 0.5, 0),
					Size = UDim2.new(0, 19, 0, 19),
					Visible = true,
				})

				-- Page Drop

				local dropdown_shd = Create("TextButton", CanvasGroup, {
					Font = Enum.Font.SourceSans,
					Text = "",
					TextColor3 = Color3.fromRGB(0,0,0),
					TextSize = 14,
					BackgroundColor3 = Color3.fromRGB(0,0,0),
					BackgroundTransparency = 0.5,
					BorderColor3 = Color3.fromRGB(0,0,0),
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 1, 0),
					Visible = false,
				}, {})

				local drop_section = Create("CanvasGroup", dropdown_shd, {
					AnchorPoint = Vector2.new(0.5, 0.5),
					BackgroundColor3 = Color3.fromRGB(35,35,35),
					BorderColor3 = Color3.fromRGB(0,0,0),
					BorderSizePixel = 0,
					Position = UDim2.new(0.5, 0, 0.5, 0),
					Size = UDim2.new(0, 350, 0, 300),
					Visible = true,
				}, {
					Create("UICorner", nil, {
						CornerRadius = UDim.new(0, 6),
					}),
					Create("UIStroke", nil, {
						ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
						Color = Color3.fromRGB(40,40,40),
						Thickness = 0.800000011920929,
					}),
					Create("UIListLayout", nil, {
						SortOrder = Enum.SortOrder.LayoutOrder,
					})
				})

				local top_drop_section_name = Create("Frame", drop_section, {
					BackgroundColor3 = Color3.fromRGB(255,255,255),
					BorderColor3 = Color3.fromRGB(0,0,0),
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 0, 31),
					Visible = true,
					ZIndex = 2,
				}, {
					Create("UIStroke", nil, {
						ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
						Color = Color3.fromRGB(40,40,40),
						Thickness = 0.8,
					}),
					Create("UIGradient", nil, {
						Color = ColorSequence.new({
							ColorSequenceKeypoint.new(0, Color3.fromHex("#dc2828")),
							ColorSequenceKeypoint.new(0.4000000059604645, Color3.fromHex("#202020")),
							ColorSequenceKeypoint.new(1, Color3.fromHex("#202020"))
						})
					})
				})

				local name_section = Create("TextLabel", top_drop_section_name, {
					Font = Enum.Font.Gotham,
					Text = DropSettings.Name,
					TextColor3 = Color3.fromRGB(255,255,255),
					TextSize = 14,
					TextTruncate = Enum.TextTruncate.AtEnd,
					TextXAlignment = Enum.TextXAlignment.Left,
					BackgroundColor3 = Color3.fromRGB(255,255,255),
					BackgroundTransparency = 1,
					BorderColor3 = Color3.fromRGB(0,0,0),
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 1, 0),
					Visible = true,
				}, {
					Create("UIPadding", name_section, {
						PaddingLeft = UDim.new(0, 10),
						PaddingRight = UDim.new(0, 35),
					})
				})

				local text_button = Create("TextButton", top_drop_section_name, {
					Font = Enum.Font.SourceSans,
					Text = "",
					TextColor3 = Color3.fromRGB(0,0,0),
					TextSize = 14,
					AnchorPoint = Vector2.new(1, 0.5),
					BackgroundColor3 = Color3.fromRGB(255,255,255),
					BackgroundTransparency = 0.9900000095367432,
					BorderColor3 = Color3.fromRGB(0,0,0),
					BorderSizePixel = 0,
					Position = UDim2.new(1, -5, 0.5, 0),
					Size = UDim2.new(0, 24, 0, 24),
					Visible = true,
				}, {
					Create("UIStroke", nil, {
						ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
						Color = Color3.fromRGB(255,255,255),
						Thickness = 0.699999988079071,
						Transparency = 0.8
					}),
					Create("UICorner", nil, {
						CornerRadius = UDim.new(0, 4),
					})
				})

				local image_label = Create("ImageLabel", text_button, {
					AnchorPoint = Vector2.new(0.5, 0.5),
					BackgroundColor3 = Color3.fromRGB(255,255,255),
					BackgroundTransparency = 1,
					BorderColor3 = Color3.fromRGB(0,0,0),
					BorderSizePixel = 0,
					Position = UDim2.new(0.5, 0, 0.5, 0),
					Size = UDim2.new(0, 19, 0, 19),
					Visible = true,
				})

				local search_bar = Create("TextBox", drop_section, {
					CursorPosition = -1,
					Font = Enum.Font.Gotham,
					PlaceholderText = "Search Anything!!!",
					Text = "",
					TextColor3 = Color3.fromRGB(230,230,230),
					TextSize = 14,
					TextXAlignment = Enum.TextXAlignment.Left,
					BackgroundColor3 = Color3.fromRGB(35,35,35),
					BorderColor3 = Color3.fromRGB(0,0,0),
					Position = UDim2.new(0, 0, 0.103333332, 0),
					Size = UDim2.new(1, 0, 0, 30),
					Visible = true,
				}, {})

				local uistroke_4 = Create("UIStroke", search_bar, {
					ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
					Color = Color3.fromRGB(220,40,40),
				}, {})

				local uipadding_2 = Create("UIPadding", search_bar, {
					PaddingLeft = UDim.new(0, 15),
					PaddingRight = UDim.new(0, 15),
				}, {})

				local scrolling_frame_holdopt = Create("ScrollingFrame", drop_section, {
					AutomaticCanvasSize = Enum.AutomaticSize.Y,
					ScrollBarImageColor3 = Color3.fromRGB(45,45,45),
					ScrollBarThickness = 3,
					Active = true,
					BackgroundColor3 = Color3.fromRGB(255,255,255),
					BackgroundTransparency = 1,
					BorderColor3 = Color3.fromRGB(0,0,0),
					BorderSizePixel = 0,
					Position = UDim2.new(0, 0, 0.203333437, 0),
					Size = UDim2.new(1, 0, 0.0700000525, 218),
					Visible = true,
				}, {
					Create("UIListLayout", nil, {
						Padding = UDim.new(0, 5),
						HorizontalAlignment = Enum.HorizontalAlignment.Center,
						SortOrder = Enum.SortOrder.LayoutOrder,
					}),
					Create("UIPadding", nil, {
						PaddingBottom = UDim.new(0, 5),
						PaddingLeft = UDim.new(0, 10),
						PaddingRight = UDim.new(0, 10),
						PaddingTop = UDim.new(0, 5),
					})
				})

				local text_label = Create("TextLabel", scrolling_frame_holdopt, {
					Font = Enum.Font.Gotham,
					Text = "Nothing Founded 🥱",
					TextColor3 = Color3.fromRGB(235,235,235),
					TextSize = 14,
					BackgroundColor3 = Color3.fromRGB(255,255,255),
					BackgroundTransparency = 1,
					BorderColor3 = Color3.fromRGB(0,0,0),
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 0, 30),
					Visible = false,
				})

				function UpdateResults()
					local search = string.lower(search_bar.Text)
					local found = false

					for i, v in pairs(scrolling_frame_holdopt:GetChildren()) do
						if search ~= "" then
							if v:IsA("Button") then
								local item = string.lower(v.Text)
								if string.find(item, search) then
									v.Visible = true
									found = true
									text_label.Visible = false
								else
									v.Visible = false
								end
							end
						end
					end

					if not found then
						text_label.Visible = true
						print("Nothing found")
					end
				end

				AddConnection(search_bar.Changed, function()
					UpdateResults()
				end)

				-- Code Drop
				AddConnection(dropdown.MouseEnter, function()
					TweenService:Create(dropdown.UIStroke,TweenInfo.new(.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{ Transparency = 0 }):Play()
				end)
				AddConnection(dropdown.MouseLeave, function()
					TweenService:Create(dropdown.UIStroke,TweenInfo.new(.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{ Transparency = 1 }):Play()
				end)

				AddConnection(dropdown.MouseButton1Click, function()
					dropdown_shd.Visible = true
				end)
				AddConnection(dropdown_shd.MouseButton1Click, function()
					dropdown_shd.Visible = false
					text_label.Visible = false
				end)
				AddConnection(text_button.MouseButton1Click, function()
					dropdown_shd.Visible = false
					text_label.Visible = false
				end)

				local Dropdown = { usedbtns = nil, Value = DropSettings.Default, Options = DropSettings.List, Buttons = {} }

				function Dropdown.Set(Value)
					Dropdown.Value = Value
					for i, v in pairs(Dropdown.Buttons) do
						if i == Value then
							TweenService:Create(i.UIStroke,TweenInfo.new(.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{ Transparency = 0 }):Play()
						else
							TweenService:Create(i.UIStroke,TweenInfo.new(.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{ Transparency = 1 }):Play()
						end
					end
					if typeof(DropSettings.Callback) == "function" then
						pcall(function()DropSettings.Callback(Dropdown.Value)end)
					end
				end

				function AddOptions(Options)
					for _, Option in pairs(Options) do
						local button = Create("TextButton", scrolling_frame_holdopt, {
							Font = Enum.Font.Gotham,
							RichText = true,
							Text = Option,
							TextColor3 = Color3.fromRGB(255,255,255),
							TextSize = 14,
							TextXAlignment = Enum.TextXAlignment.Left,
							BackgroundColor3 = Color3.fromRGB(31,31,31),
							BorderColor3 = Color3.fromRGB(0,0,0),
							BorderSizePixel = 0,
							Size = UDim2.new(1, 0, 0, 25),
							Visible = true,
							AutoButtonColor = false
						}, {
							Create("UICorner", nil, {
								CornerRadius = UDim.new(0, 4),
							}),
							Create("UIStroke", nil, {
								ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
								Color = Color3.fromRGB(220,40,40),
								Transparency = 1
							}),
							Create("UIPadding", nil, {
								PaddingLeft = UDim.new(0, 15),
							})
						})

						AddConnection(button.MouseEnter, function()
							TweenService:Create(button.UIStroke,TweenInfo.new(.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{ Transparency = 0 }):Play()
						end)
						AddConnection(button.MouseLeave, function()
							if Dropdown.usedbtns ~= button then
								TweenService:Create(button.UIStroke,TweenInfo.new(.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{ Transparency = 1 }):Play()
							end
 						end)
						AddConnection(button.MouseLeave, function()
							Dropdown.usedbtns = button
							Dropdown.Set(button)
						end)

						Dropdown.Buttons[Option] = button
					end
				end

				function Dropdown.Refresh(Options, Delete)
					if Delete then
						for _,v in pairs(Dropdown.Buttons) do
							v:Destroy()
						end
						table.clear(Dropdown.Buttons)
					end
					Dropdown.Options = Options
					AddOptions(Dropdown.Options)
				end

				function Dropdown.Visible(bool)
					dropdown.Visible = bool
				end

				Dropdown.Refresh(Dropdown.Options, false)
				Dropdown.Set(Dropdown.Value)
				return Dropdown
			end
			return ItemHold
		end
		return Sections
	end
	return TableTab
end
return Library
