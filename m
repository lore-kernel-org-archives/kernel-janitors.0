From: Chris Sanford <crsanford@gmail.com>
Date: Wed, 20 May 2009 04:32:15 +0000
Subject: Re: [PATCH] include KERN_* constant in printk calls
Message-Id: <20090520043215.GA3077@chrisubuntu-laptop>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090518233121.GC3109@chrisubuntu-laptop> <20090519090049.GB9388@elte.hu>
In-Reply-To: <20090519090049.GB9388@elte.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Molnar <mingo@elte.hu>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, peterz@infradead.org

On Tue, May 19 09 11:00, Ingo Molnar wrote:
> 
> * Chris Sanford <crsanford@gmail.com> wrote:
> 
> > Add the KERN_CONT constant to two printk calls.
> > 
> > Signed-off-by: Chris Sanford <crsanford@gmail.com>
> > 
> > ---
> > 
> > 
> > diff --git a/kernel/sched.c b/kernel/sched.c
> > index 26efa47..6a2ed16 100644
> > --- a/kernel/sched.c
> > +++ b/kernel/sched.c
> > @@ -7319,7 +7319,7 @@ static int sched_domain_debug_one(struct sched_domain *sd, int cpu, int level,
> >  	printk(KERN_DEBUG "%*s domain %d: ", level, "", level);
> >  
> >  	if (!(sd->flags & SD_LOAD_BALANCE)) {
> > -		printk("does not load-balance\n");
> > +		printk(KERN_CONT "does not load-balance\n");
> >  		if (sd->parent)
> >  			printk(KERN_ERR "ERROR: !SD_LOAD_BALANCE domain"
> >  					" has parent");
> > @@ -7340,7 +7340,7 @@ static int sched_domain_debug_one(struct sched_domain *sd, int cpu, int level,
> >  	printk(KERN_DEBUG "%*s groups:", level + 1, "");
> >  	do {
> >  		if (!group) {
> > -			printk("\n");
> > +			printk(KERN_CONT "\n");
> >  			printk(KERN_ERR "ERROR: group is NULL\n");
> >  			break;
> 
> Please use pr_cont() - and while at it, perhaps convert all other 
> printk()s in sched.c from KERN_* to the pr_*() notation as well?
> 
> Thanks,
> 
> 	Ingo
> --

The KERN_DEBUG constant is used 5 times when DEBUG is undefined. 
Doing a straight conversion from printk(KERN_DEBUG to pr_debug( will
result in no messages being printed. Should these calls have a different
message type, should DEBUG be defined, or should something else be done?
Thanks,
Chris
