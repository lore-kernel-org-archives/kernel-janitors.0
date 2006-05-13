From: Matthew Martin <lihnucks@gmail.com>
Date: Sat, 13 May 2006 20:01:18 +0000
Subject: [KJ] [PATCH] Make functions static in drivers/cdrom/
Message-Id: <44663B0E.6060506@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello,
    This makes some functions static in the drivers/cdrom folder. The 
files changed are cdu31a.c, mcdx.c, sbpcd.c 
cdrom.c, and cm206.c.

---

--- vanilla-linux-2.6.16/drivers/cdrom/cdu31a.c    2006-05-11 
23:05:43.000000000 -0500
+++ linux-2.6.16/drivers/cdrom/cdu31a.c    2006-05-13 10:13:57.000000000 
-0500
@@ -3067,7 +3067,7 @@ __setup("cdu31a=", cdu31a_setup);
 /*
  * Initialize the driver.
  */
-int __init cdu31a_init(void)
+static int __init cdu31a_init(void)
 {
     struct s_sony_drive_config drive_config;
     struct gendisk *disk;

--- vanilla-linux-2.6.16/drivers/cdrom/mcdx.c    2006-03-19 
23:53:29.000000000 -0600
+++ linux-2.6.16/drivers/cdrom/mcdx.c    2006-05-13 10:39:09.000000000 -0500
@@ -1006,7 +1006,7 @@ static int mcdx_talk(struct s_drive_stuf
 
 /* MODULE STUFF 
***********************************************************/
 
-int __mcdx_init(void)
+static int __mcdx_init(void)
 {
     int i;
     int drives = 0;
@@ -1525,7 +1525,7 @@ static unsigned int msf2log(const struct
         + bcd2uint(pmsf->minute) * 4500 - CD_MSF_OFFSET;
 }
 
-int mcdx_readtoc(struct s_drive_stuff *stuffp)
+static int mcdx_readtoc(struct s_drive_stuff *stuffp)
 /*  Read the toc entries from the CD,
  *  Return: -1 on failure, else 0 */
 {

--- vanilla-linux-2.6.16/drivers/cdrom/sbpcd.c    2006-05-11 
23:05:43.000000000 -0500
+++ linux-2.6.16/drivers/cdrom/sbpcd.c    2006-05-13 13:46:41.000000000 
-0500
@@ -5510,7 +5510,7 @@ static struct cdrom_device_ops sbpcd_dop
  *
  */
 
-int sbpcd_setup(char *s)
+static int sbpcd_setup(char *s)
 {
 #ifndef MODULE
     int p[4];
@@ -5635,9 +5635,9 @@ static int __init config_spea(void)
 
 /* FIXME: cleanups after failed allocations are too ugly for words */
 #ifdef MODULE
-int __init __sbpcd_init(void)
+static int __init __sbpcd_init(void)
 #else
-int __init sbpcd_init(void)
+static int __init sbpcd_init(void)
 #endif
 {
     int i=0, j=0;

--- vanilla-linux-2.6.16/drivers/cdrom/cdrom.c    2006-05-11 
23:05:43.000000000 -0500
+++ linux-2.6.16/drivers/cdrom/cdrom.c    2006-05-12 16:47:06.000000000 
-0500
@@ -1141,7 +1141,7 @@ clean_up_and_return:
 /* This code is similar to that in open_for_data. The routine is called
    whenever an audio play operation is requested.
 */
-int check_for_audio_disc(struct cdrom_device_info * cdi,
+static int check_for_audio_disc(struct cdrom_device_info * cdi,
              struct cdrom_device_ops * cdo)
 {
         int ret;

--- vanilla-linux-2.6.16/drivers/cdrom/cm206.c    2006-05-11 
23:05:43.000000000 -0500
+++ linux-2.6.16/drivers/cdrom/cm206.c    2006-05-13 10:30:12.000000000 
-0500
@@ -641,7 +641,7 @@ static int read_background(int start, in
 #else
 /* this routine implements insw(,,). There was a time i had the
    impression that there would be any difference in error-behaviour. */
-void transport_data(int port, ush * dest, int count)
+static void transport_data(int port, ush * dest, int count)
 {
     int i;
     ush *d;
@@ -915,7 +915,7 @@ static void seek(int lba)
     cd->dsb = wait_dsb();
 }
 
-uch bcdbin(unsigned char bcd)
+static uch bcdbin(unsigned char bcd)
 {                /* stolen from mcd.c! */
     return (bcd >> 4) * 10 + (bcd & 0xf);
 }
@@ -1408,7 +1408,7 @@ static int __init probe_irq(int nr)
 }
 #endif
 
-int __init cm206_init(void)
+static int __init cm206_init(void)
 {
     uch e = 0;
     long int size = sizeof(struct cm206_struct);


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
