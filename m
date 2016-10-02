From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 02 Oct 2016 11:57:45 +0000
Subject: [PATCH 2/13] md/multipath: Improve another size determination in multipath_run()
Message-Id: <f81efadb-18cd-4975-075c-31f3e3f28d01@users.sourceforge.net>
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
Date: Sat, 1 Oct 2016 20:52:57 +0200

Replace the specification of a data structure by a pointer dereference
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/md/multipath.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/md/multipath.c b/drivers/md/multipath.c
index bd53451..7fdabb1 100644
--- a/drivers/md/multipath.c
+++ b/drivers/md/multipath.c
@@ -399,7 +399,7 @@ static int multipath_run (struct mddev *mddev)
 	 * should be freed in multipath_free()]
 	 */
 
-	conf = kzalloc(sizeof(struct mpconf), GFP_KERNEL);
+	conf = kzalloc(sizeof(*conf), GFP_KERNEL);
 	mddev->private = conf;
 	if (!conf) {
 		printk(KERN_ERR
-- 
2.10.0

