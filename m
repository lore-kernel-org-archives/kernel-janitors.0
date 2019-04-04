From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 04 Apr 2019 19:14:20 +0000
Subject: Re: [PATCH 1/2] fsl_hypervisor: dereferencing error pointers in ioctl
Message-Id: <20190404191420.GQ32613@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181218082003.GD32567@kadam>
 <20190404121044.a38ba5895a485abcdc57f297@linux-foundation.org>
In-Reply-To: <20190404121044.a38ba5895a485abcdc57f297@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Timur Tabi <timur@freescale.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Mihai Caraman <mihai.caraman@freescale.com>, Kumar Gala <galak@kernel.crashing.org>

On Thu, Apr 04, 2019 at 12:10:44PM -0700, Andrew Morton wrote:
> On Tue, 18 Dec 2018 11:20:03 +0300 Dan Carpenter <dan.carpenter@oracle.com> wrote:
> 
> > The strndup_user() function returns error pointers on error, and then
> > in the error handling we pass the error pointers to kfree().  It will
> > cause an Oops.
> > 
> 
> Looks good to me.
> 
> I guess we should fix this too?
> 

I didn't notice that.  Thanks!

regards,
dan carpenter
