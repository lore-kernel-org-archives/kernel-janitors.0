From: Chuck Short <zul@gentoo.org>
Date: Tue, 16 Mar 2004 20:37:51 +0000
Subject: [Kernel-janitors] tun updates Removed uneccessary casts
Message-Id: <4057659F.4090608@gentoo.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------030908010801060402030607"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------030908010801060402030607
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

This patch removes uneccasarry casts from tun.c

chuck


--------------030908010801060402030607
Content-Type: text/plain;
 name="tun-kj-audit.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="tun-kj-audit.patch"

--- linux-2.6.4.orig/drivers/net/tun.c	2004-03-11 02:55:26.000000000 +0000
+++ linux-2.6.4/drivers/net/tun.c	2004-03-16 16:50:03.000000000 +0000
@@ -70,7 +70,7 @@ static int tun_net_close(struct net_devi
 /* Net device start xmit */
 static int tun_net_xmit(struct sk_buff *skb, struct net_device *dev)
 {
-	struct tun_struct *tun = (struct tun_struct *)dev->priv;
+	struct tun_struct *tun = dev->priv;
 
 	DBG(KERN_INFO "%s: tun_net_xmit %d\n", tun->dev->name, skb->len);
 
@@ -113,14 +113,14 @@ static void tun_net_mclist(struct net_de
 
 static struct net_device_stats *tun_net_stats(struct net_device *dev)
 {
-	struct tun_struct *tun = (struct tun_struct *)dev->priv;
+	struct tun_struct *tun = dev->priv;
 	return &tun->stats;
 }
 
 /* Initialize net device. */
 static void tun_net_init(struct net_device *dev)
 {
-	struct tun_struct *tun = (struct tun_struct *)dev->priv;
+	struct tun_struct *tun = dev->priv;
    
 	switch (tun->flags & TUN_TYPE_MASK) {
 	case TUN_TUN_DEV:
@@ -153,7 +153,7 @@ static void tun_net_init(struct net_devi
 /* Poll */
 static unsigned int tun_chr_poll(struct file *file, poll_table * wait)
 {  
-	struct tun_struct *tun = (struct tun_struct *)file->private_data;
+	struct tun_struct *tun = file->private_data;
 	unsigned int mask = POLLOUT | POLLWRNORM;
 
 	if (!tun)
@@ -217,7 +217,7 @@ static __inline__ ssize_t tun_get_user(s
 static ssize_t tun_chr_writev(struct file * file, const struct iovec *iv, 
 			      unsigned long count, loff_t *pos)
 {
-	struct tun_struct *tun = (struct tun_struct *)file->private_data;
+	struct tun_struct *tun = file->private_data;
 	unsigned long i;
 	size_t len;
 
@@ -279,7 +279,7 @@ static __inline__ ssize_t tun_put_user(s
 static ssize_t tun_chr_readv(struct file *file, const struct iovec *iv,
 			    unsigned long count, loff_t *pos)
 {
-	struct tun_struct *tun = (struct tun_struct *)file->private_data;
+	struct tun_struct *tun = file->private_data;
 	DECLARE_WAITQUEUE(wait, current);
 	struct sk_buff *skb;
 	ssize_t len, ret = 0;
@@ -455,7 +455,7 @@ static int tun_set_iff(struct file *file
 static int tun_chr_ioctl(struct inode *inode, struct file *file, 
 			 unsigned int cmd, unsigned long arg)
 {
-	struct tun_struct *tun = (struct tun_struct *)file->private_data;
+	struct tun_struct *tun = file->private_data;
 
 	if (cmd == TUNSETIFF && !tun) {
 		struct ifreq ifr;
@@ -527,7 +527,7 @@ static int tun_chr_ioctl(struct inode *i
 
 static int tun_chr_fasync(int fd, struct file *file, int on)
 {
-	struct tun_struct *tun = (struct tun_struct *)file->private_data;
+	struct tun_struct *tun = file->private_data;
 	int ret;
 
 	if (!tun)
@@ -558,7 +558,7 @@ static int tun_chr_open(struct inode *in
 
 static int tun_chr_close(struct inode *inode, struct file *file)
 {
-	struct tun_struct *tun = (struct tun_struct *)file->private_data;
+	struct tun_struct *tun = file->private_data;
 
 	if (!tun)
 		return 0;

--------------030908010801060402030607
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------030908010801060402030607--
