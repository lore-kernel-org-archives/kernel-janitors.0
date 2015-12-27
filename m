From: Julia Lawall <julia.lawall@lip6.fr>
Date: Sun, 27 Dec 2015 06:08:44 +0000
Subject: Re: [PATCH 0/3] IDE-ACPI: Fine-tuning for a function
Message-Id: <alpine.DEB.2.02.1512270707320.2038@localhost6.localdomain6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>  <567E6799.5070802@users.sourceforge.net>  <20151226.131257.1589698540013987354.davem@davemloft.net> <1451173382.12498.10.camel@perches.com>
In-Reply-To: <1451173382.12498.10.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>
Cc: David Miller <davem@davemloft.net>, elfring@users.sourceforge.net, linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org



On Sat, 26 Dec 2015, Joe Perches wrote:

> On Sat, 2015-12-26 at 13:12 -0500, David Miller wrote:
> > IDE is in deep freeze maintainence mode.
> > 
> > Therefore patches that perform simplications and cleanups will
> > not be accepted.
> 
> Maybe there should be something like a README
> in drivers/ide that says that.
> 
> Maybe the MAINTAINERS entry for "IDE SUBSYSTEM"
> should be something like:
> 
> S:	Frozen - critical fixes only

This could be a good idea.  Sometimes I hold off on sending patches for 
things becuse I have the impression that the subsystem doesn't want minor 
fixes, but I could be wrong, and if one could have a deterministic way to 
know, it could be better for everyone.

julia
