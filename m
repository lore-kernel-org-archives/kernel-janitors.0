From: Alexander Nyberg <alexn@telia.com>
Date: Tue, 15 Jun 2004 23:45:04 +0000
Subject: [Kernel-janitors] Sparse checks #9
Message-Id: <1087343099.676.115.camel@boxen>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============43539030193758732=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============43539030193758732==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Sparse checks for drivers/

Signed-off-by: Alexander Nyberg <alexn@telia.com>

===== drivers/char/lcd.c 1.2 vs edited =====
--- 1.2/drivers/char/lcd.c      2003-09-01 01:14:08 +02:00
+++ edited/drivers/char/lcd.c   2004-06-16 00:27:01 +02:00
@@ -63,7 +63,8 @@
        struct lcd_display button_display;
        unsigned long address, a;
        int index;
-
+       struct lcd_display __user *ubuf = (struct lcd_display __user) arg;
+
        switch (cmd) {
        case LCD_On:
                udelay(150);
@@ -135,8 +136,8 @@
                 BusyCheck();
                display.cursor_address = ( LCDReadInst );
                display.cursor_address = ( display.cursor_address & 0x07F );
-               if(copy_to_user((struct lcd_display*)arg, &display, sizeof(struct lcd_display)))
-                 return -EFAULT;
+               if(copy_to_user(ubuf, &display, sizeof(struct lcd_display)))
+                       return -EFAULT;

                break;
                }
