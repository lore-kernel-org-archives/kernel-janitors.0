From: Joe Perches <joe@perches.com>
Date: Tue, 29 Dec 2009 21:23:16 +0000
Subject: Re: [PATCH 3/5] drivers/scsi : Correct the size argument to kmalloc
Message-Id: <1262121796.1888.190.camel@Joe-Laptop.home>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0912292015420.4001@ask.diku.dk>
	 <200912292102.43373.eike-kernel@sf-tec.de>
	 <Pine.LNX.4.64.0912292103180.4001@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0912292103180.4001@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: Rolf Eike Beer <eike-kernel@sf-tec.de>, James.Bottomley@suse.de, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, 2009-12-29 at 21:04 +0100, Julia Lawall wrote:
> On Tue, 29 Dec 2009, Rolf Eike Beer wrote:
> > Julia Lawall wrote:
> > > From: Julia Lawall <julia@diku.dk>
> > > In each case, the destination of the allocation has type struct **, so the
> > > elements of the array should have pointer type, not structure type.
> > Maybe they should even by kcalloc'ed?
> I thought about that, but in response to another patch someone seemed to 
> think kcalloc was not very useful.  But I can certainly change it in this 
> case.

I think kcalloc is useful and should be used when the
allocated array of elements needs to be zeroed.

It appears the uses in 1/5 and 3/5 don't need it but
maybe patch 2/5 and 4/5 should use kcalloc.


