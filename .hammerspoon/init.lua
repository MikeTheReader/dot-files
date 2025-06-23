-- Snap VS Code and iTerm side-by-side
function snapDevLayout()
  local screen = hs.screen.primaryScreen()
  local screenFrame = screen:frame()

  -- VS Code left half
  local vscode = hs.application.find("Code")
  if vscode then
    local win = vscode:mainWindow()
    if win then
      win:setFrame({
        x = screenFrame.x,
        y = screenFrame.y,
        w = screenFrame.w / 2,
        h = screenFrame.h
      })
    end
  end

  -- iTerm right half
  local iterm = hs.application.find("iTerm2")
  if iterm then
    local win = iterm:mainWindow()
    if win then
      win:setFrame({
        x = screenFrame.x + screenFrame.w / 2,
        y = screenFrame.y,
        w = screenFrame.w / 2,
        h = screenFrame.h
      })
    end
  end
end

hs.urlevent.bind("snapLayout", function()
  snapDevLayout()
end)

hs.hotkey.bind({"cmd", "alt"}, "L", function()
  snapDevLayout()
end)

