From: Szymon Janc <szymon@janc.net.pl>
Date: Wed, 11 Jan 2012 17:55:42 +0000
Subject: Re: [PATCH 15/16] Staging: quickstart: Add QS_INFO and QS_ERR macros for logs
Message-Id: <201201111855.42251.szymon@janc.net.pl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1326147815-11451-16-git-send-email-szymon@janc.net.pl>
In-Reply-To: <1326147815-11451-16-git-send-email-szymon@janc.net.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,

> >  #define QUICKSTART_PF_DRIVER_NAME	"quickstart"
> >  #define QUICKSTART_PF_DEVICE_NAME	"quickstart"
> > 
> > +#define QS_INFO(fmt, arg...)	printk(KERN_INFO "quickstart: " fmt "\n",
> > ##arg) +#define QS_ERR(fmt, arg...)	printk(KERN_ERR "quickstart: " fmt
> > "\n", ##arg) +
> 
> No.  Don't do this.  You can do same thing with pr_err() so you
> don't need to create your own macros.  Just add this to the front:
> 
> #define pr_fmt(fmt) "quickstart: " fmt
> 
> We already have a million standard ways of printing stuff, we don't
> need a million and two.

Ok, and thanks for review! I'll send V2 shortly.

-- 
Szymon K. Janc
szymon@janc.net.pl

