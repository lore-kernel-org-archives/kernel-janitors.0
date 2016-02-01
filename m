From: DingXiang <dingxiang@huawei.com>
Date: Mon, 01 Feb 2016 07:05:58 +0000
Subject: [PATCH] [dm]fix NULL pointer in dm_exception_store_create() when create dm device
Message-Id: <1454310358-755-1-git-send-email-dingxiang@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: snitzer@redhat.com
Cc: stable@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, DingXiang <dingxiang@huawei.com>

In some conditions(such as umount fs failed),origin path or origin bdev or both of the two is same
as cow's.If this happens, origin dev will be freed when get cow dev in function "dm_get_device" ,
then "s->origin->dev" which used by "dm_exception_store_create" will be a NULL pointer.

Signed-off-by:Ding Xiang <dingxiang@huawei.com>
---
 drivers/md/dm-snap.c |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/drivers/md/dm-snap.c b/drivers/md/dm-snap.c
index 3766386..ccf97d8 100644
--- a/drivers/md/dm-snap.c
+++ b/drivers/md/dm-snap.c
@@ -1102,6 +1102,7 @@ static void stop_merge(struct dm_snapshot *s)
 static int snapshot_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 {
 	struct dm_snapshot *s;
+	struct block_device *origin_bdev, *cow_bdev;
 	int i;
 	int r = -EINVAL;
 	char *origin_path, *cow_path;
@@ -1136,10 +1137,19 @@ static int snapshot_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 		goto bad_origin;
 	}
 
+	origin_bdev = s->origin->bdev;
 	cow_path = argv[0];
 	argv++;
 	argc--;
 
+	/*check cow dev is available*/
+	cow_bdev = lookup_bdev(cow_path);
+	if(cow_bdev->bd_dev = origin_bdev->bd_dev){
+		ti->error = "Invalid COW device";
+		r = -EINVAL;
+		goto bad_cow;
+	}
+
 	r = dm_get_device(ti, cow_path, dm_table_get_mode(ti->table), &s->cow);
 	if (r) {
 		ti->error = "Cannot get COW device";
-- 
1.7.1

