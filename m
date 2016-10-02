From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 02 Oct 2016 12:08:26 +0000
Subject: [PATCH 11/13] md/multipath: Move a brace for a designated initialiser
Message-Id: <ff5aa5a5-8bcb-6a69-b4a5-4f5f15fc51f9@users.sourceforge.net>
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
Date: Sun, 2 Oct 2016 10:43:28 +0200

The script "checkpatch.pl" pointed information out like the following.

ERROR: that open brace { should be on the previous line

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/md/multipath.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/md/multipath.c b/drivers/md/multipath.c
index 23c7c29..ab6487c 100644
--- a/drivers/md/multipath.c
+++ b/drivers/md/multipath.c
@@ -485,8 +485,7 @@ static void multipath_free(struct mddev *mddev, void *priv)
 	kfree(conf);
 }
 
-static struct md_personality multipath_personality -{
+static struct md_personality multipath_personality = {
 	.name            = "multipath",
 	.level           = LEVEL_MULTIPATH,
 	.owner           = THIS_MODULE,
-- 
2.10.0

