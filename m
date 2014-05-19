From: Saurav Kashyap <saurav.kashyap@qlogic.com>
Date: Mon, 19 May 2014 16:07:52 +0000
Subject: Re: [PATCH 2/13 v2] [SCSI] qla2xxx: make return of 0 explicit
Message-Id: <F5D084D6342F9B479C34599BB0A03E4D01284E742E@AVMB1.qlogic.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1400474832-22422-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1400474832-22422-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>, Dept-Eng QLA2xxx Upstream <qla2xxx-upstream@qlogic.com>
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "James E.J. Bottomley" <JBottomley@parallels.com>, linux-scsi <linux-scsi@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>

Hi Julia,

Status is already set to 0 at the beginning of the function, I think
we should just "return status" here to be consistent with the rest of
the function.

=====
diff --git a/drivers/scsi/qla2xxx/qla_init.c
b/drivers/scsi/qla2xxx/qla_init.c
index 76af6b6..e339833 100644
--- a/drivers/scsi/qla2xxx/qla_init.c
+++ b/drivers/scsi/qla2xxx/qla_init.c
@@ -4587,7 +4587,6 @@ qla2x00_abort_isp(scsi_qla_host_t *vha)
                if (unlikely(pci_channel_offline(ha->pdev) &&
                    ha->flags.pci_channel_io_perm_failure)) {
                        clear_bit(ISP_ABORT_RETRY, &vha->dpc_flags);
-                       status = 0;
                        return status;
                }
====
Thanks,
~Saurav
 




>From: Julia Lawall <Julia.Lawall@lip6.fr>
>
>Delete unnecessary use of a local variable to immediately return 0.
>
>A simplified version of the semantic patch that fixes this problem is as
>follows: (http://coccinelle.lip6.fr/)
>
>// <smpl>
>@r exists@
>local idexpression ret;
>expression e;
>position p;
>@@
>
>-ret = 0;
>... when != ret = e
>return 
>- ret
>+ 0
>  ;
>// </smpl>
>
>Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
>
>---
>Changed subject line, which was not appreciated by some spam filters.
>
> drivers/scsi/qla2xxx/qla_init.c |    3 +--
> 1 file changed, 1 insertion(+), 2 deletions(-)
>
>diff --git a/drivers/scsi/qla2xxx/qla_init.c
>b/drivers/scsi/qla2xxx/qla_init.c
>index 38aeb54..a63f9b6 100644
>--- a/drivers/scsi/qla2xxx/qla_init.c
>+++ b/drivers/scsi/qla2xxx/qla_init.c
>@@ -4593,8 +4593,7 @@ qla2x00_abort_isp(scsi_qla_host_t *vha)
> 		if (unlikely(pci_channel_offline(ha->pdev) &&
> 		    ha->flags.pci_channel_io_perm_failure)) {
> 			clear_bit(ISP_ABORT_RETRY, &vha->dpc_flags);
>-			status = 0;
>-			return status;
>+			return 0;
> 		}
> 
> 		ha->isp_ops->get_flash_version(vha, req->ring);

