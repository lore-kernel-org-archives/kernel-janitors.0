From: Colin King <colin.king@canonical.com>
Date: Sat, 12 Aug 2017 21:45:53 +0000
Subject: [PATCH] virtio-net: make array guest_offloads static
Message-Id: <20170812214553.6073-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, virtualization@lists.linux-foundation.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The array guest_offloads is local to the source and does not need to
be in global scope, so make it static. Also tweak formatting.

Cleans up sparse warnings:
symbol 'guest_offloads' was not declared. Should it be static?

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/virtio_net.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
index e90de2186ffc..a3f3c66b4530 100644
--- a/drivers/net/virtio_net.c
+++ b/drivers/net/virtio_net.c
@@ -57,10 +57,12 @@ DECLARE_EWMA(pkt_len, 0, 64)
 
 #define VIRTNET_DRIVER_VERSION "1.0.0"
 
-const unsigned long guest_offloads[] = { VIRTIO_NET_F_GUEST_TSO4,
-					 VIRTIO_NET_F_GUEST_TSO6,
-					 VIRTIO_NET_F_GUEST_ECN,
-					 VIRTIO_NET_F_GUEST_UFO };
+static const unsigned long guest_offloads[] = {
+	VIRTIO_NET_F_GUEST_TSO4,
+	VIRTIO_NET_F_GUEST_TSO6,
+	VIRTIO_NET_F_GUEST_ECN,
+	VIRTIO_NET_F_GUEST_UFO
+};
 
 struct virtnet_stats {
 	struct u64_stats_sync tx_syncp;
-- 
2.11.0

