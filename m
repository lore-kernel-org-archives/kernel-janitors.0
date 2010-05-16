From: Dan Carpenter <error27@gmail.com>
Date: Sun, 16 May 2010 15:50:43 +0000
Subject: Re: [PATCH 35/37] drivers/block/aoe: Use kmemdup
Message-Id: <20100516155043.GB12354@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1005152323310.21345@ask.diku.dk> <FA04A0D0-4BAF-4E1D-B8E8-3148E290009F@coraid.com>
In-Reply-To: <FA04A0D0-4BAF-4E1D-B8E8-3148E290009F@coraid.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ed Cashin <ecashin@coraid.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Julia Lawall <julia@diku.dk>

On Sun, May 16, 2010 at 08:42:59AM -0400, Ed Cashin wrote:
> On May 15, 2010, at 5:23 PM, Julia Lawall wrote:
> 
> > From: Julia Lawall <julia@diku.dk>
> > 
> > Use kmemdup when some other buffer is immediately copied into the
> > allocated region.
> 
> I have seen this patch but have no comment about it specifically.
> 
> (Because the argument about whether this kind of change
> adds value in general has already taken place.  I'd say no, but that's 
> based on a maybe faulty idea that if folks weren't doing this they'd have
> more time for reviewing patches, etc.)

Nah nah.  Nit-picky patches like this is what you get when people start
reviewing code.  It's really hard to review code properly without being
annoyed and writing clean up patches is very calming.

git log --pretty=oneline --grep=Lawall

Tons and tons of bugs fixed.

regards,
dan carpenter

