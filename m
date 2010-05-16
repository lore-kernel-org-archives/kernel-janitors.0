From: Julia Lawall <julia@diku.dk>
Date: Sun, 16 May 2010 16:03:42 +0000
Subject: Re: [PATCH 35/37] drivers/block/aoe: Use kmemdup
Message-Id: <Pine.LNX.4.64.1005161800140.11288@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1005152323310.21345@ask.diku.dk>
 <FA04A0D0-4BAF-4E1D-B8E8-3148E290009F@coraid.com> <20100516155043.GB12354@bicker>
In-Reply-To: <20100516155043.GB12354@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Ed Cashin <ecashin@coraid.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun, 16 May 2010, Dan Carpenter wrote:

> On Sun, May 16, 2010 at 08:42:59AM -0400, Ed Cashin wrote:
> > On May 15, 2010, at 5:23 PM, Julia Lawall wrote:
> > 
> > > From: Julia Lawall <julia@diku.dk>
> > > 
> > > Use kmemdup when some other buffer is immediately copied into the
> > > allocated region.
> > 
> > I have seen this patch but have no comment about it specifically.
> > 
> > (Because the argument about whether this kind of change
> > adds value in general has already taken place.  I'd say no, but that's 
> > based on a maybe faulty idea that if folks weren't doing this they'd have
> > more time for reviewing patches, etc.)
> 
> Nah nah.  Nit-picky patches like this is what you get when people start
> reviewing code.  It's really hard to review code properly without being
> annoyed and writing clean up patches is very calming.

Actually, someone asked me to convery a kmalloc to kstrdup, and I saw 
kmemdup nearby, and thought why not...  There is also the similar 
memdup_user.  Using that would more significantly simplify the code, in 
particular reducing the amount of error handling code, since it 
encompasses two calls that can fail (kmalloc and copy_from_user).

julia
