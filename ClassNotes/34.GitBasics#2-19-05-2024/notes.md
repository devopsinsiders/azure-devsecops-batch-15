Here are detailed notes on `git add`, `git commit`, `git restore`, `git restore --staged`, and `git checkout` for reverting a commit:

## `git add`

### Purpose:
- Stages changes (files or directories) for the next commit.

### Usage:
- `git add <file>`: Stages a specific file.
- `git add <directory>`: Stages all changes in a directory.
- `git add .`: Stages all changes in the current directory and subdirectories.
- `git add -p`: Interactively stages changes, allowing you to review and stage specific hunks of changes.

### Example:
```sh
git add file1.txt
git add src/
git add .
git add -p
```

## `git commit`

### Purpose:
- Records the staged changes in the local repository with a message describing the changes.

### Usage:
- `git commit -m "commit message"`: Commits staged changes with a message.
- `git commit`: Opens the default text editor to type a commit message.
- `git commit --amend`: Edits the last commit, adding any new staged changes and allowing modification of the commit message.

### Example:
```sh
git commit -m "Add new feature"
git commit
git commit --amend -m "Fix typo in new feature"
```

## `git restore`

### Purpose:
- Discards changes in the working directory or in the staging area.

### Usage:
- `git restore <file>`: Restores the specified file to the state of the last commit, discarding any changes.
- `git restore --staged <file>`: Unstages the specified file, keeping the changes in the working directory.

### Example:
```sh
git restore file1.txt
git restore --staged file1.txt
```

### Use Cases:
- Use `git restore` when you want to discard local changes in your working directory.
- Use `git restore --staged` when you want to unstage changes without discarding them.

## `git restore --staged`

### Purpose:
- Unstages changes that have been added to the staging area, but keeps the changes in the working directory.

### Usage:
- `git restore --staged <file>`: Unstages a specific file.
- `git restore --staged .`: Unstages all files.

### Example:
```sh
git restore --staged file1.txt
git restore --staged .
```

### Use Case:
- Use this when you mistakenly stage changes and want to move them back to the working directory without losing the modifications.

By understanding and using these Git commands appropriately, you can efficiently manage your codebase, stage changes, commit them, and revert to previous states when necessary.