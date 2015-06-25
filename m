From: Vasu Dev <vasu.dev@linux.intel.com>
Date: Thu, 25 Jun 2015 17:44:25 +0000
Subject: Re: [PATCH] SCSI-libfc: Delete an unnecessary check before the function call "fc_fcp_ddp_done"
Message-Id: <1435254265.20022.0.camel@lin-nd1-054.jf.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net>
 <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6>
 <530A086E.8010901@users.sourceforge.net>
 <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6>
 <530A72AA.3000601@users.sourceforge.net>
 <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6>
 <530B5FB6.6010207@users.sourceforge.net>
 <alpine.DEB.2.10.1402241710370.2074@hadrien>
 <530C5E18.1020800@users.sourceforge.net>
 <alpine.DEB.2.10.1402251014170.2080@hadrien>
 <530CD2C4.4050903@users.sourceforge.net>
 <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net> <546E3DDB.5040508@users.sourceforge.net>
 <558AD2D0.6000501@users.sourceforge.net>
In-Reply-To: <558AD2D0.6000501-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
Cc: linux-scsi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "James E. J. Bottomley" <JBottomley-bzQdu9zFT3WakBO8gow8eQ@public.gmane.org>, Julia Lawall <julia.lawall-L2FTfq7BK8M@public.gmane.org>, fcoe-devel-s9riP+hp16TNLxjTenLetw@public.gmane.org

On Wed, 2015-06-24 at 17:54 +0200, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 24 Jun 2015 17:50:32 +0200
> 
> The fc_fcp_ddp_done() function tests whether its argument is NULL and then
> returns immediately. Thus the test around the call is not needed.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/scsi/libfc/fc_exch.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/scsi/libfc/fc_exch.c b/drivers/scsi/libfc/fc_exch.c
> index 1b3a094..aad6f48 100644
> --- a/drivers/scsi/libfc/fc_exch.c
> +++ b/drivers/scsi/libfc/fc_exch.c
> @@ -2120,8 +2120,7 @@ static struct fc_seq *fc_exch_seq_send(struct fc_lport *lport,
>  	spin_unlock_bh(&ep->ex_lock);
>  	return sp;
>  err:
> -	if (fsp)
> -		fc_fcp_ddp_done(fsp);
> +	fc_fcp_ddp_done(fsp);
>  	rc = fc_exch_done_locked(ep);
>  	spin_unlock_bh(&ep->ex_lock);
>  	if (!rc)

Looks good.

Acked-by: Vasu Dev <vasu.dev@intel.com>

