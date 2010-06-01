From: Dan Carpenter <error27@gmail.com>
Date: Tue, 01 Jun 2010 07:09:33 +0000
Subject: [patch 2/2] caif: add newlines after declarations in caif_serial.c
Message-Id: <20100601070933.GE5483@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sjur Braendeland <sjur.brandeland@stericsson.com>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, "David S. Miller" <davem@davemloft.net>

I added newlines after the declarations in caif_serial.c.  This is
normal kernel style, although I can't see anywhere it's documented.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/net/caif/caif_serial.c b/drivers/net/caif/caif_serial.c
index f30a6a0..3e706f0 100644
--- a/drivers/net/caif/caif_serial.c
+++ b/drivers/net/caif/caif_serial.c
@@ -174,6 +174,7 @@ static void ldisc_receive(struct tty_struct *tty, const u8 *data,
 	struct ser_device *ser;
 	int ret;
 	u8 *p;
+
 	ser = tty->disc_data;
 
 	/*
@@ -221,6 +222,7 @@ static int handle_tx(struct ser_device *ser)
 	struct tty_struct *tty;
 	struct sk_buff *skb;
 	int tty_wr, len, room;
+
 	tty = ser->tty;
 	ser->tx_started = true;
 
@@ -281,6 +283,7 @@ error:
 static int caif_xmit(struct sk_buff *skb, struct net_device *dev)
 {
 	struct ser_device *ser;
+
 	BUG_ON(dev = NULL);
 	ser = netdev_priv(dev);
 
@@ -299,6 +302,7 @@ static int caif_xmit(struct sk_buff *skb, struct net_device *dev)
 static void ldisc_tx_wakeup(struct tty_struct *tty)
 {
 	struct ser_device *ser;
+
 	ser = tty->disc_data;
 	BUG_ON(ser = NULL);
 	BUG_ON(ser->tty != tty);
@@ -348,6 +352,7 @@ static void ldisc_close(struct tty_struct *tty)
 	struct ser_device *ser = tty->disc_data;
 	/* Remove may be called inside or outside of rtnl_lock */
 	int islocked = rtnl_is_locked();
+
 	if (!islocked)
 		rtnl_lock();
 	/* device is freed automagically by net-sysfs */
@@ -374,6 +379,7 @@ static struct tty_ldisc_ops caif_ldisc = {
 static int register_ldisc(void)
 {
 	int result;
+
 	result = tty_register_ldisc(N_CAIF, &caif_ldisc);
 	if (result < 0) {
 		pr_err("cannot register CAIF ldisc=%d err=%d\n", N_CAIF,
@@ -391,6 +397,7 @@ static const struct net_device_ops netdev_ops = {
 static void caifdev_setup(struct net_device *dev)
 {
 	struct ser_device *serdev = netdev_priv(dev);
+
 	dev->features = 0;
 	dev->netdev_ops = &netdev_ops;
 	dev->type = ARPHRD_CAIF;
@@ -423,6 +430,7 @@ static int caif_net_close(struct net_device *dev)
 static int __init caif_ser_init(void)
 {
 	int ret;
+
 	ret = register_ldisc();
 	debugfsdir = debugfs_create_dir("caif_serial", NULL);
 	return ret;
@@ -433,6 +441,7 @@ static void __exit caif_ser_exit(void)
 	struct ser_device *ser = NULL;
 	struct list_head *node;
 	struct list_head *_tmp;
+
 	list_for_each_safe(node, _tmp, &ser_list) {
 		ser = list_entry(node, struct ser_device, node);
 		dev_close(ser->dev);
