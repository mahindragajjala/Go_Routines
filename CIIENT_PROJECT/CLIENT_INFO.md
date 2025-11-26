PHASE 1 — FOUNDATIONS (Basics + Structure)
Goal
Learn the fundamental structure of a CLI application using urfave/cli.
Topics to Learn
Basic cli.App structure
Name, Usage, Version
Root command behavior
Running the app (app.Run(os.Args))
Understanding Context (cli.Context)
Why this matters
This phase forms the skeleton. Without understanding App + Context, nothing else fits.
Example
app := &cli.App{
    Name:    "tool",
    Usage:   "example CLI tool",
    Version: "1.0.0",
    Action: func(c *cli.Context) error {
        fmt.Println("Hello from root")
        return nil
    },
}

app.Run(os.Args)

✔ Output of Phase 1

You can build a simple CLI with one action.

🟧 PHASE 2 — FLAGS (Global & Local Flags)
🎯 Goal

Master CLI flags, types, default values, environment variable mapping.

Important Topics

Global flags (app.Flags)

Command-specific flags (cmd.Flags)

Required vs optional flags

Types:

StringFlag

IntFlag

BoolFlag

FloatFlag

PathFlag

DurationFlag

StringSliceFlag

IntSliceFlag

Environment variable binding (EnvVars)

Default values

Flag value precedence:
CLI > ENV VAR > DEFAULT

Example
&cli.StringFlag{
    Name:     "config",
    Aliases:  []string{"c"},
    EnvVars:  []string{"APP_CONFIG"},
    Required: true,
    Usage:    "path to config file",
}

✔ Output of Phase 2

You understand how input is collected into your CLI in a professional way.

🟩 PHASE 3 — COMMANDS (Subcommands + Nesting)
🎯 Goal

Learn to create real tools with multiple commands.

Important Topics

Commands: []*cli.Command{...}

Parent → child command nesting

Command categories

Before and After lifecycle hooks

Command aliases for shortcuts

Default (root) action

Help for each command automatically generated

Example
tool user add
tool user remove
tool config show

app.Commands = []*cli.Command{
    {
        Name:  "user",
        Usage: "user operations",
        Subcommands: []*cli.Command{
            {
                Name: "add",
                Usage: "add a new user",
                Action: func(c *cli.Context) error {
                    fmt.Println("Adding user:", c.Args().First())
                    return nil
                },
            },
        },
    },
}

✔ Output of Phase 3

You can design CLI architectures like Docker, Kubernetes, Git, etc.

🟦 PHASE 4 — ADVANCED FEATURES (Hooks, Errors, Custom Help, Completion)
🎯 Goal

Build production-grade CLI UX.

Important Topics
1. Lifecycle Hooks

Before

After

OnUsageError

Use cases: validate config, open DB, check auth, clean up.

2. Custom Help Output

Override default help template

Add colors

Add ASCII banners

cli.AppHelpTemplate = `Custom help here...`

3. Bash/Zsh/Fish Shell Autocompletion

Generate autocomplete scripts for your tool.

4. Error Handling

Return errors

Wrap errors

Custom exit codes

ExitError

5. Argument Parsing

Args().Get(0)

Args().Slice()

Required args

6. Command Categories

Useful in large CLIs.

🟪 PHASE 5 — PROFESSIONAL PATTERNS (Real-World Architecture)
🎯 Goal

Move from “using urfave/cli” → engineering complete developer tools.

Important Topics
1. Modular Architecture

Split commands into different files:

cmd/
   user.go
   config.go
   server.go
internal/
   db/
   util/
   config/

2. Dependency Injection via Context

Store DB client, configuration, logger inside cli.Context.Context.

3. Persistent Global State

Read config in before hook

Share across all commands

4. Building a “top-like” refresh loop

You already asked earlier — for CLI refresh loops.
Use time.Ticker + terminal clear sequences.

5. Terminal UI Integrations

tui

progress bars

spinners

Usage: status logs, worker progress, network monitoring.

6. Logging & Colors

Integrate with:

Zerolog

Logrus

Color

PromptUI

7. Packaging & Distribution

Build for multiple OS/architectures

Release binaries on GitHub

Embed static files (embed package)

Use version flags (-ldflags="-X main.version=...")

🎯 What You Will Be Able To Build After Completing All Phases
✔ Complete DevOps / Infra CLI

server start

server stop

server status

logs

configuration

users

scripts

DB migrations

✔ Tools like:

kubectl

docker

gh CLI

terraform-like commands

your own debugging CLI for Go runtime (which you’re already studying)