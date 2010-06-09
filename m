From: Greg KH <gregkh@suse.de>
Date: Wed, 09 Jun 2010 16:31:03 +0000
Subject: Re: [PATCH] drivers/staging/batman-adv: fix function prototype
Message-Id: <20100609163103.GA23395@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1275787408.10961.13.camel@lenovo>
In-Reply-To: <1275787408.10961.13.camel@lenovo>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Jun 09, 2010 at 06:13:32PM +0200, Sven Eckelmann wrote:
> On Sun, Jun 06, 2010 at 09:37:06AM -0700, Greg KH wrote:
> > On Sun, Jun 06, 2010 at 09:41:36AM +0200, Sven Eckelmann wrote:
> > > On Sunday 06 June 2010 03:23:28 you wrote:
> > > > In today linux-next I got a compile warning in staging/batman-adv.
> > > > 
> > > > This is due a struct bin_attribute read function prototype change and the
> > > > driver was not updated.
> > > > 
> > > > This patch solves the issue
> > > > 
> > > > Signed-off-by: Javier Martinez Canillas <martinez.javier@gmail.com>
> > > > ---
> > > [...]
> > > > 
> > > > -static ssize_t transtable_local_read(struct kobject *kobj,
> > > [...]
> > > > 
> > > > -static ssize_t transtable_global_read(struct kobject *kobj,
> > > [...]
> > > > 
> > > > -static ssize_t originators_read(struct kobject *kobj,
> > > [...]
> > > > 
> > > > -static ssize_t vis_data_read(struct kobject *kobj,
> > > [...]
> > > 
> > > These files were already removed and the patch is waiting in GregKH's queue.
> > 
> > Hm, but those files are not going to be removed until 2.6.36, right?  So
> > I think we need this patch now to keep 2.6.35 working properly.  Or am I
> > mistaken?
> 
> No, this is correct. I just wanted to write a short notice... but it was a
> little bit too short.
> 
> Situation:
>  * Files were removed (actually moved to debugfs) for 2.6.36
>  * patches for that were already send to Greg
>  * this patch conflicts with at least one patch we already sent
> 
> How it was (hopefully) resolved:
>  * this and another patch was applied in our repo in a special 2.6.35 branch
>  * our debugfs patches (and patches we send at the same time) were rebased
>  * new patches for 2.6.35 and again _all_ patches for 2.6.36 were send to
>    Greg some days ago
> 
> I hope that it is ok for Greg. Otherwise he would have to fix the merge
> conflicts - extra work which (at least I think) isn't is duty. I am not happy
> about the resubmission, but maybe we find a good way to coordinate the
> submission of patches a little bit better.

That's fine, you did great here, I will queue your patches up for .36
and the fixes for .35.  merge conflicts are my job to handle :)

thanks,

greg k-h
