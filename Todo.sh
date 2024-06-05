#!/bin/bash

# Function to create a task
create_task() {
    echo "Creating a new task..."
    echo "Enter title: "
    read title
    echo "Enter due date (YYYY-MM-DD): "
    read due_date
    echo "Enter description: "
    read description
    echo "Enter location: "
    read location
    echo "Enter priority (high/medium/low): "
    read priority
    echo "Is task completed? (yes/no): "
    read completion

    echo "$title,$due_date,$description,$location,$priority,$completion" >> tasks.csv
    echo "Task created successfully."
}

# Function to update a task
update_task() {
    echo "Updating a task..."
    echo "Enter task id: "
    read task_id
    echo "Enter new title: "
    read title
    echo "Enter new due date (YYYY-MM-DD): "
    read due_date
    echo "Enter new description: "
    read description
    echo "Enter new location: "
    read location
    echo "Enter new priority (high/medium/low): "
    read priority
    echo "Is task completed? (yes/no): "
    read completion

    sed -i "${task_id}s/.*/$title,$due_date,$description,$location,$priority,$completion/" tasks.csv
    echo "Task updated successfully."
}

# Function to delete a task
delete_task() {
    echo "Deleting a task..."
    echo "Enter task id: "
    read task_id
    sed -i "${task_id}d" tasks.csv
    echo "Task deleted successfully."
}

# Function to list all tasks
list_tasks() {
    echo "Listing all tasks..."
    cat tasks.csv
}

# Main program loop
while true; do
    echo "1. Create a task"
    echo "2. Update a task"
    echo "3. Delete a task"
    echo "4. List all tasks"
    echo "5. Exit"
    read -rp "Enter your choice: " choice
    case "$choice" in
        1) create_task ;;
        2) update_task ;;
        3) delete_task ;;
        4) list_tasks ;;
        5) break ;;
        *) echo "Invalid choice." ;;
    esac
done
