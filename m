From: Takashi Iwai <tiwai@suse.de>
Date: Sat, 15 Nov 2008 18:09:26 +0000
Subject: Re: [PATCH 3/3, repost] sound/pci/pcxhr/pcxhr.c: introduce missing kfree and pci_disable_device
Message-Id: <s5hk5b4x3mx.wl%tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0811141907200.10023@pc-004.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0811141907200.10023@pc-004.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: perex@perex.cz, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

At Fri, 14 Nov 2008 19:08:18 +0100 (CET),
Julia Lawall wrote:
> 
> From: Julia Lawall <julia@diku.dk>
> 
> Error handling code following a kzalloc should free the allocated data.
> The error handling code is adjusted to call pci_disable_device(pci); as
> well, as done later in the function
> 
> The semantic match that finds the problem is as follows:
> (http://www.emn.fr/x-info/coccinelle/)
> 
> // <smpl>
> @r exists@
> local idexpression x;
> statement S;
> expression E;
> identifier f,l;
> position p1,p2;
> expression *ptr != NULL;
> @@
> 
> (
> if ((x@p1 = \(kmalloc\|kzalloc\|kcalloc\)(...)) = NULL) S
> |
> x@p1 = \(kmalloc\|kzalloc\|kcalloc\)(...);
> ...
> if (x = NULL) S
> )
> <... when != x
>      when != if (...) { <+...x...+> }
> x->f = E
> ...>
> (
>  return \(0\|<+...x...+>\|ptr\);
> |
>  return@p2 ...;
> )
> 
> @script:python@
> p1 << r.p1;
> p2 << r.p2;
> @@
> 
> print "* file: %s kmalloc %s return %s" % (p1[0].file,p1[0].line,p2[0].line)
> // </smpl>
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>

Applied now.  Thanks.


Takashi
