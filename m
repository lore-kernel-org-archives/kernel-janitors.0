From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 06 Oct 2016 08:59:06 +0000
Subject: [PATCH 06/54] md/raid0: Delete four unwanted spaces behind function names
Message-Id: <5cd9b9c4-7c16-1173-2bff-d24ec5fd2863@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <786843ef-4b6f-eb04-7326-2f6f5b408826@users.sourceforge.net>
In-Reply-To: <786843ef-4b6f-eb04-7326-2f6f5b408826@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-raid@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Guoqing Jiang <gqjiang@suse.com>, Jens Axboe <axboe@fb.com>, Mike Christie <mchristi@redhat.com>, Neil Brown <neilb@suse.com>, Shaohua Li <shli@kernel.org>, Tomasz Majchrzak <tomasz.majchrzak@intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 4 Oct 2016 14:21:21 +0200

The script "checkpatch.pl" pointed information out like the following.

WARNING: space prohibited between function name and open parenthesis '('

Thus fix the affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/md/raid0.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/md/raid0.c b/drivers/md/raid0.c
index 0315f1e..06cb172 100644
--- a/drivers/md/raid0.c
+++ b/drivers/md/raid0.c
@@ -680,14 +680,14 @@ static struct md_personality raid0_personality 	.congested	= raid0_congested,
 };
 
-static int __init raid0_init (void)
+static int __init raid0_init(void)
 {
-	return register_md_personality (&raid0_personality);
+	return register_md_personality(&raid0_personality);
 }
 
-static void raid0_exit (void)
+static void raid0_exit(void)
 {
-	unregister_md_personality (&raid0_personality);
+	unregister_md_personality(&raid0_personality);
 }
 
 module_init(raid0_init);
-- 
2.10.1

