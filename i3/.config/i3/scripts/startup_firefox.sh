#!/bin/bash

# Wait for i3 to fully start
sleep 2

# Move Firefox windows to different workspaces
i3-msg '[class="firefox"] move container to workspace number 2'
sleep 0.5
i3-msg '[class="firefox"] move container to workspace number 3'

# Go back to workspace 1
i3-msg 'workspace number 1'
