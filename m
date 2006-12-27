From: Jim Nelson <james4765@gmail.com>
Date: Wed, 27 Dec 2006 01:11:45 +0000
Subject: Re: [KJ] [PATCH for review] Changed DPRINTK to pr_debug
Message-Id: <4591C851.9080102@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4b4be04a0612251633j4b86e7efqaa5e7742a542f64b@mail.gmail.com>
In-Reply-To: <4b4be04a0612251633j4b86e7efqaa5e7742a542f64b@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Badai Aqrandista wrote:
 > Hi,
 >
 > I'm learning to hack on linux kernel. This is a patch to do one of the
 > point in the kernel janitor todo list. What do you think? Should I
 > continue working on this or should I choose different point in the
 > todo list?
 >
 > My basic concern is that the author of via82cxxx_audio.c is expecting
 > VIA_DEBUG symbol when he is working with the code.
 >
 > diff --git a/include/linux/kernel.h b/include/linux/kernel.h
 > index b0c4a05..484a401 100644
 > --- a/include/linux/kernel.h
 > +++ b/include/linux/kernel.h
 > @@ -203,7 +203,7 @@ extern void dump_stack(void);
 >  #ifdef DEBUG
 >  /* If you are writing a driver, please use dev_dbg instead */
 >  #define pr_debug(fmt,arg...) \
 > -	printk(KERN_DEBUG fmt,##arg)
 > +	printk(KERN_DEBUG "[%s] " fmt, __FUNCTION__, ##arg)
 >  #else
 >  static inline int __attribute__ ((format (printf, 1, 2)))
 > pr_debug(const char * fmt, ...)
 >  {

I definitely would not do this - a lot of driver-specific macros already include __FUNCTION__ in them, and this would 
mess up their output.

 > diff --git a/sound/oss/via82cxxx_audio.c b/sound/oss/via82cxxx_audio.c
 > index c96cc8c..605be65 100644
 > --- a/sound/oss/via82cxxx_audio.c
 > +++ b/sound/oss/via82cxxx_audio.c
 > @@ -45,14 +45,6 @@
 >  #include "mpu401.h"
 >
 >
 > -#undef VIA_DEBUG	/* define to enable debugging output and checks */
 > -#ifdef VIA_DEBUG
 > -/* note: prints function name for you */
 > -#define DPRINTK(fmt, args...) printk(KERN_DEBUG "%s: " fmt,
 > __FUNCTION__ , ## args)
 > -#else
 > -#define DPRINTK(fmt, args...)
 > -#endif
 > -
 >  #undef VIA_NDEBUG	/* define to disable lightweight runtime checks */
 >  #ifdef VIA_NDEBUG
 >  #define assert(expr)

Plus, a lot of driver authors choose not to have their debug printk's tied into a global flag - you could change this 
whole patch to:


+#undef DEBUG		/* define to enable debugging output and checks */
-#undef VIA_DEBUG	/* define to enable debugging output and checks */
-#ifdef VIA_DEBUG
-/* note: prints function name for you */
-#define DPRINTK(fmt, args...) printk(KERN_DEBUG "%s: " fmt, __FUNCTION__ , ## args)
+#define DPRINTK(fmt, args...) pr_debug("via82cxxx: %s(): ", fmt, __FUNCTION__, ## args)
-#else
-#define DPRINTK(fmt, args...)
-#endif



P. S. - your mail client mangled the patch - I use sendpatchset.py (http://www.speakeasy.org/~pj99/sgi/sendpatchset) to 
submit patches, and the latest version is designed to play nice with gmail...

Jim

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
