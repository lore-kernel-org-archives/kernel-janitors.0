From: Colin King <colin.king@canonical.com>
Date: Fri, 08 May 2020 22:24:03 +0000
Subject: [PATCH] caif: remove redundant assignment to variable err
Message-Id: <20200508222403.483041-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S . Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable err is being initializeed with a value that is never read
and it is being updated later with a new value. The initialization
is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/caif/caif_virtio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/caif/caif_virtio.c b/drivers/net/caif/caif_virtio.c
index eb426822ad06..35c916741df6 100644
--- a/drivers/net/caif/caif_virtio.c
+++ b/drivers/net/caif/caif_virtio.c
@@ -652,7 +652,7 @@ static int cfv_probe(struct virtio_device *vdev)
 	const char *cfv_netdev_name = "cfvrt";
 	struct net_device *netdev;
 	struct cfv_info *cfv;
-	int err = -EINVAL;
+	int err;
 
 	netdev = alloc_netdev(sizeof(struct cfv_info), cfv_netdev_name,
 			      NET_NAME_UNKNOWN, cfv_netdev_setup);
-- 
2.25.1
