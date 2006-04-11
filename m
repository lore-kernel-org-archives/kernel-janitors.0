From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Tue, 11 Apr 2006 21:25:41 +0000
Subject: [KJ] [Patch] cleanup inode->r_dev usage in arch/cris
Message-Id: <1144790741.13849.2.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============033334751597169365=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============033334751597169365==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

imajor()/iminor() should be used instead of accessing r_dev
directly. This patch cleans up arch/cris

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.17-rc1/arch/cris/arch-v10/drivers/eeprom.c.orig	2006-04-11 23:18:21.000000000 +0200
+++ linux-2.6.17-rc1/arch/cris/arch-v10/drivers/eeprom.c	2006-04-11 23:18:55.000000000 +0200
@@ -451,9 +451,9 @@ int __init eeprom_init(void)
 static int eeprom_open(struct inode * inode, struct file * file)
 {
 
-  if(MINOR(inode->i_rdev) != EEPROM_MINOR_NR)
+  if(iminor(inode) != EEPROM_MINOR_NR)
      return -ENXIO;
-  if(MAJOR(inode->i_rdev) != EEPROM_MAJOR_NR)
+  if(imajor(inode) != EEPROM_MAJOR_NR)
      return -ENXIO;
 
   if( eeprom.size > 0 )
--- linux-2.6.17-rc1/arch/cris/arch-v10/drivers/gpio.c.orig	2006-04-11 23:19:03.000000000 +0200
+++ linux-2.6.17-rc1/arch/cris/arch-v10/drivers/gpio.c	2006-04-11 23:19:18.000000000 +0200
@@ -436,7 +436,7 @@ static int
 gpio_open(struct inode *inode, struct file *filp)
 {
 	struct gpio_private *priv;
-	int p = MINOR(inode->i_rdev);
+	int p = iminor(inode);
 
 	if (p > GPIO_MINOR_LAST)
 		return -EINVAL;
--- linux-2.6.17-rc1/arch/cris/arch-v32/drivers/cryptocop.c.orig	2006-04-11 23:19:34.000000000 +0200
+++ linux-2.6.17-rc1/arch/cris/arch-v32/drivers/cryptocop.c	2006-04-11 23:19:47.000000000 +0200
@@ -2302,7 +2302,7 @@ static int cryptocop_job_setup(struct cr
 
 static int cryptocop_open(struct inode *inode, struct file *filp)
 {
-	int p = MINOR(inode->i_rdev);
+	int p = iminor(inode);
 
 	if (p != CRYPTOCOP_MINOR) return -EINVAL;
 
--- linux-2.6.17-rc1/arch/cris/arch-v32/drivers/gpio.c.orig	2006-04-11 23:19:56.000000000 +0200
+++ linux-2.6.17-rc1/arch/cris/arch-v32/drivers/gpio.c	2006-04-11 23:20:10.000000000 +0200
@@ -419,7 +419,7 @@ static int
 gpio_open(struct inode *inode, struct file *filp)
 {
 	struct gpio_private *priv;
-	int p = MINOR(inode->i_rdev);
+	int p = iminor(inode);
 
 	if (p > GPIO_MINOR_LAST)
 		return -EINVAL;
--- linux-2.6.17-rc1/arch/cris/arch-v32/drivers/sync_serial.c.orig	2006-04-11 23:20:18.000000000 +0200
+++ linux-2.6.17-rc1/arch/cris/arch-v32/drivers/sync_serial.c	2006-04-11 23:21:45.000000000 +0200
@@ -341,7 +341,7 @@ static inline int sync_data_avail_to_end
 
 static int sync_serial_open(struct inode *inode, struct file *file)
 {
-	int dev = MINOR(inode->i_rdev);
+	int dev = iminor(inode);
 	sync_port* port;
 	reg_dma_rw_cfg cfg = {.en = regk_dma_yes};
 	reg_dma_rw_intr_mask intr_mask = {.data = regk_dma_yes};
@@ -487,7 +487,7 @@ static int sync_serial_open(struct inode
 
 static int sync_serial_release(struct inode *inode, struct file *file)
 {
-	int dev = MINOR(inode->i_rdev);
+	int dev = iminor(inode);
 	sync_port* port;
 
 	if (dev < 0 || dev >= NUMBER_OF_PORTS || !ports[dev].enabled)
@@ -505,7 +505,7 @@ static int sync_serial_release(struct in
 
 static unsigned int sync_serial_poll(struct file *file, poll_table *wait)
 {
-	int dev = MINOR(file->f_dentry->d_inode->i_rdev);
+	int dev = iminor(file->f_dentry->d_inode);
 	unsigned int mask = 0;
 	sync_port* port;
 	DEBUGPOLL( static unsigned int prev_mask = 0; );
@@ -532,7 +532,7 @@ static int sync_serial_ioctl(struct inod
 		  unsigned int cmd, unsigned long arg)
 {
 	int return_val = 0;
-	int dev = MINOR(file->f_dentry->d_inode->i_rdev);
+	int dev = iminor(file->f_dentry->d_inode);
 	sync_port* port;
 	reg_sser_rw_tr_cfg tr_cfg;
 	reg_sser_rw_rec_cfg rec_cfg;
@@ -790,7 +790,7 @@ static int sync_serial_ioctl(struct inod
 static ssize_t sync_serial_write(struct file * file, const char * buf,
                                  size_t count, loff_t *ppos)
 {
-	int dev = MINOR(file->f_dentry->d_inode->i_rdev);
+	int dev = iminor(file->f_dentry->d_inode);
 	DECLARE_WAITQUEUE(wait, current);
 	sync_port *port;
 	unsigned long c, c1;
@@ -920,7 +920,7 @@ static ssize_t sync_serial_write(struct 
 static ssize_t sync_serial_read(struct file * file, char * buf,
 				size_t count, loff_t *ppos)
 {
-	int dev = MINOR(file->f_dentry->d_inode->i_rdev);
+	int dev = iminor(file->f_dentry->d_inode);
 	int avail;
 	sync_port *port;
 	unsigned char* start;



--===============033334751597169365==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============033334751597169365==--
