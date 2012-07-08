From: Fengguang Wu <wfg@linux.intel.com>
Date: Sun, 08 Jul 2012 11:52:02 +0000
Subject: Re: [rcu:fixes.2012.07.06a 12/19] undefined reference to `rcu_is_cpu_idle'
Message-Id: <20120708115202.GB14882@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120707171803.GA24989@localhost>
In-Reply-To: <20120707171803.GA24989@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, Jul 08, 2012 at 02:27:46AM -0700, Paul E. McKenney wrote:
> On Sun, Jul 08, 2012 at 11:57:52AM +0300, Dan Carpenter wrote:
> > I don't know that the wfg@linux.intel.com email address works.
> > 
> > I added it it in the last thread an Fengguang said it only failed
> > because of a fluke.  I insisted that it still wasn't working.  But
> > I see now that Fengguang removed the working email address from
> > the list so my reply never got through.

I did received Paul's emails to wfg@linux.intel.com. You have more
emails that are missed by me?

> > Fengguang please leave your working email address on the CC list.

Sorry, I didn't notice that. It seems that mutt automatically removes
my @intel.com address from the CC list, when the other
@linux.intel.com address is used..

> I forwarded my response to him.  Summary: Fixed by d7118175 in -next,
> -tip, and -rcu.

Got it and replied :)

Thanks,
Fengguang
