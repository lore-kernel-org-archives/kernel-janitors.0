From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 26 Jun 2019 14:37:55 +0000
Subject: Re: [PATCH] scsi: mpt3sas: clean up a sizeof()
Message-Id: <20190626143755.GF28859@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190626101243.GF3242@mwanda>
In-Reply-To: <20190626101243.GF3242@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Jun 26, 2019 at 07:22:30AM -0700, James Bottomley wrote:
> On Wed, 2019-06-26 at 13:12 +0300, Dan Carpenter wrote:
> > This patch is just a cleanup and doesn't change run time because both
> > sizeof EVENT and SCSI are 84 bytes.  But this is clearly a cut and
> > paste
> > error and the SCSI struct was intended.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> >  drivers/scsi/mpt3sas/mpt3sas_ctl.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/scsi/mpt3sas/mpt3sas_ctl.c
> > b/drivers/scsi/mpt3sas/mpt3sas_ctl.c
> > index d4ecfbbe738c..06a901ed743c 100644
> > --- a/drivers/scsi/mpt3sas/mpt3sas_ctl.c
> > +++ b/drivers/scsi/mpt3sas/mpt3sas_ctl.c
> > @@ -3280,7 +3280,7 @@ diag_trigger_scsi_store(struct device *cdev,
> >  	spin_lock_irqsave(&ioc->diag_trigger_lock, flags);
> >  	sz = min(sizeof(struct SL_WH_SCSI_TRIGGERS_T), count);
> >  	memset(&ioc->diag_trigger_scsi, 0,
> > -	    sizeof(struct SL_WH_EVENT_TRIGGERS_T));
> > +	    sizeof(struct SL_WH_SCSI_TRIGGERS_T));
> 
> Please can we make this the correct pattern of
> 
> sizeof(ioc->diag_trigger_scsi)

Sure.  I'll resend.

regards,
dan carpenter
