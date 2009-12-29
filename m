From: Julia Lawall <julia@diku.dk>
Date: Tue, 29 Dec 2009 20:04:05 +0000
Subject: Re: [PATCH 3/5] drivers/scsi : Correct the size argument to kmalloc
Message-Id: <Pine.LNX.4.64.0912292103180.4001@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0912292015420.4001@ask.diku.dk>
 <200912292102.43373.eike-kernel@sf-tec.de>
In-Reply-To: <200912292102.43373.eike-kernel@sf-tec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rolf Eike Beer <eike-kernel@sf-tec.de>
Cc: James.Bottomley@suse.de, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, 29 Dec 2009, Rolf Eike Beer wrote:

> Julia Lawall wrote:
> > From: Julia Lawall <julia@diku.dk>
> > 
> > In each case, the destination of the allocation has type struct **, so the
> > elements of the array should have pointer type, not structure type.
> 
> Maybe they should even by kcalloc'ed?

I thought about that, but in response to another patch someone seemed to 
think kcalloc was not very useful.  But I can certainly change it in this 
case.

julia
