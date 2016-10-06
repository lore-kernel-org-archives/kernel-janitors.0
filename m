From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 06 Oct 2016 08:51:25 +0000
Subject: [PATCH 01/54] md/raid0: Use kcalloc() in create_strip_zones()
Message-Id: <2eaf3755-ff33-39e0-517c-c968d148f862@users.sourceforge.net>
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
Date: Tue, 4 Oct 2016 10:10:52 +0200

* Multiplications for the size determination of memory allocations
  indicated that array data structures should be processed.
  Thus use the corresponding function "kcalloc".

  This issue was detected by using the Coccinelle software.

* Replace the specification of data types by pointer dereferences
  to make the corresponding size determination a bit safer according to
  the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/md/raid0.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/md/raid0.c b/drivers/md/raid0.c
index 258986a..50e8a63 100644
--- a/drivers/md/raid0.c
+++ b/drivers/md/raid0.c
@@ -150,12 +150,13 @@ static int create_strip_zones(struct mddev *mddev, struct r0conf **private_conf)
 	}
 
 	err = -ENOMEM;
-	conf->strip_zone = kzalloc(sizeof(struct strip_zone)*
-				conf->nr_strip_zones, GFP_KERNEL);
+	conf->strip_zone = kcalloc(conf->nr_strip_zones,
+				   sizeof(*conf->strip_zone),
+				   GFP_KERNEL);
 	if (!conf->strip_zone)
 		goto abort;
-	conf->devlist = kzalloc(sizeof(struct md_rdev*)*
-				conf->nr_strip_zones*mddev->raid_disks,
+	conf->devlist = kcalloc(conf->nr_strip_zones * mddev->raid_disks,
+				sizeof(*conf->devlist),
 				GFP_KERNEL);
 	if (!conf->devlist)
 		goto abort;
-- 
2.10.1

