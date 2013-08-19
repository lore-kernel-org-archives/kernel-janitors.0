From: Sarah Sharp <sarah.a.sharp@linux.intel.com>
Date: Mon, 19 Aug 2013 19:55:26 +0000
Subject: Re: [PATCH 5/6] for fixing xhci_readl call in xhci_hub.c after removing xhci_hcd from function defin
Message-Id: <20130819195526.GA8592@xanatos>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130816192434.GG7975@xanatos>
In-Reply-To: <20130816192434.GG7975@xanatos>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, Aug 17, 2013 at 07:08:15PM +0300, Dan Carpenter wrote:
> On Fri, Aug 16, 2013 at 12:24:34PM -0700, Sarah Sharp wrote:
> > In general, please keep the short descriptions of your patches (which
> > turn into the subject lines of your mails) limited to around 55
> > characters.
> 
> 55 is a very austere limit.

That's the limit before git-format patch starts chopping things off in
the generated file name, and it's the limit when vim git commit syntax
highlighting stops highlighting the short description.

> I've been telling people 72 character the same as email.
> `git citool` has a fixed width of 75 characters so that's what I
> normally use in practice.

But hey, 72 is a fine limit too.  I'll start telling people that. :)

Sarah Sharp
