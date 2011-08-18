From: John Daiker <daikerjohn@gmail.com>
Date: Thu, 18 Aug 2011 17:11:12 +0000
Subject: [PATCH 1/1] Sound, echoaudio: Place echoaudio drivers in submenu
Message-Id: <1313687472-8267-1-git-send-email-daikerjohn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Put all the echoaudio boards into their own Kconfig submneu.  They used to be
listed individually.

Signed-off-by: John Daiker <daikerjohn@gmail.com>
---
 sound/pci/Kconfig |   25 +++++++++++++++++++++++++
 1 files changed, 25 insertions(+), 0 deletions(-)

diff --git a/sound/pci/Kconfig b/sound/pci/Kconfig
index 8816804..9344274 100644
--- a/sound/pci/Kconfig
+++ b/sound/pci/Kconfig
@@ -312,8 +312,18 @@ config SND_CTXFI
	  To compile this driver as a module, choose M here: the module
	  will be called snd-ctxfi.

+config SND_ECHOAUDIO
+	tristate "Echoaudio Support"
+	default y
+	select SND_PCM
+	help
+	  Support for EchoAudio based devices.
+
+if SND_ECHOAUDIO
+
 config SND_DARLA20
	tristate "(Echoaudio) Darla20"
+	depends on SND_ECHOAUDIO
	select FW_LOADER
	select SND_PCM
	help
@@ -324,6 +334,7 @@ config SND_DARLA20

 config SND_GINA20
	tristate "(Echoaudio) Gina20"
+	depends on SND_ECHOAUDIO
	select FW_LOADER
	select SND_PCM
	help
@@ -334,6 +345,7 @@ config SND_GINA20

 config SND_LAYLA20
	tristate "(Echoaudio) Layla20"
+	depends on SND_ECHOAUDIO
	select FW_LOADER
	select SND_RAWMIDI
	select SND_PCM
@@ -345,6 +357,7 @@ config SND_LAYLA20

 config SND_DARLA24
	tristate "(Echoaudio) Darla24"
+	depends on SND_ECHOAUDIO
	select FW_LOADER
	select SND_PCM
	help
@@ -355,6 +368,7 @@ config SND_DARLA24

 config SND_GINA24
	tristate "(Echoaudio) Gina24"
+	depends on SND_ECHOAUDIO
	select FW_LOADER
	select SND_PCM
	help
@@ -365,6 +379,7 @@ config SND_GINA24

 config SND_LAYLA24
	tristate "(Echoaudio) Layla24"
+	depends on SND_ECHOAUDIO
	select FW_LOADER
	select SND_RAWMIDI
	select SND_PCM
@@ -376,6 +391,7 @@ config SND_LAYLA24

 config SND_MONA
	tristate "(Echoaudio) Mona"
+	depends on SND_ECHOAUDIO
	select FW_LOADER
	select SND_RAWMIDI
	select SND_PCM
@@ -387,6 +403,7 @@ config SND_MONA

 config SND_MIA
	tristate "(Echoaudio) Mia"
+	depends on SND_ECHOAUDIO
	select FW_LOADER
	select SND_RAWMIDI
	select SND_PCM
@@ -398,6 +415,7 @@ config SND_MIA

 config SND_ECHO3G
	tristate "(Echoaudio) 3G cards"
+	depends on SND_ECHOAUDIO
	select FW_LOADER
	select SND_RAWMIDI
	select SND_PCM
@@ -409,6 +427,7 @@ config SND_ECHO3G

 config SND_INDIGO
	tristate "(Echoaudio) Indigo"
+	depends on SND_ECHOAUDIO
	select FW_LOADER
	select SND_PCM
	help
@@ -419,6 +438,7 @@ config SND_INDIGO

 config SND_INDIGOIO
	tristate "(Echoaudio) Indigo IO"
+	depends on SND_ECHOAUDIO
	select FW_LOADER
	select SND_PCM
	help
@@ -429,6 +449,7 @@ config SND_INDIGOIO

 config SND_INDIGODJ
	tristate "(Echoaudio) Indigo DJ"
+	depends on SND_ECHOAUDIO
	select FW_LOADER
	select SND_PCM
	help
@@ -439,6 +460,7 @@ config SND_INDIGODJ

 config SND_INDIGOIOX
	tristate "(Echoaudio) Indigo IOx"
+	depends on SND_ECHOAUDIO
	select FW_LOADER
	select SND_PCM
	help
@@ -449,6 +471,7 @@ config SND_INDIGOIOX

 config SND_INDIGODJX
	tristate "(Echoaudio) Indigo DJx"
+	depends on SND_ECHOAUDIO
	select FW_LOADER
	select SND_PCM
	help
@@ -457,6 +480,8 @@ config SND_INDIGODJX
	  To compile this driver as a module, choose M here: the module
	  will be called snd-indigodjx

+endif
+
 config SND_EMU10K1
	tristate "Emu10k1 (SB Live!, Audigy, E-mu APS)"
	select FW_LOADER
--
1.7.4.1
