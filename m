From: Bojan Prtvar <prtvar.b@gmail.com>
Date: Thu, 03 Apr 2014 16:56:10 +0000
Subject: [PATCH] staging: vme: Simplfy string usage in vme_user_probe()
Message-Id: <1396544171-2458-1-git-send-email-prtvar.b@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We can avoid usage of sprintf() and magic-sized array with simple pointer assignment.

Signed-off-by: Bojan Prtvar <prtvar.b@gmail.com>
---
This parch should be applied on top of 
"staging: vme: Fix a small coding style issue in vme_user.c"

Compile tested only.

 drivers/staging/vme/devices/vme_user.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/vme/devices/vme_user.c b/drivers/staging/vme/devices/vme_user.c
index 481192a..5fa7f83 100644
--- a/drivers/staging/vme/devices/vme_user.c
+++ b/drivers/staging/vme/devices/vme_user.c
@@ -684,7 +684,7 @@ static int vme_user_match(struct vme_dev *vdev)
 static int vme_user_probe(struct vme_dev *vdev)
 {
 	int i, err;
-	char name[12];
+	char *name;
 
 	/* Save pointer to the bridge device */
 	if (vme_user_bridge != NULL) {
@@ -794,13 +794,13 @@ static int vme_user_probe(struct vme_dev *vdev)
 
 		switch (type[i]) {
 		case MASTER_MINOR:
-			sprintf(name, "bus/vme/m%%d");
+			name = "bus/vme/m%d";
 			break;
 		case CONTROL_MINOR:
-			sprintf(name, "bus/vme/ctl");
+			name = "bus/vme/ctl";
 			break;
 		case SLAVE_MINOR:
-			sprintf(name, "bus/vme/s%%d");
+			name = "bus/vme/s%d";
 			break;
 		default:
 			err = -EINVAL;
-- 
1.9.1.286.g5172cb3

