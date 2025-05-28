# Deploy Script for Angular Project

This PowerShell script automates the process of building and deploying an Angular project, and then committing and pushing the deployment output to a Git repository. It is intended for use in a Windows environment and is suitable for integration with GitHub or other Git-based workflows.

## How It Works

1. **Builds the Angular project** in production mode using `ng build`.
2. **Cleans the deployment directory** (except for the `.git` folder).
3. **Copies the new build output** to the deployment directory.
4. **Prompts for a commit message** and commits & pushes the changes in the deploy folder to the remote repository.

## Usage

1. **Prerequisites:**
   - Node.js, Angular CLI, and Git must be installed and available in your system PATH.
   - Update the script variables (`$projectRoot`, `$deployPath`, etc.) to match your project structure.
   - The deployment directory should be a Git repository (e.g., for GitHub Pages deployment).

2. **Run the Script:**
   - Open PowerShell.
   - Navigate to the directory containing `post-commit-deploy.ps1`.
   - Execute the script:
     ```powershell
     ./post-commit-deploy.ps1
     ```
   - Enter a commit message when prompted.

3. **Result:**
   - The latest Angular build will be deployed to the specified folder and changes will be pushed to the remote repository.

## Example Use Case

This script is ideal for workflows where you want to automatically update a deployment branch (such as `gh-pages` for GitHub Pages) after each production build.

## Notes
- Make sure you have the necessary permissions to run scripts and push to the remote repository.
- Customize the script paths as needed for your project.
