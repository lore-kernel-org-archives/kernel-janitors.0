From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Sun, 18 Dec 2005 22:41:23 +0000
Subject: Re: [KJ] KERNEL_VERSION #ifs
Message-Id: <1134945683.7394.1.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============049118235644239672=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1134943209.7082.2.camel@alice>
In-Reply-To: <1134943209.7082.2.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============049118235644239672==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

> Yes, but beware that the architecture hasn't been updated in any
> meaningful way since July 27th.  I think cris is pretty much a
> patch-and-run architecture.

here is the patch to remove the #ifs

Signed-of-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.15-rc5-git5/arch/cris/arch-v32/kernel/fasttimer.c.orig	2005-12-18 23:36:19.000000000 +0100
+++ linux-2.6.15-rc5-git5/arch/cris/arch-v32/kernel/fasttimer.c	2005-12-18 23:38:37.000000000 +0100
@@ -604,23 +604,8 @@ void schedule_usleep(unsigned long us)
 
 #ifdef CONFIG_PROC_FS
 static int proc_fasttimer_read(char *buf, char **start, off_t offset, int len
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,2,0)
-                       ,int *eof, void *data_unused
-#else
-                        ,int unused
-#endif
-                               );
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,2,0)
+                       ,int *eof, void *data_unused);
 static struct proc_dir_entry *fasttimer_proc_entry;
-#else
-static struct proc_dir_entry fasttimer_proc_entry =
-{
-  0, 9, "fasttimer",
-  S_IFREG | S_IRUGO, 1, 0, 0,
-  0, NULL /* ops -- default to array */,
-  &proc_fasttimer_read /* get_info */,
-};
-#endif
 #endif /* CONFIG_PROC_FS */
 
 #ifdef CONFIG_PROC_FS
@@ -629,12 +614,7 @@ static struct proc_dir_entry fasttimer_p
 #define BIG_BUF_SIZE (500 + NUM_TIMER_STATS * 300)
 
 static int proc_fasttimer_read(char *buf, char **start, off_t offset, int len
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,2,0)
-                       ,int *eof, void *data_unused
-#else
-                        ,int unused
-#endif
-                               )
+                       ,int *eof, void *data_unused)
 {
   unsigned long flags;
   int i = 0;
@@ -809,9 +789,7 @@ static int proc_fasttimer_read(char *buf
 
   memcpy(buf, bigbuf + offset, len);
   *start = buf;
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,2,0)
   *eof = 1;
-#endif
 
   return len;
 }
@@ -975,12 +953,8 @@ void fast_timer_init(void)
     printk("fast_timer_init()\n");
 
 #ifdef CONFIG_PROC_FS
-#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,2,0)
    if ((fasttimer_proc_entry = create_proc_entry( "fasttimer", 0, 0 )))
      fasttimer_proc_entry->read_proc = proc_fasttimer_read;
-#else
-    proc_register_dynamic(&proc_root, &fasttimer_proc_entry);
-#endif
 #endif /* PROC_FS */
     if(request_irq(TIMER_INTR_VECT, timer_trig_interrupt, SA_INTERRUPT,
                    "fast timer int", NULL))



--===============049118235644239672==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============049118235644239672==--
