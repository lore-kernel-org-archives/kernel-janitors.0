From: James Bottomley <jejb@linux.ibm.com>
Date: Thu, 14 Feb 2019 21:24:37 +0000
Subject: Re: [PATCH -next] scsi: lpfc: Remove set but not used variable 'phys_id'
Message-Id: <1550179477.4558.27.camel@linux.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1536804299-64730-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1536804299-64730-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, 2019-02-14 at 13:19 -0800, James Smart wrote:
> 
> On 2/14/2019 11:39 AM, James Bottomley wrote:
> > On Thu, 2019-02-14 at 10:52 -0800, James Smart wrote:
> > > On 2/13/2019 5:51 PM, YueHaibing wrote:
> > > > Fixes gcc '-Wunused-but-set-variable' warning:
> > > > 
> > > > drivers/scsi/lpfc/lpfc_init.c: In function
> > > > 'lpfc_cpu_affinity_check':
> > > > drivers/scsi/lpfc/lpfc_init.c:10599:19: warning:
> > > >    variable 'phys_id' set but not used [-Wunused-but-set-
> > > > variable]
> > > > 
> > > > It never used since introduction in commit 6a828b0f6192 ("scsi:
> > > > lpfc: Support
> > > > non-uniform allocation of MSIX vectors to hardware queues")
> > > > 
> > > > Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> > > > ---
> > > >    drivers/scsi/lpfc/lpfc_init.c | 3 +--
> > > >    1 file changed, 1 insertion(+), 2 deletions(-)
> > > > 
> > > > 
> > > 
> > > Looks fine. Thanks
> > > 
> > > Signed-off-by:   James Smart  <james.smart@broadcom.com>
> > 
> > Under the DCO this can't be a Signed-off-by tag: signoffs track the
> > patch transmission path under the DCO, so unless you send it you
> > can't
> > add your signoff.
> > 
> > If you just want Martin to apply it now, and you don't want to
> > gather and resend it with your other lpfc patches, I think the tag
> > you want is Acked-by.
> > 
> > James
> 
> I've been told multiple answers on which way to reply over the years.
> My initial position followed your statement, but a later rebuke
> (would have to look hard to find it)

If you could, that would help me find and correct the source ...

>  told me as maintainer that I should be doing something different. 
> I'll go back to the DCO definitions and follow
> those.

Great, thanks.  Our only tag with formal requirements from the DCO is
Signed-off-by: everything else is undefined by the DCO (and thus more
prone to being argued over and having more per-subsystem meanings that
lead to irreconcilable differences between subsystem use).

James


> Thanks for cleaning it up Martin.
> 
> -- james
> 
