From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 02 Oct 2016 12:00:16 +0000
Subject: [PATCH 4/13] md/multipath: Reduce indentation for four lines in multipath_run()
Message-Id: <390b57db-cd99-0731-55cb-68ce7da549cb@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <4a31d7a7-f70c-12f7-202f-963bd8706066@users.sourceforge.net>
In-Reply-To: <4a31d7a7-f70c-12f7-202f-963bd8706066@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-raid@vger.kernel.org, Jens Axboe <axboe@fb.com>, NeilBrown <neilb@suse.com>, Shaohua Li <shli@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 1 Oct 2016 21:26:00 +0200

* Delete a pair of extra curly brackets.

* Reduce indentation one level for a few lines in this function.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/md/multipath.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/md/multipath.c b/drivers/md/multipath.c
index be7c0b9..7900426 100644
--- a/drivers/md/multipath.c
+++ b/drivers/md/multipath.c
@@ -443,12 +443,9 @@ static int multipath_run (struct mddev *mddev)
 	if (!conf->pool)
 		goto out_free_conf;
 
-	{
-		mddev->thread = md_register_thread(multipathd, mddev,
-						   "multipath");
-		if (!mddev->thread)
-			goto out_free_conf;
-	}
+	mddev->thread = md_register_thread(multipathd, mddev, "multipath");
+	if (!mddev->thread)
+		goto out_free_conf;
 
 	printk(KERN_INFO
 		"multipath: array %s active with %d out of %d IO paths\n",
-- 
2.10.0

