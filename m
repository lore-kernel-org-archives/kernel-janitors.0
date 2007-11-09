From: Nicolas Kaiser <nikai@nikai.net>
Date: Fri, 09 Nov 2007 10:47:57 +0000
Subject: [PATCH] sound/pci: remove duplicated defines
Message-Id: <20071109114757.616b1d0b@lucky.kitzblitz>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Remove duplicated defines.
(From their use it looks like 'midiDataOutx are written to
rather than read from.)

Signed-off-by: Nicolas Kaiser <nikai@nikai.net>
---

 sound/pci/korg1212/korg1212.c |    3 ---
 sound/pci/rme9652/hdsp.c      |    2 --
 2 files changed, 5 deletions(-)

diff -ur a/sound/pci/korg1212/korg1212.c b/sound/pci/korg1212/korg1212.c
--- a/sound/pci/korg1212/korg1212.c	2007-11-07 11:26:36.000000000 +0100
+++ b/sound/pci/korg1212/korg1212.c	2007-11-09 11:24:22.000000000 +0100
@@ -163,9 +163,6 @@
 					//    this is the upper word of the PCI control reg.
 #define DEV_VEND_ID_OFFSET   0x70	// location of the device and vendor ID register
 
-#define COMMAND_ACK_DELAY    13        // number of RTC ticks to wait for an acknowledgement
-                                        //    from the card after sending a command.
-#define INTERCOMMAND_DELAY   40
 #define MAX_COMMAND_RETRIES  5         // maximum number of times the driver will attempt
                                        //    to send a command before giving up.
 #define COMMAND_ACK_MASK     0x8000    // the MSB is set in the command acknowledgment from
diff -ur a/sound/pci/rme9652/hdsp.c b/sound/pci/rme9652/hdsp.c
--- a/sound/pci/rme9652/hdsp.c	2007-11-07 11:26:36.000000000 +0100
+++ b/sound/pci/rme9652/hdsp.c	2007-11-09 11:22:31.000000000 +0100
@@ -104,8 +104,6 @@
 #define HDSP_statusRegister    0
 #define HDSP_timecode        128
 #define HDSP_status2Register 192
-#define HDSP_midiDataOut0    352
-#define HDSP_midiDataOut1    356
 #define HDSP_midiDataIn0     360
 #define HDSP_midiDataIn1     364
 #define HDSP_midiStatusOut0  384
