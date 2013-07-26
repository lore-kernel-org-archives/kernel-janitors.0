From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 26 Jul 2013 20:53:01 +0000
Subject: Re: Need clearance before sending patch
Message-Id: <20130726205301.GB5636@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.02.1307261746260.2266@hadrien>
In-Reply-To: <alpine.DEB.2.02.1307261746260.2266@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Jul 26, 2013 at 05:51:27PM +0200, Julia Lawall wrote:
> On Fri, 26 Jul 2013, Kumar Gaurav wrote:
> 
> >Hi Dan,
> >
> >I had sent my first patch with lots of changes which wasn't correct.
> >Now i'm splitting them in parts as below:
> >1.One patch for variable name replacement (one patch per file)
> >2.One Patch for fixing coding style issue (one patch per file)
> >3.One Patch for fixing warning about using pr_warn,pr_error
> >functions instead of printk(KERN_WARNING... and printk(KERN_ERR...
> >(havn't replaced yet as last time you weren't convinced)

The pr_warn() thing works differently from how you were doing it.

wrong  : pr_warn(KERN_WARN "msg\n");
correct: pr_warn("msg\n");

But I think Julia has a good suggestion.

regards,
dan carpenter

