From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 03 Dec 2014 11:03:25 +0000
Subject: Re: [patch] mpt2sas: issue reset is not uninitialized
Message-Id: <20141203110325.GL4994@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20141203100941.GB29583@mwanda>
 <alpine.DEB.2.10.1412031135410.2373@hadrien>
In-Reply-To: <alpine.DEB.2.10.1412031135410.2373@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: Nagalakshmi Nandigama <nagalakshmi.nandigama@avagotech.com>, Praveen Krishnamoorthy <praveen.krishnamoorthy@avagotech.com>, Sreekanth Reddy <sreekanth.reddy@avagotech.com>, Abhijit Mahajan <abhijit.mahajan@avagotech.com>, "James E.J. Bottomley" <JBottomley@parallels.com>, MPT-FusionLinux.pdl@avagotech.com, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org, quentin.lambert@inria.fr

On Wed, Dec 03, 2014 at 11:36:20AM +0100, Julia Lawall wrote:
> On Wed, 3 Dec 2014, Dan Carpenter wrote:
> 
> > The issue_reset variables were never set to zero.  This bug was found
> > with static analysis.
> >
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> >
> > diff --git a/drivers/scsi/mpt2sas/mpt2sas_base.c b/drivers/scsi/mpt2sas/mpt2sas_base.c
> > index 58e4521..98bd546 100644
> > --- a/drivers/scsi/mpt2sas/mpt2sas_base.c
> > +++ b/drivers/scsi/mpt2sas/mpt2sas_base.c
> > @@ -3236,7 +3236,7 @@ mpt2sas_base_sas_iounit_control(struct MPT2SAS_ADAPTER *ioc,
> >  	u16 smid;
> >  	u32 ioc_state;
> >  	unsigned long timeleft;
> > -	u8 issue_reset;
> > +	bool issue_reset = 0;
> 
> Why not false if it is going to be a boolean?
> 

Good point.  I'll send a v2 for these tomorrow.

regards,
dan carpenter

