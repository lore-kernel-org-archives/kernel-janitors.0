From: Vasiliy Kulikov <segooon@gmail.com>
Date: Sun, 01 Aug 2010 06:19:34 +0000
Subject: Re: [PATCH 2/7] usb: fsl_udc_core: check return value of
Message-Id: <20100801061934.GB2650@albatros>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1280597900-8405-1-git-send-email-segooon@gmail.com>
	<20100731191743.GF26313@bicker>
In-Reply-To: <20100731191743.GF26313@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>, kernel-janitors@vger.kernel.org, Li Yang <leoli@freescale.com>, David Brownell <dbrownell@users.sourceforge.net>, Greg Kroah-Hartman <gregkh@suse.de>, Dinh Nguyen <Dinh.Nguyen@freescale.com>, Anton Vorontsov <avorontsov@ru.mvista.com>, linux-usb@vger.kernel.org, linuxppc-dev@ozlabs.org, linux-kernel@vger.kernel.org

On Sat, Jul 31, 2010 at 21:17 +0200, Dan Carpenter wrote:
> On Sat, Jul 31, 2010 at 09:38:20PM +0400, Kulikov Vasiliy wrote:
> > create_proc_read_entry() may fail, if so return -ENOMEM.
> > 
> 
> It can fail, but also we return NULL if procfs is disabled.  I haven't
> looked at it very carefully, would this patch break the module if procfs
> was disabled?
Probably you are right, but many drivers in tree compare return value
with NULL. Some of them interpret this as error, some of them simply
call pr_warn("Hmm, I cannot create file in proc, strange..."). Maybe
there is more simplier way to check it without #ifdefs?

> 
> The same applies to the similar patches in this set.
> 
> regards,
> dan carpenter
> 
> 
