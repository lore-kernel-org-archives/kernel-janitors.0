From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 24 Feb 2018 08:45:16 +0000
Subject: Re: [PATCH] lib/test_kmod: Fix an integer overflow test
Message-Id: <20180224084516.pex3ogxzipzj2o5y@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180122102754.GD23912@mwanda>
 <20180224025941.GB14069@wotan.suse.de>
In-Reply-To: <20180224025941.GB14069@wotan.suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cocci@systeme.lip6.fr

On Sat, Feb 24, 2018 at 02:59:41AM +0000, Luis R. Rodriguez wrote:
> On Mon, Jan 22, 2018 at 01:27:54PM +0300, Dan Carpenter wrote:
> > The main problem is that the parentheses are in the wrong place and the
> > unlikely() call returns either 0 or 1 so it's never less than zero.
> 
> Doh, thanks, yes. Seems worth considering a grammar rule for it.
> 
> > The other problem is that signed integer overflows like "INT_MAX + 1" are
> > undefined behavior.
> 
> Likewise.
> 
> This seems like another possible generic typo issue. But I would not resolve it
> the way you did, in this particular case below num_test_devs represents the
> number of already registered devs, before we increment. So the way to resolve
> this would be:
> 
> 	if (num_test_devs + 1 = INT_MAX)
> 
> I'll get this upstream, thanks!

There is no issue if num_test_devs is INT_MAX.  But capping it at
INT_MAX - 1 is also fine.

regards,
dan carpenter

