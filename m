From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Wed, 21 Jan 2004 18:36:29 +0000
Subject: Re: [PATCH] mm/pdflush.c - handle kernel_thread failure
Message-Id: <20040121103629.59b8e95a.rddunlap@osdl.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040121183259.GA17474@eugeneteo.net>
In-Reply-To: <20040121183259.GA17474@eugeneteo.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, 22 Jan 2004 02:32:59 +0800 Eugene Teo <eugene.teo@eugeneteo.net> wrote:

| A similar patch is included in 2.6.1-kj1. I am resubmitting
| this with a couple of amendments - store the return value to
| pid_t type variable, and use C99 __func__ instead.
| 
| diff -Naur -X /home/amnesia/w/dontdiff 2.6.2-rc1-orig/mm/pdflush.c 2.6.2-rc1-fix/mm/pdflush.c
| --- 2.6.2-rc1-orig/mm/pdflush.c	2004-01-22 02:19:29.000000000 +0800
| +++ 2.6.2-rc1-fix/mm/pdflush.c	2004-01-22 02:24:26.000000000 +0800
| @@ -207,7 +207,11 @@
|  
|  static void start_one_pdflush_thread(void)
|  {
| -	kernel_thread(pdflush, NULL, CLONE_KERNEL);
| +	pid_t ret;
| +
| +	ret = kernel_thread(pdflush, NULL, CLONE_KERNEL);
| +	if (ret < 0)
| +		printk("%s: unable to start kernel thread\n", __func__);
|  }
|  
|  static int __init pdflush_init(void)

Nope.  As Andrew pointed out to me:
"Nope, if we fail to start a thread here we'll just try again later. 
There's no need to warn."

--
~Randy
kernel-janitors project:  http://janitor.kernelnewbies.org/


-------------------------------------------------------
The SF.Net email is sponsored by EclipseCon 2004
Premiere Conference on Open Tools Development and Integration
See the breadth of Eclipse activity. February 3-5 in Anaheim, CA.
http://www.eclipsecon.org/osdn
_______________________________________________
Kernel-janitor-discuss mailing list
Kernel-janitor-discuss@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kernel-janitor-discuss
