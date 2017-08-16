From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 16 Aug 2017 16:14:52 +0000
Subject: [PATCH 1/2] fs-qnx6: Delete an error message for a failed memory allocation in qnx6_mmi_fill_super()
Message-Id: <888c8fc4-11bb-008b-7396-be4fd2a695a7@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <55b824fd-3f8a-4ca6-583f-27f584cd237a@users.sourceforge.net>
In-Reply-To: <55b824fd-3f8a-4ca6-583f-27f584cd237a@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fabian Frederick <fabf@skynet.be>, Kai Bankett <chaosman@ontika.net>, kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 16 Aug 2017 17:07:26 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 fs/qnx6/super_mmi.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/fs/qnx6/super_mmi.c b/fs/qnx6/super_mmi.c
index 62aaf3e3126a..fdcfc99e2db6 100644
--- a/fs/qnx6/super_mmi.c
+++ b/fs/qnx6/super_mmi.c
@@ -100,10 +100,8 @@ struct qnx6_super_block *qnx6_mmi_fill_super(struct super_block *s, int silent)
 	}
 
 	qsb = kmalloc(sizeof(*qsb), GFP_KERNEL);
-	if (!qsb) {
-		pr_err("unable to allocate memory.\n");
+	if (!qsb)
 		goto out;
-	}
 
 	if (fs64_to_cpu(sbi, sb1->sb_serial) >
 					fs64_to_cpu(sbi, sb2->sb_serial)) {
-- 
2.14.0

