From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Thu, 01 Apr 2004 21:55:31 +0000
Subject: Re: [Kernel-janitors] [PATCH 5/5] remove concatenation with
Message-Id: <20040401135531.60457cf3.rddunlap@osdl.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040322052155.GF17221@bakeyournoodle.com>
In-Reply-To: <20040322052155.GF17221@bakeyournoodle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,

1.  What's this trix_boot.h file in here for?


On Sat, 27 Mar 2004 13:17:05 +0800 Tony Breeds wrote:

| diff -X dontdiff -purN 2.6.4.clean/sound/oss/trix_boot.h 2.6.4.kj_func/sound/oss/trix_boot.h
| --- 2.6.4.clean/sound/oss/trix_boot.h	1970-01-01 10:00:00.000000000 +1000
| +++ 2.6.4.kj_func/sound/oss/trix_boot.h	2004-03-26 14:32:44.000000000 +1100
| @@ -0,0 +1,2 @@
| +static unsigned char * trix_boot = NULL;
| +static int trix_boot_len = 0;


| diff -X dontdiff -purN 2.6.4.clean/sound/oss/vwsnd.c 2.6.4.kj_func/sound/oss/vwsnd.c
| --- 2.6.4.clean/sound/oss/vwsnd.c	2004-01-18 17:51:36.000000000 +1100
| +++ 2.6.4.kj_func/sound/oss/vwsnd.c	2004-03-26 14:39:46.000000000 +1100
| @@ -195,14 +195,14 @@ static void dbgassert(const char *fcn, i
|  
|  #define ASSERT(e)      ((e) ? (void) 0 : dbgassert(__FUNCTION__, __LINE__, #e))
|  #define DBGDO(x)            x
| -#define DBGX(fmt, args...)  (in_interrupt() ? 0 : printk(KERN_ERR fmt, ##args))
| -#define DBGP(fmt, args...)  (DBGX(__FUNCTION__ ": " fmt, ##args))
| -#define DBGE(fmt, args...)  (DBGX(__FUNCTION__ fmt, ##args))
| +#define DBGX(fmt, args...)  (in_interrupt() ? 0 : printk(KERN_ERR fmt , ##args))
| +#define DBGP(fmt, args...)  (DBGX("%s: " fmt, __FUNCTION__ , ##args))
| +#define DBGE(fmt, args...)  (DBGX("%s" fmt, __FUNCTION__ , ##args))
|  #define DBGC(rtn)           (DBGP("calling %s\n", rtn))
|  #define DBGR()              (DBGP("returning\n"))
| -#define DBGXV(fmt, args...) (shut_up ? 0 : DBGX(fmt, ##args))
| -#define DBGPV(fmt, args...) (shut_up ? 0 : DBGP(fmt, ##args))
| -#define DBGEV(fmt, args...) (shut_up ? 0 : DBGE(fmt, ##args))
| +#define DBGXV(fmt, args...) (shut_up ? 0 : DBGX(fmt , ##args))
| +#define DBGPV(fmt, args...) (shut_up ? 0 : DBGP(fmt , ##args))
| +#define DBGEV(fmt, args...) (shut_up ? 0 : DBGE(fmt , ##args))

2.  Some of these aren't related to $SUBJECT (__FUNCTION__), but are
correct IIRC (for some versions of gcc).  Can someone confirm that?

3.  In a few cases, I noticed the addition of KERN_xyz levels to
printk() calls.  These are also not related to $SUBJECT so they
should be separate patches.  Furthermore, addition of a KERN_level
removes the ability to use the "default console log level" since
that applies only if the message doesn't have a log level, and
the author might actually want to use a default log level instead
of specifying one.

--
~Randy
(Again.  Sometimes I think ln -s /usr/src/linux/.config .signature)
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
