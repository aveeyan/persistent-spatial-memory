# Docs 05 - Agent Movement Primitives I

## 1. Overview
- We need to ensure that the agent can move around the environment.
- Definition of "movement primitives": walk forward, walk backward, turn, jump, crouch.
- One step = movement of approximately one horizontal voxel in the direction the agent is facing.

## 2. Proposed Approach
- The agent will perform these movement primitives:
```
Agent
 │
 ├── Move forward 5 steps
 ├── Move backward 5 steps
 ├── Turn clockwise + move forward
 ├── Turn counterclockwise + move forward
 ├── Square clockwise
 ├── Square counterclockwise
 ├── Jump across 1-block gap
 └── Jump onto higher block
```

## 3. Coding Implementation

## 4. Observed Results
*1. Action: Move forward 5 steps*
Start Position:
Start Yaw: 

Expected:
End Position:
End Yaw: 

Observed:
End Position:
End Yaw: 

Result:


*2. Action: Move backward 5 steps*
*3. Action: *
