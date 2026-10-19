#!/usr/bin/env bash
set -e

echo "==> [1/6] ATIVANDO REPOSITÓRIOS EXTRAS (RPM Fusion)"
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y

echo "==> [2/6] CONFIGURANDO OPENH264"
sudo dnf config-manager setopt fedora-cisco-openh264.enabled=1
sudo dnf config-manager setopt fedora-cisco-openh264.includepkgs=openh264

echo "==> [3/6] CONFIGURANDO FLATPAK"
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

echo "==> [4/6] CONFIGURANDO REPOSITÓRIOS MICROSOFT"
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager addrepo --from-repofile='https://packages.microsoft.com/yumrepos/edge/config.repo'
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\nautorefresh=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null
sudo dnf install https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm -y

echo "==> [5/6] INSTALANDO PACOTES NATIVOS (DNF)"
dnf check-update -y
sudo dnf install -y langpacks-pt_BR hunspell-pt-BR
sudo dnf install solaar -y
sudo dnf swap ffmpeg-free ffmpeg --allowerasing -y
sudo dnf install openh264 microsoft-edge-stable code distrobox vlc wireguard-tools openvpn wireshark wine winetricks curl cabextract xorg-x11-font-utils fontconfig google-croscore-arimo-fonts google-croscore-cousine-fonts google-croscore-tinos-fonts liberation-fonts -y

sudo usermod -aG wireshark $USER
winetricks -q corefonts vcrun2019 vcrun2022 dotnet48

echo "==> [6/6] INSTALANDO APLICATIVOS (FLATPAK)"
flatpak install flathub com.valvesoftware.Steam -y
flatpak install flathub org.mozilla.thunderbird -y
flatpak install flathub io.github.kolunmi.Bazaar -y
flatpak install flathub com.nextcloud.desktopclient.nextcloud -y
flatpak install flathub md.obsidian.Obsidian -y
flatpak install flathub org.kde.koko -y
flatpak install flathub com.obsproject.Studio -y
flatpak install flathub org.gimp.GIMP -y
flatpak install flathub org.inkscape.Inkscape -y
flatpak install flathub com.github.qarmin.czkawka -y
flatpak install flathub dev.deedles.Trayscale -y && sudo tailscale set --operator=$USER
flatpak install https://cdn.devolutions.net/download/Linux/RDM/com.devolutions.remotedesktopmanager.current.flatpakref -y

echo "==> DEPLOY CONCLUÍDO. Reinicie a sessão para aplicar permissões de grupos."