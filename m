From: Dan Magenheimer <dan.magenheimer@oracle.com>
Date: Thu, 06 Sep 2012 16:32:54 +0000
Subject: RE: [patch] staging: ramster: fix range checks in zcache_autocreate_pool()
Message-Id: <a8f8ff87-ca0e-4a16-adc5-a9af8cbb5026@default>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120906124020.GA28946@elgon.mountain>
 <20120906162515.GA423@kroah.com>
In-Reply-To: <20120906162515.GA423@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: devel@driverdev.osuosl.org, linux-mm@kvack.org, kernel-janitors@vger.kernel.org, Konrad Wilk <konrad.wilk@oracle.com>

> From: Greg Kroah-Hartman [mailto:gregkh@linuxfoundation.org]
> Subject: Re: [patch] staging: ramster: fix range checks in zcache_autocreate_pool()
> 
> On Thu, Sep 06, 2012 at 03:40:20PM +0300, Dan Carpenter wrote:
> > If "pool_id" is negative then it leads to a read before the start of the
> > array.  If "cli_id" is out of bounds then it leads to a NULL dereference
> > of "cli".  GCC would have warned about that bug except that we
> > initialized the warning message away.
> >
> > Also it's better to put the parameter names into the function
> > declaration in the .h file.  It serves as a kind of documentation.
> >
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> > BTW, This file has a ton of GCC warnings.  This function returns -1
> > on error which is a nonsense return code but the return value is not
> > checked anyway.  *Grumble*.
> 
> I agree, it's very messy.  Dan Magenheimer should have known better, and
> he better be sending me a patch soon to remove these warnings (hint...)

On its way soon.

Dan
