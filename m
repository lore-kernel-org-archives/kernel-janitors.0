From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 06 Oct 2016 09:12:58 +0000
Subject: [PATCH 16/54] md/raid1: Delete an error message for a failed memory allocation
Message-Id: <d8ac64c7-88ae-ae2d-c625-4603abaa4126@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <786843ef-4b6f-eb04-7326-2f6f5b408826@users.sourceforge.net>
In-Reply-To: <786843ef-4b6f-eb04-7326-2f6f5b408826@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-raid@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Guoqing Jiang <gqjiang@suse.com>, Jens Axboe <axboe@fb.com>, Mike Christie <mchristi@redhat.com>, Neil Brown <neilb@suse.com>, Shaohua Li <shli@kernel.org>, Tomasz Majchrzak <tomasz.majchrzak@intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, Wolfram Sang <wsa@the-dreams.de>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 4 Oct 2016 18:15:20 +0200

Omit an extra message for a memory allocation failure in this function.

Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/md/raid1.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/md/raid1.c b/drivers/md/raid1.c
index 7dc45ba..15b9652 100644
--- a/drivers/md/raid1.c
+++ b/drivers/md/raid1.c
@@ -2882,9 +2882,6 @@ static struct r1conf *setup_conf(struct mddev *mddev)
 
 	conf->thread = md_register_thread(raid1d, mddev, "raid1");
 	if (!conf->thread) {
-		printk(KERN_ERR
-		       "md/raid1:%s: couldn't allocate thread\n",
-		       mdname(mddev));
 		err = -ENOMEM;
 		goto destroy_pool;
 	}
-- 
2.10.1

