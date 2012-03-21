From: James Bottomley <James.Bottomley@HansenPartnership.com>
Date: Wed, 21 Mar 2012 10:11:32 +0000
Subject: Re: [PATCH] [SCSI] pm8001: Add error handler in pm8001_init_sas_add() if kzalloc fails.
Message-Id: <1332324692.2909.39.camel@dabdike.int.hansenpartnership.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1332319094-11864-1-git-send-email-santoshprasadnayak@gmail.com>
	 <1332319785.2909.11.camel@dabdike.int.hansenpartnership.com>
	 <20120321085846.GB3967@mwanda>
In-Reply-To: <20120321085846.GB3967@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: santosh nayak <santoshprasadnayak@gmail.com>, jack_wang@usish.com, mark_salyzyn@xyratex.com, lindar_liu@usish.com, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, 2012-03-21 at 11:58 +0300, Dan Carpenter wrote:
> On Wed, Mar 21, 2012 at 08:49:45AM +0000, James Bottomley wrote:
> > On Wed, 2012-03-21 at 14:08 +0530, santosh nayak wrote:
> > > From: Santosh Nayak <santoshprasadnayak@gmail.com>
> > > 
> > > We need to add error handler if kzalloc fails to allocate and initialize.
> > > Otherwise it may lead to Null derefernce error in 
> > > 'pm8001_chip_get_nvmd_req()'.
> > 
> > It's a GFP_KERNEL allocation.  They sleep until memory is available
> > (__GFP_WAIT).  It's GFP_ATOMIC that can return NULL.
> > 
> 
> That's not right at all.  Only __GFP_NOFAIL allocations don't need
> to be checked.

Ah, right, that's the option I was thinking of.  __GFP_WAIT may fail if
we're in direct reclaim or the oom killer gets activated.

James


