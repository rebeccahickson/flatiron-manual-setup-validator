# Xcode's command line tools are required for Homebrew
xcode-select --install

# Installs Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Installs Git
brew install git

# If an ssh rsa key does not exist, creates one
if [ ! -s ~/.ssh/id_rsa.pub ]
then
  ssh-keygen
fi

cat ~/.ssh/id_rsa.pub

# Install common support libraries
brew install gmp
brew install gnupg
brew link gnupg

# Installs Zsh and sets Zsh as the default shell
brew install zsh
chsh -s /bin/zsh

# Installs RVM, which updates 
curl -sSL https://get.rvm.io | bash
source ~/.zprofile

# Installs Ruby 2.6.1 and sets it as default
rvm install 2.6.1
rvm use 2.6.1 --default

# Installs Learn and Bundler
gem update --system
gem install learn-co
gem install bundler

# Installs SQLite
brew install sqlite

# We don't need these yet, but might as well install them
gem install rails
gem install nokogiri

# Installs Node Version Manager
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash
echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.zprofile
echo '[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"' >> ~/.zprofile
source ~/.zprofile

# Installs newest version of Node
nvm install node
nvm use node
nvm alias default node

# Backs up dot files
mv ~/.irbrc{,.bak}
mv ~/.gitignore{,.bak}
mv ~/.zprofile{,.bak} 
mv ~/.gitconfig{,.bak}

# Adds additional functionality to IRB
curl "https://raw.githubusercontent.com/flatiron-school/dotfiles/master/irbrc" -o "$HOME/.irbrc" 

# Adds .gitignore content
curl "https://raw.githubusercontent.com/flatiron-school/dotfiles/master/ubuntu-gitignore" -o "$HOME/.gitignore" 
git config --global core.excludesfile $HOME/.gitignore

# Adds .zprofile content
curl "https://raw.githubusercontent.com/flatiron-school/dotfiles/master/.zprofile" -o "$HOME/.zprofile"

# Sets default .gitconfig
curl "https://raw.githubusercontent.com/flatiron-school/dotfiles/master/gitconfig" -o "$HOME/.gitconfig"

echo ""
echo "#########################"
echo "# INSTALLATION COMPLETE #"
echo "#########################"
echo ""
echo "Next Steps:"
echo ""
echo "1. To configure Git with your personal GitHub account, you must add your username and email"
echo ""
echo "   - Type 'git config --global user.name <YOUR USERNAME>' to set your GitHub username"
echo "   - Type 'git config --global user.email <YOUR EMAIL>' to set your GitHub email"
echo ""
echo "2. To add your SSH key to GitHub, copy the following key (including the 'ssh-rsa' at the beginning)"
echo ""
cat ~/.ssh/id_rsa.pub
echo ""
echo "   Go to your account settings at https://github.com/ and add this as a new SSH key"
echo ""
echo "3. To configure the Learn gem with your personal account"
echo ""
echo "   - Go to learn.co/<your-github-username>. At the bottom of the page is an OAuth token"
echo "   - Copy this token"
echo "   - Run 'learn whoami' in the terminal to start the setup process"
echo "   - Paste your token into the terminal when prompted"
echo ""
echo "4. Get a Text Editor"
echo ""
echo "5. Install Chrome and Slack"
echo ""
echo "Run the following to verify successful installation:"
echo ""
echo "curl -so- https://raw.githubusercontent.com/learn-co-curriculum/flatiron-manual-setup-validator/master/manual-setup-check.sh | bash 2> /dev/null"
echo ""

