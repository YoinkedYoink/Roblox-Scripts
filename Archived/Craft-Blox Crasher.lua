number_1 = 0;
number_2 = 0;

while true do
    number_1 = number_1 + 1
    number_2 = number_2 + 1
    local Target = game:GetService("ReplicatedStorage").VisualRemotes.GetChunk;
    Target:FireServer(number_1, number_2);
    print("loaded chunk")
    wait()
end
