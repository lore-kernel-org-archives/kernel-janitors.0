From: James Bottomley <James.Bottomley@HansenPartnership.com>
Date: Thu, 10 Jan 2008 20:09:32 +0000
Subject: Re: [patch 1/1] Switch ioctl functions of drivers/scsi/sg.c to
Message-Id: <1199995772.3141.90.camel@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20080110180529.GA32640@skl-net.de>
	 <1199991298.3141.75.camel@localhost.localdomain>
	 <20080110185944.GA1690@one.firstfloor.org>
	 <20080110190748.GA20152@skl-net.de>
	 <20080110192950.GG747@one.firstfloor.org>
	 <20080110194550.GB20152@skl-net.de>
In-Reply-To: <20080110194550.GB20152@skl-net.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andre Noll <maan@systemlinux.org>
Cc: Andi Kleen <andi@firstfloor.org>, linux-scsi <linux-scsi@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Richard Knutsson <ricknu-0@student.ltu.se>


On Thu, 2008-01-10 at 20:45 +0100, Andre Noll wrote:
> On 20:29, Andi Kleen wrote:
> 
> > > Sure, I can do that if James likes the idea. Since not all case
> > > statements need the BKL, we could add it only to those for which it
> > > isn't clear that it is unnecessary.
> > > 
> > > And this would actually improve something.
> > 
> > I still think it would be a good strategy to first add it to all
> > (in a essentially nop semantics patch) and then later eliminate
> > it from the cases that obviously don't need it. 
> 
> James, would you accept such a patch?

Our current suspicion is that none of the SCSI ioctl paths require the
BKL.  Al Viro said he'd try to look into this, so currently I think the
conversion path is just to move .ioctl -> .unlocked_ioctl

However, more eyes on the problem would be most welcome.

James


