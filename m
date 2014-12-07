From: Julia Lawall <julia.lawall@lip6.fr>
Date: Sun, 07 Dec 2014 21:05:10 +0000
Subject: Re: [PATCH 19/20] TTY: fix misspelling of current function in string
Message-Id: <alpine.DEB.2.02.1412072201430.2235@localhost6.localdomain6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1417980062-25151-1-git-send-email-Julia.Lawall@lip6.fr> <1417980062-25151-20-git-send-email-Julia.Lawall@lip6.fr> <20141207205437.GD5360@hudson.localdomain>
In-Reply-To: <20141207205437.GD5360@hudson.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeremiah Mahler <jmmahler@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, 7 Dec 2014, Jeremiah Mahler wrote:

> Julia,
> 
> On Sun, Dec 07, 2014 at 08:21:01PM +0100, Julia Lawall wrote:
> > Replace a misspelled function name by %s and then __func__.
> > 
> > This was done using Coccinelle, including the use of Levenshtein distance,
> > as proposed by Rasmus Villemoes.
> > 
> > Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> > 
> > ---
> > The semantic patch is difficult to summarize, but is available in the cover
> [...]
> > @@ -1458,7 +1458,7 @@ static void rp_wait_until_sent(struct tty_struct *tty, int timeout)
> >  
> >  	orig_jiffies = jiffies;
> >  #ifdef ROCKET_DEBUG_WAIT_UNTIL_SENT
> > -	printk(KERN_INFO "In RP_wait_until_sent(%d) (jiff=%lu)...\n", timeout,
> > +	printk(KERN_INFO "In %s(%d) (jiff=%lu)...\n", __func__, timeout,
> >  	       jiffies);
> >  	printk(KERN_INFO "cps=%d...\n", info->cps);
> >  #endif
> > 
> More printk, pr_info, I'm sure you get the idea :-)

Well, these are drivers, so it should probably be dev_info, etc.

I have the impression that satisfying checkpatch would require a more 
complicated change than the original patch.

I would still find it better to makes these changes in another patch 
series.

julia
