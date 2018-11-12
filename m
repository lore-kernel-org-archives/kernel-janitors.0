From: "Javali, Nilesh" <Nilesh.Javali@cavium.com>
Date: Mon, 12 Nov 2018 06:18:27 +0000
Subject: Re: [PATCH -next] scsi: bnx2i: remove set but not used variable 'cid_num'
Message-Id: <D80F1899.29D7A%njavali@caviumnetworks.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1541987645-19467-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1541987645-19467-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



On 11/12/18, 7:24 AM, "YueHaibing" <yuehaibing@huawei.com> wrote:

>External Email
>
>Fixes gcc '-Wunused-but-set-variable' warning:
>
>drivers/scsi/bnx2i/bnx2i_hwi.c: In function 'bnx2i_process_ofld_cmpl':
>drivers/scsi/bnx2i/bnx2i_hwi.c:2430:6: warning:
> variable 'cid_num' set but not used [-Wunused-but-set-variable]
>
>It never used since commit
>  cf4e6363859d ("[SCSI] bnx2i: Add bnx2i iSCSI driver.")
>
>Signed-off-by: YueHaibing <yuehaibing@huawei.com>
>---
> drivers/scsi/bnx2i/bnx2i_hwi.c | 2 --
> 1 file changed, 2 deletions(-)
>
>diff --git a/drivers/scsi/bnx2i/bnx2i_hwi.c
>b/drivers/scsi/bnx2i/bnx2i_hwi.c
>index 6bad268..91f5316 100644
>--- a/drivers/scsi/bnx2i/bnx2i_hwi.c
>+++ b/drivers/scsi/bnx2i/bnx2i_hwi.c
>@@ -2427,7 +2427,6 @@ static void bnx2i_process_ofld_cmpl(struct
>bnx2i_hba *hba,
> {
>        u32 cid_addr;
>        struct bnx2i_endpoint *ep;
>-       u32 cid_num;
>
>        ep = bnx2i_find_ep_in_ofld_list(hba, ofld_kcqe->iscsi_conn_id);
>        if (!ep) {
>@@ -2462,7 +2461,6 @@ static void bnx2i_process_ofld_cmpl(struct
>bnx2i_hba *hba,
>        } else {
>                ep->state = EP_STATE_OFLD_COMPL;
>                cid_addr = ofld_kcqe->iscsi_conn_context_id;
>-               cid_num = bnx2i_get_cid_num(ep);
>                ep->ep_cid = cid_addr;
>                ep->qp.ctx_base = NULL;
>        }
>

Thanks.
Acked-by: Nilesh Javali <nilesh.javali@cavium.com>
