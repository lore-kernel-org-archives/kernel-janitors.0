From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 03 Oct 2012 09:12:12 +0000
Subject: Re: drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c:2803:26: sparse: invalid assignment: |=
Message-Id: <20121003091211.GK13767@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121003011535.GB8750@localhost>
In-Reply-To: <20121003011535.GB8750@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Oct 03, 2012 at 09:20:35AM +0200, Yuval Mintz wrote:
> As you can see, this new warning is not alone in the field - there are
> multiple warnings which already appeared when you compiled bnx2x using sparse.
> 

It's better to report new bugs anyway.  Even if it looks hopeless,
someone might decide to address it.  I considered reporting these
earlier when I sent my patches for this file, but I took the other
approach and gave into despair...

regards,
dan carpenter
