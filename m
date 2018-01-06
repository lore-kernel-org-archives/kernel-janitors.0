From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 06 Jan 2018 09:26:43 +0000
Subject: [PATCH] dm mpath: potential NULL dereference with parse_path()
Message-Id: <20180106092643.pq67kkzj2jsjlvzy@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>
Cc: dm-devel@redhat.com, kernel-janitors@vger.kernel.org

We forgot to set the error code on this path so it means we accidentally
return NULL.  The caller is expecting error pointers and will crash
with a NULL dereference.

Fixes: faf782b1c93d ("dm mpath: optimize NVMe bio-based support")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/md/dm-mpath.c b/drivers/md/dm-mpath.c
index d1f32103ae86..0436a5466281 100644
--- a/drivers/md/dm-mpath.c
+++ b/drivers/md/dm-mpath.c
@@ -883,6 +883,7 @@ static struct pgpath *parse_path(struct dm_arg_set *as, struct path_selector *ps
 		INIT_DELAYED_WORK(&p->activate_path, activate_path_work);
 		if (setup_scsi_dh(p->path.dev->bdev, m, &ti->error)) {
 			dm_put_device(ti, p->path.dev);
+			r = -EINVAL;
 			goto bad;
 		}
 	}
