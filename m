From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Fri, 22 Sep 2017 19:35:53 +0000
Subject: [PATCH] staging: rtl8192u: Check some memory allocation failure
Message-Id: <20170922193553.16358-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@linuxfoundation.org, singhalsimran0@gmail.com, baoyou.xie@linaro.org, davem@davemloft.net, jarod@redhat.com, szekelyszilv@gmail.com, elia.f.geretto@gmail.com, gs051095@gmail.com, shreeya.patel23498@gmail.com, robsonde@gmail.com, colin.king@canonical.com
Cc: devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

If one of these memory allocations fail, a NULL pointer dereference will
occur later on.
Return -ENOMEM instead.

There is no need to free the resources already allocated, this is done
by the caller (i.e. 'rtl8192_usb_probe()') which calls
'rtl8192_usb_deleteendpoints()'.

The calling graph is:
rtl8192_usb_probe
  --> rtl8192_init
    --> rtl8192_usb_initendpoints

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
The error handling path in 'rtl8192_usb_probe' must also be fixed because
it is bogus. Will do that in another patch.
---
 drivers/staging/rtl8192u/r8192U_core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/staging/rtl8192u/r8192U_core.c b/drivers/staging/rtl8192u/r8192U_core.c
index 46b3f19e0878..48b7fd071900 100644
--- a/drivers/staging/rtl8192u/r8192U_core.c
+++ b/drivers/staging/rtl8192u/r8192U_core.c
@@ -1687,9 +1687,13 @@ static short rtl8192_usb_initendpoints(struct net_device *dev)
 #ifndef JACKSON_NEW_RX
 	for (i = 0; i < (MAX_RX_URB + 1); i++) {
 		priv->rx_urb[i] = usb_alloc_urb(0, GFP_KERNEL);
+		if (!priv->rx_urb[i])
+			return -ENOMEM;
 
 		priv->rx_urb[i]->transfer_buffer  			kmalloc(RX_URB_SIZE, GFP_KERNEL);
+		if (!priv->rx_urb[i]->transfer_buffer)
+			return -ENOMEM;
 
 		priv->rx_urb[i]->transfer_buffer_length = RX_URB_SIZE;
 	}
-- 
2.11.0

