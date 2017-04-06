From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 06 Apr 2017 09:04:47 +0000
Subject: [PATCH] virtio_net: tidy a couple debug statements
Message-Id: <20170406090446.GA29939@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: kernel-janitors@vger.kernel.org, virtualization@lists.linux-foundation.org

We are printing a decimal value for truesize so we shouldn't use an "0x"
prefix.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
index 0e6e3acf6ff1..2b5e8069d9e5 100644
--- a/drivers/net/virtio_net.c
+++ b/drivers/net/virtio_net.c
@@ -668,7 +668,7 @@ static struct sk_buff *receive_mergeable(struct net_device *dev,
 	rcu_read_unlock();
 
 	if (unlikely(len > (unsigned long)ctx)) {
-		pr_debug("%s: rx error: len %u exceeds truesize 0x%lu\n",
+		pr_debug("%s: rx error: len %u exceeds truesize %lu\n",
 			 dev->name, len, (unsigned long)ctx);
 		dev->stats.rx_length_errors++;
 		goto err_skb;
@@ -694,7 +694,7 @@ static struct sk_buff *receive_mergeable(struct net_device *dev,
 
 		page = virt_to_head_page(buf);
 		if (unlikely(len > (unsigned long)ctx)) {
-			pr_debug("%s: rx error: len %u exceeds truesize 0x%lu\n",
+			pr_debug("%s: rx error: len %u exceeds truesize %lu\n",
 				 dev->name, len, (unsigned long)ctx);
 			dev->stats.rx_length_errors++;
 			goto err_skb;
