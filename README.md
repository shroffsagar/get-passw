# Get-Passw CLI Utility

A command-line utility for securely retrieving passphrases from a configured source.
You can securely store all your LLM API keys (like OpenAI, Anthropic, etc.) in your system's keychain and access them securely using getpassw instead of storing them as environment variables. This provides an additional layer of security for your sensitive API keys.

## Installation

1. Clone this repository:
```bash
git clone <repository-url>
cd get-passw
```

2. Add the following to your `~/.bashrc` or `~/.bash_profile`:
```bash
source "/path/to/get-passw/getpassw.sh"
```

3. Reload your shell configuration:
```bash
source ~/.bashrc
OR
source ~/.bash_profile
```

## Configuration

1. Create a `config.sh` file in the root directory:
```bash
cp config.sh.example config.sh
```

2. Edit `config.sh` to specify allowed keys:
```bash
# Array of allowed passphrase keys
ALLOWED_KEYS=(
    "key1"
    "key2"
    "development.database"
    "production.api"
)
```

## Usage

To retrieve a passphrase:
```bash
getpassw <key-name>
```

Example:
```bash
getpassw chat.gpt.key
```

## Security

- Only keys specified in `config.sh` can be accessed
- The utility operates in read-only mode
- Keys must match exactly as configured

## License

MIT License
