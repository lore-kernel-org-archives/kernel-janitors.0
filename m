From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 26 Jan 2017 19:00:08 +0000
Subject: [PATCH] macvtap: Use kmalloc_array() in macvtap_queue_resize()
Message-Id: <ca646e0a-9f04-149e-999a-df828b363861@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Francesco Ruggeri <fruggeri@arista.com>, Gao Feng <fgao@48lvckh6395k16k5.yundunddos.com>, Jason Wang <jasowang@redhat.com>, Marc Angel <marc@arista.com>, "Michael S. Tsirkin" <mst@redhat.com>, Mike Rapoport <rppt@linux.vnet.ibm.com>, Willem de Bruijn <willemb@google.com>, Zhang Shengju <zhangshengju@cmss.chinamobile.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 26 Jan 2017 19:47:38 +0100

A multiplication for the size determination of a memory allocation
indicated that an array data structure should be processed.
Thus use the corresponding function "kmalloc_array".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/net/macvtap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/macvtap.c b/drivers/net/macvtap.c
index 5c26653eceb5..1796d8f1ef47 100644
--- a/drivers/net/macvtap.c
+++ b/drivers/net/macvtap.c
@@ -1243,7 +1243,7 @@ static int macvtap_queue_resize(struct macvlan_dev *vlan)
 	int n = vlan->numqueues;
 	int ret, i = 0;
 
-	arrays = kmalloc(sizeof *arrays * n, GFP_KERNEL);
+	arrays = kmalloc_array(n, sizeof(*arrays), GFP_KERNEL);
 	if (!arrays)
 		return -ENOMEM;
 
-- 
2.11.0

