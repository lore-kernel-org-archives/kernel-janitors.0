From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 06 Oct 2016 09:40:01 +0000
Subject: [PATCH 40/54] md/raid10: Use kcalloc() in two functions
Message-Id: <4c7682bf-fef4-a9a2-9205-e47fc030b683@users.sourceforge.net>
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
Date: Wed, 5 Oct 2016 16:45:05 +0200

* Multiplications for the size determination of memory allocations
  indicated that array data structures should be processed.
  Thus use the corresponding function "kcalloc".

  This issue was detected by using the Coccinelle software.

* Replace the specification of data structures by pointer dereferences
  to make the corresponding size determination a bit safer according to
  the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/md/raid10.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/md/raid10.c b/drivers/md/raid10.c
index be1a9fc..17352a9 100644
--- a/drivers/md/raid10.c
+++ b/drivers/md/raid10.c
@@ -3504,8 +3504,8 @@ static struct r10conf *setup_conf(struct mddev *mddev)
 		goto out;
 
 	/* FIXME calc properly */
-	conf->mirrors = kzalloc(sizeof(struct raid10_info)*(mddev->raid_disks +
-							    max(0,-mddev->delta_disks)),
+	conf->mirrors = kcalloc(mddev->raid_disks + max(0, -mddev->delta_disks),
+				sizeof(*conf->mirrors),
 				GFP_KERNEL);
 	if (!conf->mirrors)
 		goto out;
@@ -3936,11 +3936,10 @@ static int raid10_check_reshape(struct mddev *mddev)
 	conf->mirrors_new = NULL;
 	if (mddev->delta_disks > 0) {
 		/* allocate new 'mirrors' list */
-		conf->mirrors_new = kzalloc(
-			sizeof(struct raid10_info)
-			*(mddev->raid_disks +
-			  mddev->delta_disks),
-			GFP_KERNEL);
+		conf->mirrors_new = kcalloc(mddev->raid_disks
+					    + mddev->delta_disks,
+					    sizeof(*conf->mirrors_new),
+					    GFP_KERNEL);
 		if (!conf->mirrors_new)
 			return -ENOMEM;
 	}
-- 
2.10.1

