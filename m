From: Alexander Nyberg <alexn@telia.com>
Date: Wed, 16 Jun 2004 00:15:27 +0000
Subject: Re: [Kernel-janitors] Sparse checks #9
Message-Id: <1087344927.676.147.camel@boxen>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============11687120265892048=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1087343099.676.115.camel@boxen>
In-Reply-To: <1087343099.676.115.camel@boxen>
To: kernel-janitors@vger.kernel.org

--===============11687120265892048==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Sorry, stupid miss at:
struct lcd_display __user *ubuf = (struct lcd_display __user) arg;

Could I also have some feedback before I go on with this, right
way of sending in diffs etc.?

Resending drivers/char/lcd.c diff:

===== drivers/char/lcd.c 1.2 vs edited =====
--- 1.2/drivers/char/lcd.c      2003-09-01 01:14:08 +02:00
+++ edited/drivers/char/lcd.c   2004-06-16 00:27:01 +02:00
@@ -63,7 +63,8 @@
        struct lcd_display button_display;
        unsigned long address, a;
        int index;
-
+       struct lcd_display __user *ubuf = (struct lcd_display __user *) arg;
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




--===============11687120265892048==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============11687120265892048==--
