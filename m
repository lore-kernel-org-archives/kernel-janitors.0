From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 14 Aug 2013 13:56:13 +0000
Subject: Re: [patch] f2fs: alloc_page() doesn't return an ERR_PTR
Message-Id: <20130814135613.GF4713@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130814114136.GA8044@elgon.mountain>
 <1376486676.2354.5.camel@kjgkr>
In-Reply-To: <1376486676.2354.5.camel@kjgkr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaegeuk Kim <jaegeuk.kim@samsung.com>
Cc: linux-f2fs-devel@lists.sourceforge.net, kernel-janitors@vger.kernel.org

On Wed, Aug 14, 2013 at 10:24:36PM +0900, Jaegeuk Kim wrote:
> Hi Dan,
> 
> Agreed.
> Could you make a patch that covers other alloc_page cases too?

Sure.  Thanks for catching that.  I will resend a v2 of this one
which fixes those as well.

regards,
dan carpenter

