From: Emil Goode <emilgoode@gmail.com>
Date: Fri, 04 May 2012 09:33:37 +0000
Subject: [PATCH] [media] cx88: Remove duplicate const
Message-Id: <1336124017-19538-1-git-send-email-emilgoode@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mchehab@infradead.org, rusty@rustcorp.com.au, hans.verkuil@cisco.com, istvan_v@mailbox.hu, jrnieder@gmail.com, dheitmueller@kernellabs.com, thunder.mmm@gmail.com
Cc: linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org, Emil Goode <emilgoode@gmail.com>

This patch fixes the following sparse warnings
by removing use of duplicate const.

drivers/media/video/cx88/cx88.h:152:40:
	warning: duplicate const
drivers/media/video/cx88/cx88-core.c:256:33:
	warning: duplicate const
drivers/media/video/cx88/cx88-alsa.c:769:41:
	warning: duplicate const

Signed-off-by: Emil Goode <emilgoode@gmail.com>
---
 drivers/media/video/cx88/cx88-alsa.c |    2 +-
 drivers/media/video/cx88/cx88-core.c |    2 +-
 drivers/media/video/cx88/cx88.h      |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/video/cx88/cx88-alsa.c b/drivers/media/video/cx88/cx88-alsa.c
index 04bf662..408e3c9 100644
--- a/drivers/media/video/cx88/cx88-alsa.c
+++ b/drivers/media/video/cx88/cx88-alsa.c
@@ -766,7 +766,7 @@ static struct snd_kcontrol_new snd_cx88_alc_switch = {
  * Only boards with eeprom and byte 1 at eeprom=1 have it
  */
 
-static const struct pci_device_id const cx88_audio_pci_tbl[] __devinitdata = {
+static const struct pci_device_id cx88_audio_pci_tbl[] __devinitdata = {
 	{0x14f1,0x8801,PCI_ANY_ID,PCI_ANY_ID,0,0,0},
 	{0x14f1,0x8811,PCI_ANY_ID,PCI_ANY_ID,0,0,0},
 	{0, }
diff --git a/drivers/media/video/cx88/cx88-core.c b/drivers/media/video/cx88/cx88-core.c
index fbfdd80..dbd2fa2 100644
--- a/drivers/media/video/cx88/cx88-core.c
+++ b/drivers/media/video/cx88/cx88-core.c
@@ -253,7 +253,7 @@ cx88_free_buffer(struct videobuf_queue *q, struct cx88_buffer *buf)
  *    0x0c00 -           FIFOs
  */
 
-const struct sram_channel const cx88_sram_channels[] = {
+const struct sram_channel cx88_sram_channels[] = {
 	[SRAM_CH21] = {
 		.name       = "video y / packed",
 		.cmds_start = 0x180040,
diff --git a/drivers/media/video/cx88/cx88.h b/drivers/media/video/cx88/cx88.h
index c9659de..aabec7e 100644
--- a/drivers/media/video/cx88/cx88.h
+++ b/drivers/media/video/cx88/cx88.h
@@ -149,7 +149,7 @@ struct sram_channel {
 	u32  cnt1_reg;
 	u32  cnt2_reg;
 };
-extern const struct sram_channel const cx88_sram_channels[];
+extern const struct sram_channel cx88_sram_channels[];
 
 /* ----------------------------------------------------------- */
 /* card configuration                                          */
-- 
1.7.9.5

