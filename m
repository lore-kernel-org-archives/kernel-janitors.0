From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Tue, 24 Feb 2004 20:14:12 +0000
Subject: Re: [Kernel-janitors] [PATCH][REDIFF] - proc cleanup for
Message-Id: <20040224121412.36f0d879.rddunlap@osdl.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1077309166.17385.11.camel@telecentrolivre>
In-Reply-To: <1077309166.17385.11.camel@telecentrolivre>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Hi,

Let me see if I understand this.  This patch isn't to fix a warning,
but just to move an ifdef/endif block outside of a function (?).

That's OK, but I can't say that I like this particular patch.
It passes <rtc_gen_dev> to gen_rtc_proc_init() only so that the
latter can call misc_deregister() in an error case.  Otherwise
gen_rtc_proc_init() has no use for that parameter.

I'd rather see the calling function stay balanced -- i.e., if
there's an error, call misc_deregister() there.

How's the alternative patch down below look?

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

On Fri, 20 Feb 2004 17:32:46 -0300 Luiz Fernando Capitulino wrote:

| 
|  Hi,
| 
|  This version have the Francois tip:
| diff -Nru linux-2.6.3/drivers/char/genrtc.c linux-2.6.3~/drivers/char/genrtc.c
| --- linux-2.6.3/drivers/char/genrtc.c	2004-02-05 08:42:27.000000000 -0200
| +++ linux-2.6.3~/drivers/char/genrtc.c	2004-02-20 17:07:17.000000000 -0300
| @@ -466,6 +466,19 @@
|  	return len;
|  }
|  
| +static int __init gen_rtc_proc_init(struct miscdevice *dev)
| +{
| +	struct proc_dir_entry *r;
| +
| +	r = create_proc_read_entry("driver/rtc", 0, 0, gen_rtc_read_proc, NULL);
| +	if (!r) {
| +		misc_deregister(dev);
| +		return -ENOMEM;
| +	}
| +	return 0;
| +}
| +#else
| +static inline int gen_rtc_proc_init(struct miscdevice *dev) { return 0; }
|  #endif /* CONFIG_PROC_FS */
|  
|  
| @@ -501,14 +514,8 @@
|  	if(retval < 0)
|  		return retval;
|  
| -#ifdef CONFIG_PROC_FS
| -	if((create_proc_read_entry ("driver/rtc", 0, 0, gen_rtc_read_proc, NULL)) = NULL){
| -		misc_deregister(&rtc_gen_dev);
| -		return -ENOMEM;
| -	}
| -#endif
| -
| -	return 0;
| +	retval = gen_rtc_proc_init(&rtc_gen_dev);
| +	return retval;
|  }
|  
|  static void __exit rtc_generic_exit(void)


--
~Randy


// Linux 2.6.3
// description:	remove ifdef/endif in rtc_generic_init();

diffstat: drivers/char/genrtc.c |   20 +++++++++++++++-----
 1 files changed, 15 insertions(+), 5 deletions(-)


diff -Naurp ./drivers/char/genrtc.c~genrtc_proc ./drivers/char/genrtc.c
--- ./drivers/char/genrtc.c~genrtc_proc	2004-02-17 19:59:28.000000000 -0800
+++ ./drivers/char/genrtc.c	2004-02-24 12:00:06.000000000 -0800
@@ -466,6 +466,17 @@ static int gen_rtc_read_proc(char *page,
 	return len;
 }
 
+static int __init gen_rtc_proc_init(void)
+{
+	struct proc_dir_entry *r;
+
+	r = create_proc_read_entry("driver/rtc", 0, 0, gen_rtc_read_proc, NULL);
+	if (!r)
+		return -ENOMEM;
+	return 0;
+}
+#else
+static inline int gen_rtc_proc_init(void) { return 0; }
 #endif /* CONFIG_PROC_FS */
 
 
@@ -498,15 +509,14 @@ static int __init rtc_generic_init(void)
 	printk(KERN_INFO "Generic RTC Driver v%s\n", RTC_VERSION);
 
 	retval = misc_register(&rtc_gen_dev);
-	if(retval < 0)
+	if (retval < 0)
 		return retval;
 
-#ifdef CONFIG_PROC_FS
-	if((create_proc_read_entry ("driver/rtc", 0, 0, gen_rtc_read_proc, NULL)) = NULL){
+	retval = gen_rtc_proc_init();
+	if (retval) {
 		misc_deregister(&rtc_gen_dev);
-		return -ENOMEM;
+		return retval;
 	}
-#endif
 
 	return 0;
 }
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
