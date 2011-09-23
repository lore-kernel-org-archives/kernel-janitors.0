From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 23 Sep 2011 06:24:21 +0000
Subject: [patch 1/2] ALSA: hdspm - potential info leak in
Message-Id: <20110923062421.GI4387@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Smatch has a new check for Rosenberg type information leaks where
structs are copied to the user with uninitialized stack data in them.

The status struct has a hole in it, and on some paths not all the
members were initialized.

struct hdspm_status {
        unsigned char              card_type;            /*     0     1 */
        /* XXX 3 bytes hole, try to pack */
        enum hdspm_syncsource      autosync_source;      /*     4     4 */
        long long unsigned int     card_clock;           /*     8     8 */

The hdspm_version struct had holes in it as well.

struct hdspm_version {
        unsigned char              card_type;            /*     0     1 */
        char                       cardname[20];         /*     1    20 */
        /* XXX 3 bytes hole, try to pack */
        unsigned int               serial;               /*    24     4 */
        short unsigned int         firmware_rev;         /*    28     2 */
        /* XXX 2 bytes hole, try to pack */
        int                        addons;               /*    32     4 */

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/sound/pci/rme9652/hdspm.c b/sound/pci/rme9652/hdspm.c
index 214110d..bf438d1 100644
--- a/sound/pci/rme9652/hdspm.c
+++ b/sound/pci/rme9652/hdspm.c
@@ -6227,6 +6227,8 @@ static int snd_hdspm_hwdep_ioctl(struct snd_hwdep *hw, struct file *file,
 		break;
 
 	case SNDRV_HDSPM_IOCTL_GET_STATUS:
+		memset(&status, 0, sizeof(status));
+
 		status.card_type = hdspm->io_type;
 
 		status.autosync_source = hdspm_autosync_ref(hdspm);
@@ -6266,6 +6268,8 @@ static int snd_hdspm_hwdep_ioctl(struct snd_hwdep *hw, struct file *file,
 		break;
 
 	case SNDRV_HDSPM_IOCTL_GET_VERSION:
+		memset(&hdspm_version, 0, sizeof(hdspm_version));
+
 		hdspm_version.card_type = hdspm->io_type;
 		strncpy(hdspm_version.cardname, hdspm->card_name,
 				sizeof(hdspm_version.cardname));