@@ -145,7 +146,7 @@
        case LCD_Set_Cursor_Pos: {
                 struct lcd_display display;

-                if(copy_from_user(&display, (struct lcd_display*)arg, sizeof(struct lcd_display)))
+                if(copy_from_user(&display, ubuf, sizeof(struct lcd_display)))
                  return -EFAULT;

                a = (display.cursor_address | kLCD_Addr );
@@ -164,8 +165,8 @@
                 BusyCheck();
                display.character = LCDReadData;

-               if(copy_to_user((struct lcd_display*)arg, &display, sizeof(struct lcd_display)))
-                 return -EFAULT;
+               if(copy_to_user(ubuf, &display, sizeof(struct lcd_display)))
+                       return -EFAULT;
                 udelay(150);
                 BusyCheck();
                 LCDWriteInst(0x10);
@@ -176,8 +177,8 @@
        case LCD_Set_Cursor:{
                 struct lcd_display display;

-                if(copy_from_user(&display, (struct lcd_display*)arg, sizeof(struct lcd_display)))
-                 return -EFAULT;
+                if(copy_from_user(&display, ubuf, sizeof(struct lcd_display)))
+                       return -EFAULT;

                 udelay(150);
                BusyCheck();
@@ -212,8 +213,8 @@
                struct lcd_display display;


-                if(copy_from_user(&display, (struct lcd_display*)arg, sizeof(struct lcd_display)))
-                 return -EFAULT;
+                if(copy_from_user(&display, ubuf, sizeof(struct lcd_display)))
+                       return -EFAULT;

                udelay(150);
                 BusyCheck();
@@ -273,9 +274,8 @@

                display.line2[ 0x27 ] = '\0';

-               if(copy_to_user((struct lcd_display*)arg, &display,
-                               sizeof(struct lcd_display)))
-                 return -EFAULT;
+               if(copy_to_user(ubuf, &display, sizeof(struct lcd_display)))
+                       return -EFAULT;
                break;
        }

@@ -285,9 +285,8 @@
                struct lcd_display led_display;


-               if(copy_from_user(&led_display, (struct lcd_display*)arg,
-                                 sizeof(struct lcd_display)))
-                 return -EFAULT;
+               if(copy_from_user(&led_display, ubuf, sizeof(struct lcd_display)))
+                       return -EFAULT;

                led_state = led_display.leds;
                LEDSet(led_state);
@@ -304,9 +303,8 @@
                 struct lcd_display led_display;


-                if(copy_from_user(&led_display, (struct lcd_display*)arg,
-                                 sizeof(struct lcd_display)))
-                 return -EFAULT;
+                if(copy_from_user(&led_display, ubuf, sizeof(struct lcd_display)))
+                       return -EFAULT;

                for (i=0;i<(int)led_display.leds;i++)
                        {
@@ -326,9 +324,8 @@
                 struct lcd_display led_display;


-                if(copy_from_user(&led_display, (struct lcd_display*)arg,
-                                 sizeof(struct lcd_display)))
-                 return -EFAULT;
+                if(copy_from_user(&led_display, ubuf, sizeof(struct lcd_display)))
+                       return -EFAULT;

                 for (i=0;i<(int)led_display.leds;i++)
                         {
@@ -343,15 +340,15 @@

        case BUTTON_Read: {
                button_display.buttons = GPIRead;
-                if(copy_to_user((struct lcd_display*)arg, &button_display, sizeof(struct lcd_display)))
-                 return -EFAULT;
+                if(copy_to_user(ubuf, &button_display, sizeof(struct lcd_display)))
+                       return -EFAULT;
                break;
        }

         case LINK_Check: {
                 button_display.buttons = *((volatile unsigned long *) (0xB0100060) );
-                if(copy_to_user((struct lcd_display*)arg, &button_display, sizeof(struct lcd_display)))
-                 return -EFAULT;
+                if(copy_to_user(ubuf, &button_display, sizeof(struct lcd_display)))
+                       return -EFAULT;
                 break;
         }

@@ -362,8 +359,8 @@
                 * in "buttons" of the structure.  We will set this to non-zero if the
                 * link is in fact up for the requested interface.  --DaveM
                 */
-               if(copy_from_user(&button_display, (struct lcd_display *)arg, sizeof(button_display)))
-                 return -EFAULT;
+               if(copy_from_user(&button_display, ubuf, sizeof(button_display)))
+                       return -EFAULT;
                iface_num = button_display.buttons;
 #if defined(CONFIG_TULIP) && 0
                if (iface_num >= 0 &&
@@ -375,8 +372,8 @@
 #endif
                        button_display.buttons = 0;

-                if(__copy_to_user((struct lcd_display*)arg, &button_display, sizeof(struct lcd_display)))
-                 return -EFAULT;
+                if(__copy_to_user(ubuf, &button_display, sizeof(struct lcd_display)))
+                       return -EFAULT;
                 break;
        }

@@ -422,7 +419,7 @@

                 struct lcd_display display;

-                if(copy_from_user(&display, (struct lcd_display*)arg, sizeof(struct lcd_display)))
+                if(copy_from_user(&display, ubuf, sizeof(struct lcd_display)))
                  return -EFAULT;
                rom = (unsigned char *) kmalloc((128),GFP_ATOMIC);
                 if ( rom == NULL ) {
@@ -471,7 +468,7 @@
                 volatile unsigned long read_addr;
                 int i;

-               user_bytes = &(((struct lcd_display *)arg)->RomImage[0]);
+               user_bytes = &ubuf->RomImage[0];

                if(!access_ok(VERIFY_WRITE, user_bytes, FLASH_SIZE))
                          return -EFAULT;
@@ -526,7 +523,7 @@

 static int lcd_waiters = 0;

-static long lcd_read(struct inode *inode, struct file *file, char *buf, unsigned long count)
+static long lcd_read(struct inode *inode, struct file *file, char __user *buf, unsigned long count)
 {
        long buttons_now;

===== drivers/char/lp_old98.c 1.4 vs edited =====
--- 1.4/drivers/char/lp_old98.c 2003-09-30 02:23:52 +02:00
+++ edited/drivers/char/lp_old98.c      2004-06-16 00:30:54 +02:00
@@ -158,7 +158,7 @@
 }

 static ssize_t lp_old98_write(struct file * file,
-                             const char * buf, size_t count,
+                             const char __user * buf, size_t count,
                              loff_t *dummy)
 {
        unsigned long total_bytes_written = 0;
@@ -337,7 +337,7 @@
                lp.wait = arg;
                break;
        case LPGETIRQ:
-               retval = put_user(0, (int *)arg);
+               retval = put_user(0, (int __user *)arg);
                break;
        case LPGETSTATUS:
                /*
@@ -346,14 +346,14 @@
                 */
                retval = put_user((inb(LP_PORT_STATUS) & LP_MASK_nBUSY)
                                        ? (LP_PBUSY | LP_PERRORP) : LP_PERRORP,
-                                       (int *)arg);
+                                       (int __user *)arg);
                break;
        case LPRESET:
                retval = lp_old98_init_device();
                break;
 #ifdef LP_STATS
        case LPGETSTATS:
-               if (copy_to_user((struct lp_stats *)arg, &lp.stats,
+               if (copy_to_user((struct lp_stats __user *)arg, &lp.stats,
                                 sizeof(struct lp_stats)))
                        retval = -EFAULT;
                else if (suser())
@@ -361,7 +361,7 @@
                break;
 #endif
        case LPGETFLAGS:
-               retval = put_user(lp.flags, (int *)arg);
+               retval = put_user(lp.flags, (int __user *)arg);
                break;
        case LPSETIRQ:
        default:
===== drivers/char/mem.c 1.53 vs edited =====
--- 1.53/drivers/char/mem.c     2004-05-29 11:12:56 +02:00
+++ edited/drivers/char/mem.c   2004-06-16 00:33:49 +02:00
@@ -498,7 +498,7 @@
        return 0;
 }
 #else /* CONFIG_MMU */
-static ssize_t read_zero(struct file * file, char * buf,
+static ssize_t read_zero(struct file * file, char __user * buf,
                         size_t count, loff_t *ppos)
 {
        size_t todo = count;
===== drivers/char/nwbutton.c 1.5 vs edited =====
--- 1.5/drivers/char/nwbutton.c 2003-05-13 01:21:23 +02:00
+++ edited/drivers/char/nwbutton.c      2004-06-16 00:36:12 +02:00
@@ -170,7 +170,7 @@
  * device at any one time.
  */

-static int button_read (struct file *filp, char *buffer,
+static int button_read (struct file *filp, char __user *buffer,
                        size_t count, loff_t *ppos)
 {
        interruptible_sleep_on (&button_wait_queue);
===== drivers/char/nwflash.c 1.13 vs edited =====
--- 1.13/drivers/char/nwflash.c 2003-03-19 12:39:14 +01:00
+++ edited/drivers/char/nwflash.c       2004-06-16 00:45:54 +02:00
@@ -43,10 +43,10 @@
 static void kick_open(void);
 static int get_flash_id(void);
 static int erase_block(int nBlock);
-static int write_block(unsigned long p, const char *buf, int count);
+static int write_block(unsigned long p, const char __user *buf, int count);
 static int flash_ioctl(struct inode *inodep, struct file *filep, unsigned int cmd, unsigned long arg);
-static ssize_t flash_read(struct file *file, char *buf, size_t count, loff_t * ppos);
-static ssize_t flash_write(struct file *file, const char *buf, size_t count, loff_t * ppos);
+static ssize_t flash_read(struct file *file, char __user *buf, size_t count, loff_t * ppos);
+static ssize_t flash_write(struct file *file, const char __user *buf, size_t count, loff_t * ppos);
 static loff_t flash_llseek(struct file *file, loff_t offset, int orig);

 #define KFLASH_SIZE    1024*1024       //1 Meg
@@ -132,7 +132,7 @@
        return 0;
 }

-static ssize_t flash_read(struct file *file, char *buf, size_t size, loff_t * ppos)
+static ssize_t flash_read(struct file *file, char __user *buf, size_t size, loff_t * ppos)
 {
        unsigned long p = *ppos;
        unsigned int count = size;
@@ -166,7 +166,7 @@
        return ret;
 }

-static ssize_t flash_write(struct file *file, const char *buf, size_t size, loff_t * ppos)
+static ssize_t flash_write(struct file *file, const char __user *buf, size_t size, loff_t * ppos)
 {
        unsigned long p = *ppos;
        unsigned int count = size;
@@ -460,7 +460,7 @@
 /*
  * write_block will limit number of bytes written to the space in this block
  */
-static int write_block(unsigned long p, const char *buf, int count)
+static int write_block(unsigned long p, const char __user *buf, int count)
 {
        volatile unsigned int c1;
        volatile unsigned int c2;
===== drivers/char/qtronix.c 1.7 vs edited =====
--- 1.7/drivers/char/qtronix.c  2004-03-31 15:33:58 +02:00
+++ edited/drivers/char/qtronix.c       2004-06-16 00:47:59 +02:00
@@ -511,7 +511,7 @@
  * Put bytes from input queue to buffer.
  */

-static ssize_t read_aux(struct file * file, char * buffer,
+static ssize_t read_aux(struct file * file, char __user * buffer,
                        size_t count, loff_t *ppos)
 {
        DECLARE_WAITQUEUE(wait, current);
===== drivers/char/sx.c 1.44 vs edited =====
--- 1.44/drivers/char/sx.c      2004-04-12 19:54:18 +02:00
+++ edited/drivers/char/sx.c    2004-06-16 00:57:31 +02:00
@@ -1592,7 +1592,7 @@
                         unsigned int cmd, unsigned long arg)
 {
        int rc = 0;
-       int *descr = (int *)arg, i;
+       int __user *descr = (int __user *)arg, i;
        static struct sx_board *board = NULL;
        int nbytes, offset;
        unsigned long data;
===== drivers/char/tipar.c 1.13 vs edited =====
--- 1.13/drivers/char/tipar.c   2004-04-28 22:48:10 +02:00
+++ edited/drivers/char/tipar.c 2004-06-16 00:58:21 +02:00
@@ -279,7 +279,7 @@
 }

 static ssize_t
-tipar_write(struct file *file, const char *buf, size_t count, loff_t * ppos)
+tipar_write(struct file *file, const char __user *buf, size_t count, loff_t * ppos)
 {
        unsigned int minor = iminor(file->f_dentry->d_inode) - TIPAR_MINOR;
        ssize_t n;
@@ -306,7 +306,7 @@
 }

 static ssize_t
-tipar_read(struct file *file, char *buf, size_t count, loff_t * ppos)
+tipar_read(struct file *file, char __user *buf, size_t count, loff_t * ppos)
 {
        int b = 0;
        unsigned int minor = iminor(file->f_dentry->d_inode) - TIPAR_MINOR;
===== drivers/char/upd4990a.c 1.2 vs edited =====
--- 1.2/drivers/char/upd4990a.c 2003-04-04 00:43:02 +02:00
+++ edited/drivers/char/upd4990a.c      2004-06-16 01:01:50 +02:00
@@ -110,7 +110,7 @@
  *     Now all the various file operations that we export.
  */

-static ssize_t rtc_read(struct file *file, char *buf,
+static ssize_t rtc_read(struct file *file, char __user *buf,
                        size_t count, loff_t *ppos)
 {
        DECLARE_WAITQUEUE(wait, current);
@@ -215,7 +215,7 @@
                if (!capable(CAP_SYS_TIME))
                        return -EACCES;

-               if (copy_from_user(&wtime, (struct rtc_time *) arg,
+               if (copy_from_user(&wtime, (struct rtc_time __user *) arg,
                                    sizeof (struct rtc_time)))
                        return -EFAULT;

@@ -258,7 +258,7 @@
        default:
                return -EINVAL;
        }
-       return copy_to_user((void *)arg, &wtime, sizeof wtime) ? -EFAULT : 0;
+       return copy_to_user((void __user *)arg, &wtime, sizeof wtime) ? -EFAULT : 0;
 }

 /*



--===============43539030193758732==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============43539030193758732==--
