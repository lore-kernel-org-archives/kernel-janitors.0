From: Tobias Klauser <tklauser@distanz.ch>
Date: Thu, 09 Dec 2010 14:55:21 +0000
Subject: [PATCH] exofs: Remove redundant unlikely()
Message-Id: <1291906521-1087-1-git-send-email-tklauser@distanz.ch>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

IS_ERR() already implies unlikely(), so it can be omitted here.

Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
---
 fs/exofs/super.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/fs/exofs/super.c b/fs/exofs/super.c
index 79c3ae6..b2b12a8 100644
--- a/fs/exofs/super.c
+++ b/fs/exofs/super.c
@@ -488,7 +488,7 @@ static int exofs_read_lookup_dev_table(struct exofs_sb_info **psbi,
 		}
 
 		od = osduld_info_lookup(&odi);
-		if (unlikely(IS_ERR(od))) {
+		if (IS_ERR(od)) {
 			ret = PTR_ERR(od);
 			EXOFS_ERR("ERROR: device requested is not found "
 				  "osd_name-%s =>%d\n", odi.osdname, ret);
-- 
1.7.0.4

