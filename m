From: Alexander Nyberg <alexn@telia.com>
Date: Tue, 15 Jun 2004 21:50:54 +0000
Subject: [Kernel-janitors] Sparse checks #4
Message-Id: <1087336254.676.58.camel@boxen>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============20661115355515025=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============20661115355515025==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Should be easy to read through, haven't touched much line positioning
cause it's a mess anyway, and I don't want to be yelled at for disturbing
someone's "order".


Sparse checks for drivers/

Signed-off-by: Alexander Nyberg <alexn@telia.com>

===== drivers/acorn/char/i2c.c 1.12 vs edited =====
--- 1.12/drivers/acorn/char/i2c.c       2004-03-30 00:16:31 +02:00
+++ edited/drivers/acorn/char/i2c.c     2004-06-15 22:45:03 +02:00
@@ -212,14 +212,14 @@
                rtctm.tm_mday = rtc_raw.mday;
                rtctm.tm_mon  = rtc_raw.mon - 1; /* month starts at 0 */
                rtctm.tm_year = year - 1900; /* starts at 1900 */
-               return copy_to_user((void *)arg, &rtctm, sizeof(rtctm))
+               return copy_to_user((void __user *)arg, &rtctm, sizeof(rtctm))
                                 ? -EFAULT : 0;

        case RTC_SET_TIME:
                if (!capable(CAP_SYS_TIME))
                        return -EACCES;

-               if (copy_from_user(&rtctm, (void *)arg, sizeof(rtctm)))
+               if (copy_from_user(&rtctm, (void __user *)arg, sizeof(rtctm)))
                        return -EFAULT;
                rtc_raw.secs     = rtctm.tm_sec;
                rtc_raw.mins     = rtctm.tm_min;
@@ -231,7 +231,7 @@
                break;

        case RTC_EPOCH_READ:
-               return put_user(1900, (unsigned long *)arg);
+               return put_user(1900, (unsigned long __user *)arg);

        }
        return -EINVAL;
===== drivers/block/acsi_slm.c 1.15 vs edited =====
--- 1.15/drivers/block/acsi_slm.c       2003-08-26 18:25:40 +02:00
+++ edited/drivers/block/acsi_slm.c     2004-06-15 22:53:13 +02:00
@@ -244,14 +244,14 @@

 static char *slm_errstr( int stat );
 static int slm_getstats( char *buffer, int device );
