From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 22 Feb 2016 19:31:31 +0000
Subject: [patch 2/6] Staging: gdm72xx: silence underflow warning in netlink_send()
Message-Id: <20160222193131.GB23565@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alison Schofield <amsfield22@gmail.com>, Masanari Iida <standby24x7@gmail.com>, Shraddha Barke <shraddha.6596@gmail.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The value of "group" comes from "idx" in __gdm_wimax_event_send():

	if (sscanf(e->dev->name, "wm%d", &idx) = 1)

Smatch marks sscanf values as user controlled.  It's supposed to be a
number in 0-30 range.  We cap the upper bound but allow negatives.  Fix
this by making it type u16 instead.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/gdm72xx/netlink_k.h b/drivers/staging/gdm72xx/netlink_k.h
index 1fe7198..1914347 100644
--- a/drivers/staging/gdm72xx/netlink_k.h
+++ b/drivers/staging/gdm72xx/netlink_k.h
@@ -20,6 +20,6 @@
 struct sock *netlink_init(int unit, void (*cb)(struct net_device *dev, u16 type,
 					       void *msg, int len));
 void netlink_exit(struct sock *sock);
-int netlink_send(struct sock *sock, int group, u16 type, void *msg, int len);
+int netlink_send(struct sock *sock, u16 group, u16 type, void *msg, int len);
 
 #endif /* __GDM72XX_NETLINK_K_H__ */
diff --git a/drivers/staging/gdm72xx/netlink_k.c b/drivers/staging/gdm72xx/netlink_k.c
index 4089b17..96c9034 100644
--- a/drivers/staging/gdm72xx/netlink_k.c
+++ b/drivers/staging/gdm72xx/netlink_k.c
@@ -114,7 +114,7 @@ void netlink_exit(struct sock *sock)
 	netlink_kernel_release(sock);
 }
 
-int netlink_send(struct sock *sock, int group, u16 type, void *msg, int len)
+int netlink_send(struct sock *sock, u16 group, u16 type, void *msg, int len)
 {
 	static u32 seq;
 	struct sk_buff *skb = NULL;
