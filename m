From: Steve French <smfrench@gmail.com>
Date: Fri, 09 Feb 2018 23:57:03 +0000
Subject: Re: [PATCH][V2] CIFS: SMBD: fix spelling mistake: "faield" and "legnth"
Message-Id: <CAH2r5muR7bKGxjQBgjLbrsDPKOLut_j71vTrq-QNKefNhiJB1w@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180209121415.564-1-colin.king@canonical.com>
In-Reply-To: <20180209121415.564-1-colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Cc: Steve French <sfrench-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, CIFS <linux-cifs-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, samba-technical <samba-technical-w/Ol4Ecudpl8XjKLYN78aQ@public.gmane.org>, kernel-janitors <kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

merged into cifs-2.6.git for-next

On Fri, Feb 9, 2018 at 6:14 AM, Colin King <colin.king@canonical.com> wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> Trivial fix to spelling mistake in log_rdma_send and log_rdma_mr
> message text.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  fs/cifs/smbdirect.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/fs/cifs/smbdirect.c b/fs/cifs/smbdirect.c
> index 91710eb571fb..5aa0b54b32ce 100644
> --- a/fs/cifs/smbdirect.c
> +++ b/fs/cifs/smbdirect.c
> @@ -1025,7 +1025,7 @@ static int smbd_post_send(struct smbd_connection *info,
>
>         for (i = 0; i < request->num_sge; i++) {
>                 log_rdma_send(INFO,
> -                       "rdma_request sge[%d] addr=%llu legnth=%u\n",
> +                       "rdma_request sge[%d] addr=%llu length=%u\n",
>                         i, request->sge[0].addr, request->sge[0].length);
>                 ib_dma_sync_single_for_device(
>                         info->id->device,
> @@ -2295,7 +2295,7 @@ static void smbd_mr_recovery_work(struct work_struct *work)
>                                 rc = ib_dereg_mr(smbdirect_mr->mr);
>                                 if (rc) {
>                                         log_rdma_mr(ERR,
> -                                               "ib_dereg_mr faield rc=%x\n",
> +                                               "ib_dereg_mr failed rc=%x\n",
>                                                 rc);
>                                         smbd_disconnect_rdma_connection(info);
>                                 }
> --
> 2.15.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-cifs" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Thanks,

Steve
