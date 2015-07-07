From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Tue, 07 Jul 2015 05:39:03 +0000
Subject: [PATCH] [SCSI] FlashPoint: optimize string comparison
Message-Id: <1436247543-7326-1-git-send-email-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: khalid@gonehiking.org, JBottomley@odin.com
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Stop comparing the strings as soon as we know that they don't match.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/scsi/FlashPoint.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/scsi/FlashPoint.c b/drivers/scsi/FlashPoint.c
index 5c74e4c..24a4d1a 100644
--- a/drivers/scsi/FlashPoint.c
+++ b/drivers/scsi/FlashPoint.c
@@ -6280,8 +6280,10 @@ static unsigned char FPT_scmachid(unsigned char p_card,
 		match = 1;
 
 		for (k = 0; k < ID_STRING_LENGTH; k++) {
-			if (p_id_string[k] != FPT_scamInfo[i].id_string[k])
+			if (p_id_string[k] != FPT_scamInfo[i].id_string[k]) {
 				match = 0;
+				break;
+			}
 		}
 
 		if (match) {
-- 
2.1.4

