From: walter harms <wharms@bfs.de>
Date: Wed, 15 Aug 2012 14:33:58 +0000
Subject: Re: [PATCH 2/5] drivers/scsi/bnx2fc/bnx2fc_io.c: Remove potential NULL dereference
Message-Id: <502BB356.6070001@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1344959388-19719-3-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1344959388-19719-3-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



Am 14.08.2012 17:49, schrieb Julia Lawall:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> If the NULL test is necessary, the initialization involving a dereference of
> the tested value should be moved after the NULL test.
> 
> The sematic patch that fixes this problem is as follows:
> (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @@
> type T;
> expression E;
> identifier i,fld;
> statement S;
> @@
> 
> - T i = E->fld;
> + T i;
>   ... when != E
>       when != i
>   if (E = NULL) S
> + i = E->fld;
> // </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> ---
>  drivers/scsi/bnx2fc/bnx2fc_io.c |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/scsi/bnx2fc/bnx2fc_io.c b/drivers/scsi/bnx2fc/bnx2fc_io.c
> index 73f231c..1dd82db 100644
> --- a/drivers/scsi/bnx2fc/bnx2fc_io.c
> +++ b/drivers/scsi/bnx2fc/bnx2fc_io.c
> @@ -686,7 +686,7 @@ static int bnx2fc_initiate_tmf(struct scsi_cmnd *sc_cmd, u8 tm_flags)
>  {
>  	struct fc_lport *lport;
>  	struct fc_rport *rport = starget_to_rport(scsi_target(sc_cmd->device));
> -	struct fc_rport_libfc_priv *rp = rport->dd_data;
> +	struct fc_rport_libfc_priv *rp;
>  	struct fcoe_port *port;
>  	struct bnx2fc_interface *interface;
>  	struct bnx2fc_rport *tgt;


just to make me happy, could you move the
   rport = starget_to_rport(scsi_target(sc_cmd->device));
a bit down ? Just to impove readability.

re,
 wh

> @@ -712,6 +712,7 @@ static int bnx2fc_initiate_tmf(struct scsi_cmnd *sc_cmd, u8 tm_flags)
>  		rc = FAILED;
>  		goto tmf_err;
>  	}
> +	rp = rport->dd_data;
>  
>  	rc = fc_block_scsi_eh(sc_cmd);
>  	if (rc)
> 
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 