-static ssize_t slm_read( struct file* file, char *buf, size_t count, loff_t
+static ssize_t slm_read( struct file* file, char __user *buf, size_t count, loff_t
                          *ppos );
 static void start_print( int device );
 static irqreturn_t slm_interrupt(int irc, void *data, struct pt_regs *fp);
 static void slm_test_ready( unsigned long dummy );
 static void set_dma_addr( unsigned long paddr );
 static unsigned long get_dma_addr( void );
-static ssize_t slm_write( struct file *file, const char *buf, size_t count,
+static ssize_t slm_write( struct file *file, const char __user *buf, size_t count,
                           loff_t *ppos );
 static int slm_ioctl( struct inode *inode, struct file *file, unsigned int
                       cmd, unsigned long arg );
@@ -360,7 +360,7 @@
 }


-static ssize_t slm_read( struct file *file, char *buf, size_t count,
+static ssize_t slm_read( struct file *file, char __user *buf, size_t count,
                                                 loff_t *ppos )

 {
@@ -617,8 +617,8 @@
 }


-static ssize_t slm_write( struct file *file, const char *buf, size_t count,
-                                                 loff_t *ppos )
+static ssize_t slm_write( struct file *file, const char __user *buf,
+               size_t count, loff_t *ppos )

 {
        struct inode *node = file->f_dentry->d_inode;
@@ -724,9 +724,9 @@
                if (arg) {
                        str = slm_errstr( stat );
                        if (put_user(stat,
-                                    (long *)&((struct SLM_status *)arg)->stat))
+                                    (long *)&((struct SLM_status __user *)arg)->stat))
                                return -EFAULT;
-                       if (copy_to_user( ((struct SLM_status *)arg)->str, str,
+                       if (copy_to_user( ((struct SLM_status __user *)arg)->str, str,
                                                 strlen(str) + 1))
                                return -EFAULT;
                }
@@ -738,9 +738,9 @@

                if ((err = slm_get_pagesize( device, &w, &h ))) return( err );

-               if (put_user(w, (long *)&((struct SLM_paper_size *)arg)->width))
+               if (put_user(w, (long *)&((struct SLM_paper_size __user *)arg)->width))
                        return -EFAULT;
-               if (put_user(h, (long *)&((struct SLM_paper_size *)arg)->height))
+               if (put_user(h, (long *)&((struct SLM_paper_size __user *)arg)->height))
                        return -EFAULT;
                return( 0 );
          }
===== drivers/char/applicom.c 1.12 vs edited =====
--- 1.12/drivers/char/applicom.c        2004-04-12 19:55:31 +02:00
+++ edited/drivers/char/applicom.c      2004-06-15 23:00:10 +02:00
@@ -105,8 +105,8 @@
 static unsigned int ReadErrorCount;    /* number of read error       */
 static unsigned int DeviceErrorCount;  /* number of device error     */

-static ssize_t ac_read (struct file *, char *, size_t, loff_t *);
-static ssize_t ac_write (struct file *, const char *, size_t, loff_t *);
+static ssize_t ac_read (struct file *, char __user *, size_t, loff_t *);
+static ssize_t ac_write (struct file *, const char __user *, size_t, loff_t *);
 static int ac_ioctl(struct inode *, struct file *, unsigned int,
                    unsigned long);
 static irqreturn_t ac_interrupt(int, void *, struct pt_regs *);
@@ -343,7 +343,7 @@
 __initcall(applicom_init);
 #endif

-static ssize_t ac_write(struct file *file, const char *buf, size_t count, loff_t * ppos)
+static ssize_t ac_write(struct file *file, const char __user *buf, size_t count, loff_t * ppos)
 {
        unsigned int NumCard;   /* Board number 1 -> 8           */
        unsigned int IndexCard; /* Index board number 0 -> 7     */
@@ -521,7 +521,7 @@
        return (sizeof(struct st_ram_io) + sizeof(struct mailbox));
 }

-static ssize_t ac_read (struct file *filp, char *buf, size_t count, loff_t *ptr)
+static ssize_t ac_read (struct file *filp, char __user *buf, size_t count, loff_t *ptr)
 {
        unsigned long flags;
        unsigned int i;
@@ -697,7 +697,7 @@
        if (!adgl)
                return -ENOMEM;

-       if (copy_from_user(adgl, (void *)arg,sizeof(struct st_ram_io))) {
+       if (copy_from_user(adgl, (void __user *)arg,sizeof(struct st_ram_io))) {
                kfree(adgl);
                return -EFAULT;
        }
@@ -721,7 +721,7 @@
                pmem = apbs[IndexCard].RamIO;
                for (i = 0; i < sizeof(struct st_ram_io); i++)
                        ((unsigned char *)adgl)[i]=readb(pmem++);
-               if (copy_to_user((void *)arg, adgl, sizeof(struct st_ram_io)))
+               if (copy_to_user((void __user *)arg, adgl, sizeof(struct st_ram_io)))
                        ret = -EFAULT;
                break;
        case 1:
@@ -742,7 +742,7 @@
                        (readb(apbs[IndexCard].RamIO + SERIAL_NUMBER + 1) << 8) +
                        (readb(apbs[IndexCard].RamIO + SERIAL_NUMBER + 2) );

-               if (copy_to_user((void *)arg, adgl, sizeof(struct st_ram_io)))
+               if (copy_to_user((void __user *)arg, adgl, sizeof(struct st_ram_io)))
                        ret = -EFAULT;
                break;
        case 2:
@@ -768,7 +768,7 @@
                pmem = apbs[IndexCard].RamIO + TIC_OWNER_TO_PC;
                adgl->tic_owner_to_pc     = readb(pmem++);
                adgl->numcard_owner_to_pc = readb(pmem);
-               if (copy_to_user((void *)arg, adgl,sizeof(struct st_ram_io)))
+               if (copy_to_user((void __user *)arg, adgl,sizeof(struct st_ram_io)))
                        ret = -EFAULT;
                break;
        case 5:
===== drivers/char/busmouse.c 1.11 vs edited =====
--- 1.11/drivers/char/busmouse.c        2003-09-04 08:40:14 +02:00
+++ edited/drivers/char/busmouse.c      2004-06-15 23:01:27 +02:00
@@ -231,12 +231,12 @@
        return ret;
 }

-static ssize_t busmouse_write(struct file *file, const char *buffer, size_t count, loff_t *ppos)
+static ssize_t busmouse_write(struct file *file, const char __user *buffer, size_t count, loff_t *ppos)
 {
        return -EINVAL;
 }

-static ssize_t busmouse_read(struct file *file, char *buffer, size_t count, loff_t *ppos)
+static ssize_t busmouse_read(struct file *file, char __user *buffer, size_t count, loff_t *ppos)
 {
        struct busmouse_data *mse = (struct busmouse_data *)file->private_data;
        DECLARE_WAITQUEUE(wait, current);
===== drivers/char/ds1620.c 1.4 vs edited =====
--- 1.4/drivers/char/ds1620.c   2002-11-05 16:39:50 +01:00
+++ edited/drivers/char/ds1620.c        2004-06-15 23:07:49 +02:00
@@ -213,7 +213,7 @@
 }

 static ssize_t
-ds1620_read(struct file *file, char *buf, size_t count, loff_t *ptr)
+ds1620_read(struct file *file, char __user *buf, size_t count, loff_t *ptr)
 {
        signed int cur_temp;
        signed char cur_temp_degF;
@@ -246,11 +246,11 @@
                        return -EPERM;

                if (cmd == CMD_SET_THERMOSTATE) {
-                       if (get_user(therm.hi, (int *)arg))
+                       if (get_user(therm.hi, (int __user *)arg))
                                return -EFAULT;
                        therm.lo = therm.hi - 3;
                } else {
-                       if (copy_from_user(&therm, (void *)arg, sizeof(therm)))
+                       if (copy_from_user(&therm, (void __user *)arg, sizeof(therm)))
                                return -EFAULT;
                }

@@ -268,10 +268,10 @@
                therm.hi >>= 1;

                if (cmd == CMD_GET_THERMOSTATE) {
-                       if (put_user(therm.hi, (int *)arg))
+                       if (put_user(therm.hi, (int __user *)arg))
                                return -EFAULT;
                } else {
-                       if (copy_to_user((void *)arg, &therm, sizeof(therm)))
+                       if (copy_to_user((void __user *)arg, &therm, sizeof(therm)))
                                return -EFAULT;
                }
                break;
@@ -283,23 +283,23 @@
                if (cmd == CMD_GET_TEMPERATURE)
                        i >>= 1;

-               return put_user(i, (int *)arg) ? -EFAULT : 0;
+               return put_user(i, (int __user *)arg) ? -EFAULT : 0;

        case CMD_GET_STATUS:
                i = ds1620_in(THERM_READ_CONFIG, 8) & 0xe3;

-               return put_user(i, (int *)arg) ? -EFAULT : 0;
+               return put_user(i, (int __user *)arg) ? -EFAULT : 0;

        case CMD_GET_FAN:
                i = netwinder_get_fan();

-               return put_user(i, (int *)arg) ? -EFAULT : 0;
+               return put_user(i, (int __user *)arg) ? -EFAULT : 0;

        case CMD_SET_FAN:
                if (!capable(CAP_SYS_ADMIN))
                        return -EPERM;

-               if (get_user(i, (int *)arg))
+               if (get_user(i, (int __user *)arg))
                        return -EFAULT;

                netwinder_set_fan(i);
===== drivers/char/dsp56k.c 1.16 vs edited =====
--- 1.16/drivers/char/dsp56k.c  2004-04-08 18:53:57 +02:00
+++ edited/drivers/char/dsp56k.c        2004-06-15 23:10:54 +02:00
@@ -205,7 +205,7 @@
        return 0;
 }

-static ssize_t dsp56k_read(struct file *file, char *buf, size_t count,
+static ssize_t dsp56k_read(struct file *file, char __user *buf, size_t count,
                           loff_t *ppos)
 {
        struct inode *inode = file->f_dentry->d_inode;
@@ -268,7 +268,7 @@
        }
 }

-static ssize_t dsp56k_write(struct file *file, const char *buf, size_t count,
+static ssize_t dsp56k_write(struct file *file, const char __user *buf, size_t count,
                            loff_t *ppos)
 {
        struct inode *inode = file->f_dentry->d_inode;
@@ -344,7 +344,7 @@
                {
                        char *bin;
                        int r, len;
-                       struct dsp56k_upload *binary = (struct dsp56k_upload *) arg;
+                       struct dsp56k_upload __user *binary = (struct dsp56k_upload __user *) arg;

                        if(get_user(len, &binary->len) < 0)
                                return -EFAULT;
@@ -378,7 +378,7 @@
                case DSP56K_HOST_FLAGS:
                {
                        int dir, out, status;
-                       struct dsp56k_host_flags *hf = (struct dsp56k_host_flags*) arg;
+                       struct dsp56k_host_flags __user *hf = (struct dsp56k_host_flags __user *) arg;

                        if(get_user(dir, &hf->dir) < 0)
                                return -EFAULT;
===== drivers/char/dtlk.c 1.15 vs edited =====
--- 1.15/drivers/char/dtlk.c    2003-09-30 02:23:52 +02:00
+++ edited/drivers/char/dtlk.c  2004-06-15 23:13:05 +02:00
@@ -85,9 +85,9 @@
 static struct timer_list dtlk_timer;

 /* prototypes for file_operations struct */
-static ssize_t dtlk_read(struct file *, char *,
+static ssize_t dtlk_read(struct file *, char __user *,
                         size_t nbytes, loff_t * ppos);
-static ssize_t dtlk_write(struct file *, const char *,
+static ssize_t dtlk_write(struct file *, const char __user *,
                          size_t nbytes, loff_t * ppos);
 static unsigned int dtlk_poll(struct file *, poll_table *);
 static int dtlk_open(struct inode *, struct file *);
@@ -121,7 +121,7 @@
  */
 static void dtlk_timer_tick(unsigned long data);

-static ssize_t dtlk_read(struct file *file, char *buf,
+static ssize_t dtlk_read(struct file *file, char __user *buf,
                         size_t count, loff_t * ppos)
 {
        unsigned int minor = iminor(file->f_dentry->d_inode);
@@ -158,7 +158,7 @@
        return -EAGAIN;
 }

-static ssize_t dtlk_write(struct file *file, const char *buf,
+static ssize_t dtlk_write(struct file *file, const char __user *buf,
                          size_t count, loff_t * ppos)
 {
        int i = 0, retries = 0, ch;
@@ -285,14 +285,14 @@

        case DTLK_INTERROGATE:
                sp = dtlk_interrogate();
-               if (copy_to_user((char *) arg, (char *) sp,
+               if (copy_to_user((char __user *) arg, (char *) sp,
                                   sizeof(struct dtlk_settings)))
                        return -EINVAL;
                return 0;

        case DTLK_STATUS:
                portval = inb_p(dtlk_port_tts);
-               return put_user(portval, (char *) arg);
+               return put_user(portval, (char __user *) arg);

        default:
                return -EINVAL;
===== drivers/char/efirtc.c 1.9 vs edited =====
--- 1.9/drivers/char/efirtc.c   2004-03-27 12:43:20 +01:00
+++ edited/drivers/char/efirtc.c        2004-06-15 23:15:52 +02:00
@@ -155,7 +155,7 @@
        efi_time_t      eft;
        efi_time_cap_t  cap;
        struct rtc_time wtime;
-       struct rtc_wkalrm *ewp;
+       struct rtc_wkalrm __user *ewp;
        unsigned char   enabled, pending;

        switch (cmd) {
@@ -189,13 +189,13 @@

                        convert_from_efi_time(&eft, &wtime);

-                       return copy_to_user((void *)arg, &wtime, sizeof (struct rtc_time)) ? - EFAULT : 0;
+                       return copy_to_user((void __user *)arg, &wtime, sizeof (struct rtc_time)) ? - EFAULT : 0;

                case RTC_SET_TIME:

                        if (!capable(CAP_SYS_TIME)) return -EACCES;

-                       if (copy_from_user(&wtime, (struct rtc_time *)arg, sizeof(struct rtc_time)) )
+                       if (copy_from_user(&wtime, (struct rtc_time __user *)arg, sizeof(struct rtc_time)) )
                                return -EFAULT;

                        convert_to_efi_time(&wtime, &eft);
@@ -212,7 +212,7 @@

                        if (!capable(CAP_SYS_TIME)) return -EACCES;

-                       ewp = (struct rtc_wkalrm *)arg;
+                       ewp = (struct rtc_wkalrm __user *)arg;

                        if (  get_user(enabled, &ewp->enabled)
                           || copy_from_user(&wtime, &ewp->time, sizeof(struct rtc_time)) )
@@ -243,7 +243,7 @@

                        if (status != EFI_SUCCESS) return -EINVAL;

-                       ewp = (struct rtc_wkalrm *)arg;
+                       ewp = (struct rtc_wkalrm __user *)arg;

                        if (  put_user(enabled, &ewp->enabled)
                           || put_user(pending, &ewp->pending)) return -EFAULT;
===== drivers/char/genrtc.c 1.12 vs edited =====
--- 1.12/drivers/char/genrtc.c  2004-03-12 10:30:22 +01:00
+++ edited/drivers/char/genrtc.c        2004-06-15 23:19:31 +02:00
@@ -171,7 +171,7 @@
 /*
  *     Now all the various file operations that we export.
  */
-static ssize_t gen_rtc_read(struct file *file, char *buf,
+static ssize_t gen_rtc_read(struct file *file, char __user *buf,
                        size_t count, loff_t *ppos)
 {
        DECLARE_WAITQUEUE(wait, current);
@@ -285,12 +285,12 @@
            if (get_rtc_pll(&pll))
                    return -EINVAL;
            else
-                   return copy_to_user((void *)arg, &pll, sizeof pll) ? -EFAULT : 0;
+                   return copy_to_user((void __user *)arg, &pll, sizeof pll) ? -EFAULT : 0;

        case RTC_PLL_SET:
                if (!capable(CAP_SYS_TIME))
                        return -EACCES;
-               if (copy_from_user(&pll, (struct rtc_pll_info*)arg,
+               if (copy_from_user(&pll, (struct rtc_pll_info __user *)arg,
                                   sizeof(pll)))
                        return -EFAULT;
            return set_rtc_pll(&pll);
@@ -307,7 +307,7 @@
                memset(&wtime, 0, sizeof(wtime));
                get_rtc_time(&wtime);

-               return copy_to_user((void *)arg, &wtime, sizeof(wtime)) ? -EFAULT : 0;
+               return copy_to_user((void __user *)arg, &wtime, sizeof(wtime)) ? -EFAULT : 0;

        case RTC_SET_TIME:      /* Set the RTC */
            {
@@ -317,7 +317,7 @@
                if (!capable(CAP_SYS_TIME))
                        return -EACCES;

-               if (copy_from_user(&wtime, (struct rtc_time *)arg,
+               if (copy_from_user(&wtime, (struct rtc_time __user *)arg,
                                   sizeof(wtime)))
                        return -EFAULT;

===== drivers/char/ip2main.c 1.44 vs edited =====
--- 1.44/drivers/char/ip2main.c 2004-04-14 19:08:00 +02:00
+++ edited/drivers/char/ip2main.c       2004-06-15 23:24:57 +02:00
@@ -206,8 +206,8 @@
 static int get_serial_info(i2ChanStrPtr, struct serial_struct *);
 static int set_serial_info(i2ChanStrPtr, struct serial_struct *);

-static ssize_t ip2_ipl_read(struct file *, char *, size_t, loff_t *);
-static ssize_t ip2_ipl_write(struct file *, const char *, size_t, loff_t *);
+static ssize_t ip2_ipl_read(struct file *, char __user *, size_t, loff_t *);
+static ssize_t ip2_ipl_write(struct file *, const char __user *, size_t, loff_t *);
 static int ip2_ipl_ioctl(struct inode *, struct file *, UINT, ULONG);
 static int ip2_ipl_open(struct inode *, struct file *);

@@ -2727,7 +2727,7 @@

 static
 ssize_t
-ip2_ipl_read(struct file *pFile, char *pData, size_t count, loff_t *off )
+ip2_ipl_read(struct file *pFile, char __user *pData, size_t count, loff_t *off )
 {
        unsigned int minor = iminor(pFile->f_dentry->d_inode);
        int rc = 0;
@@ -2836,7 +2836,7 @@
 /*                                                                            */
 /******************************************************************************/
 static ssize_t
-ip2_ipl_write(struct file *pFile, const char *pData, size_t count, loff_t *off)
+ip2_ipl_write(struct file *pFile, const char __user *pData, size_t count, loff_t *off)
 {
 #ifdef IP2DEBUG_IPL
        printk (KERN_DEBUG "IP2IPL: write %p, %d bytes\n", pData, count );
@@ -2861,7 +2861,7 @@
 {
        unsigned int iplminor = iminor(pInode);
        int rc = 0;
-       ULONG *pIndex = (ULONG*)arg;
+       ULONG __user *pIndex = (ULONG __user *)arg;
        i2eBordStrPtr pB = i2BoardPtrTable[iplminor / 4];
        i2ChanStrPtr pCh;

@@ -2886,7 +2886,7 @@

                case 65:        /* Board  - ip2stat */
                        if ( pB ) {
-                               rc = copy_to_user((char*)arg, (char*)pB, sizeof(i2eBordStr) );
+                               rc = copy_to_user((char __user *)arg, (char*)pB, sizeof(i2eBordStr) );
                                rc = put_user(INB(pB->i2eStatus),
                                        (ULONG*)(arg + (ULONG)(&pB->i2eStatus) - (ULONG)pB ) );
                        } else {
@@ -2899,7 +2899,7 @@
                                pCh = DevTable[cmd];
                                if ( pCh )
                                {
-                                       rc = copy_to_user((char*)arg, (char*)pCh, sizeof(i2ChanStr) );
+                                       rc = copy_to_user((char __user *)arg, (char*)pCh, sizeof(i2ChanStr) );
                                } else {
                                        rc = -ENODEV;
                                }
===== drivers/char/ftape/zftape/zftape-init.c 1.21 vs edited =====
--- 1.21/drivers/char/ftape/zftape/zftape-init.c        2004-03-19 01:37:56 +01:00
+++ edited/drivers/char/ftape/zftape/zftape-init.c      2004-06-15 23:17:35 +02:00
@@ -88,9 +88,9 @@
 static int  zft_ioctl(struct inode *ino, struct file *filep,
                      unsigned int command, unsigned long arg);
 static int  zft_mmap(struct file *filep, struct vm_area_struct *vma);
-static ssize_t zft_read (struct file *fp, char *buff,
+static ssize_t zft_read (struct file *fp, char __user *buff,
                         size_t req_len, loff_t *ppos);
-static ssize_t zft_write(struct file *fp, const char *buff,
+static ssize_t zft_write(struct file *fp, const char __user *buff,
                         size_t req_len, loff_t *ppos);

 static struct file_operations zft_cdev =
@@ -177,7 +177,7 @@
        old_sigmask = current->blocked; /* save mask */
        sigfillset(&current->blocked);
        /* This will work as long as sizeof(void *) == sizeof(long) */
-       result = _zft_ioctl(command, (void *) arg);
+       result = _zft_ioctl(command, (void __user *) arg);
        current->blocked = old_sigmask; /* restore mask */
        TRACE_EXIT result;
 }
@@ -211,7 +211,7 @@

 /*      Read from floppy tape device
  */
-static ssize_t zft_read(struct file *fp, char *buff,
+static ssize_t zft_read(struct file *fp, char __user *buff,
                        size_t req_len, loff_t *ppos)
 {
        int result = -EIO;
@@ -234,7 +234,7 @@

 /*      Write to tape device
  */
-static ssize_t zft_write(struct file *fp, const char *buff,
+static ssize_t zft_write(struct file *fp, const char __user *buff,
                         size_t req_len, loff_t *ppos)
 {
        int result = -EIO;


--===============20661115355515025==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============20661115355515025==--
