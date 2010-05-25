From: Dan Carpenter <error27@gmail.com>
Date: Tue, 25 May 2010 09:40:17 +0000
Subject: [patch] md/raid10: check for ERR_PTR returns from setup_conf()
Message-Id: <20100525094017.GD22515@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Neil Brown <neilb@suse.de>
Cc: Andre Noll <maan@systemlinux.org>, Robert Becker <Rob.Becker@riverbed.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Jens Axboe <jens.axboe@oracle.com>, linux-raid@vger.kernel.org, kernel-janitors@vger.kernel.org

setup_conf() can return error values so I added a check for that here.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/md/raid10.c b/drivers/md/raid10.c
index 0372499..8bd7da2 100644
--- a/drivers/md/raid10.c
+++ b/drivers/md/raid10.c
@@ -2454,6 +2454,8 @@ static void *raid10_takeover_raid0(mddev_t *mddev)
 	mddev->recovery_cp = MaxSector;
 
 	conf = setup_conf(mddev);
+	if (IS_ERR(conf))
+		return conf;
 	conf->scale_disks = 2;
 	return conf;
 }
