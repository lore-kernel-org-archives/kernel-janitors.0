From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 08 Aug 2020 09:32:07 +0000
Subject: [PATCH] vdpa/mlx5: Missing error code on allocation failure
Message-Id: <20200808093207.GA115053@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>, Eli Cohen <eli@mellanox.com>, Parav Pandit <parav@mellanox.com>, virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

This should return -ENOMEM if the allocation fails.  Currently it
either returns success or an uninitialized value.

Fixes: 94abbccdf291 ("vdpa/mlx5: Add shared memory registration code")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/vdpa/mlx5/core/mr.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/vdpa/mlx5/core/mr.c b/drivers/vdpa/mlx5/core/mr.c
index f5dec0274133..ef1c550f8266 100644
--- a/drivers/vdpa/mlx5/core/mr.c
+++ b/drivers/vdpa/mlx5/core/mr.c
@@ -319,8 +319,10 @@ static int add_direct_chain(struct mlx5_vdpa_dev *mvdev, u64 start, u64 size, u8
 	while (size) {
 		sz = (u32)min_t(u64, MAX_KLM_SIZE, size);
 		dmr = kzalloc(sizeof(*dmr), GFP_KERNEL);
-		if (!dmr)
+		if (!dmr) {
+			err = -ENOMEM;
 			goto err_alloc;
+		}
 
 		dmr->start = st;
 		dmr->end = st + sz;
-- 
2.27.0
