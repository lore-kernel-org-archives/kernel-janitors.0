From: Greg KH <gregkh@suse.de>
Date: Sun, 06 Jun 2010 16:37:06 +0000
Subject: Re: [PATCH] drivers/staging/batman-adv: fix function prototype
Message-Id: <20100606163706.GB14387@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1275787408.10961.13.camel@lenovo>
In-Reply-To: <1275787408.10961.13.camel@lenovo>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, Jun 06, 2010 at 09:41:36AM +0200, Sven Eckelmann wrote:
> On Sunday 06 June 2010 03:23:28 you wrote:
> > In today linux-next I got a compile warning in staging/batman-adv.
> > 
> > This is due a struct bin_attribute read function prototype change and the
> > driver was not updated.
> > 
> > This patch solves the issue
> > 
> > Signed-off-by: Javier Martinez Canillas <martinez.javier@gmail.com>
> > ---
> [...]
> > 
> > -static ssize_t transtable_local_read(struct kobject *kobj,
> [...]
> > 
> > -static ssize_t transtable_global_read(struct kobject *kobj,
> [...]
> > 
> > -static ssize_t originators_read(struct kobject *kobj,
> [...]
> > 
> > -static ssize_t vis_data_read(struct kobject *kobj,
> [...]
> 
> These files were already removed and the patch is waiting in GregKH's queue.

Hm, but those files are not going to be removed until 2.6.36, right?  So
I think we need this patch now to keep 2.6.35 working properly.  Or am I
mistaken?

thanks,

greg k-h
