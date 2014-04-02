From: Bojan Prtvar <prtvar.b@gmail.com>
Date: Wed, 02 Apr 2014 22:24:10 +0000
Subject: [PATCH] staging: vme: Fix a small coding style issue in vme_user.c
Message-Id: <1396477450-5354-1-git-send-email-prtvar.b@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The checkpatch.pl complains about missing blank line after declaration.
This patch silence the warning.

Signed-off-by: Bojan Prtvar <prtvar.b@gmail.com>
---
 This patch is for Eudyptula Challenge task 10

 drivers/staging/vme/devices/vme_user.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/vme/devices/vme_user.c b/drivers/staging/vme/devices/vme_user.c
index 7927927..481192a 100644
--- a/drivers/staging/vme/devices/vme_user.c
+++ b/drivers/staging/vme/devices/vme_user.c
@@ -791,6 +791,7 @@ static int vme_user_probe(struct vme_dev *vdev)
 	/* Add sysfs Entries */
 	for (i = 0; i < VME_DEVS; i++) {
 		int num;
+
 		switch (type[i]) {
 		case MASTER_MINOR:
 			sprintf(name, "bus/vme/m%%d");
-- 
1.9.1.286.g5172cb3

