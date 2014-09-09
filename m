From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 09 Sep 2014 08:36:27 +0000
Subject: Re: [patch] [media] firewire: firedtv-avc: potential buffer overflow
Message-Id: <20140909083627.GI6549@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140908111843.GC6947@mwanda>
 <20140908140502.20d6f864@kant>
 <20140908144033.42a0762d@kant>
In-Reply-To: <20140908144033.42a0762d@kant>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stefan Richter <stefanr@s5r6.in-berlin.de>
Cc: Mauro Carvalho Chehab <m.chehab@samsung.com>, linux-media@vger.kernel.org, linux1394-devel@lists.sourceforge.net, kernel-janitors@vger.kernel.org

On Mon, Sep 08, 2014 at 02:40:33PM +0200, Stefan Richter wrote:
> On Sep 08 Stefan Richter wrote:
> > On Sep 08 Dan Carpenter wrote:
> > > "program_info_length" is user controlled and can go up to 4095.  The
> > > operand[] array has 509 bytes so we need to add a limit here to prevent
> > > buffer overflows.
> > > 
> > > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > 
> > Reviewed-by: Stefan Richter <stefanr@s5r6.in-berlin.de>
> > 
> > Thank you.
> 
> Oops, that was a bit too quick.  After the memcpy() accesses which you
> protect, there are another four bytes written, still without checking
> the bounds.

Thanks for catching that.  I'll send a v2 soon.

Btw, my static checker complains about the remaining memcpy() in this
file:

drivers/media/firewire/firedtv-avc.c:1310 avc_ca_get_mmi() error: '*len' from user is not capped properly

This static checker warning has a lot of false positives.  I looked at
the code for a long time but couldn't figure out why it thinks "*len"
is untrusted.  I also wasn't totally sure that it was safe?

regards,
dan carpenter

