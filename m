From: Julia Lawall <julia@diku.dk>
Date: Tue, 26 Oct 2010 10:25:32 +0000
Subject: [PATCH 3/14] drivers/vhost/vhost.c: delete double assignment
Message-Id: <1288088743-3725-4-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1288088743-3725-1-git-send-email-julia@diku.dk>
In-Reply-To: <1288088743-3725-1-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtualization@lists.osdl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, netdev@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Delete successive assignments to the same location.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
expression i;
@@

*i = ...;
 i = ...;
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/vhost/vhost.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
index 94701ff..ed27727 100644
--- a/drivers/vhost/vhost.c
+++ b/drivers/vhost/vhost.c
@@ -157,7 +157,6 @@ static void vhost_vq_reset(struct vhost_dev *dev,
 	vq->avail_idx = 0;
 	vq->last_used_idx = 0;
 	vq->used_flags = 0;
-	vq->used_flags = 0;
 	vq->log_used = false;
 	vq->log_addr = -1ull;
 	vq->vhost_hlen = 0;

