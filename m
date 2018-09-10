From: "Madhani, Himanshu" <Himanshu.Madhani@cavium.com>
Date: Mon, 10 Sep 2018 17:49:14 +0000
Subject: Re: [PATCH] scsi: qla2xxx: fix typo "CT-PASSTRHU" -> "CT-PASSTHRU"
Message-Id: <1E6E5FDA-33ED-4CBB-8E96-D3086EEE6B88@cavium.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180909222503.8298-1-colin.king@canonical.com>
In-Reply-To: <20180909222503.8298-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Dept-Eng QLA2xxx Upstream <qla2xxx-upstream@cavium.com>, "James E . J . Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi <linux-scsi@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>


> On Sep 9, 2018, at 3:25 PM, Colin King <colin.king@canonical.com> wrote:
> 
> External Email
> 
> From: Colin Ian King <colin.king@canonical.com>
> 
> Trivial fix to typo in debug message text.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
> drivers/scsi/qla2xxx/qla_gs.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/scsi/qla2xxx/qla_gs.c b/drivers/scsi/qla2xxx/qla_gs.c
> index a0038d879b9d..b48ff0095843 100644
> --- a/drivers/scsi/qla2xxx/qla_gs.c
> +++ b/drivers/scsi/qla2xxx/qla_gs.c
> @@ -4289,7 +4289,7 @@ static int qla24xx_async_gnnft(scsi_qla_host_t *vha, struct srb *sp,
>        }
> 
>        ql_dbg(ql_dbg_disc, vha, 0xfffff,
> -           "%s: FC4Type %x, CT-PASSTRHU %s command ctarg rsp size %d, ctarg req size %d\n",
> +           "%s: FC4Type %x, CT-PASSTHRU %s command ctarg rsp size %d, ctarg req size %d\n",
>            __func__, fc4_type, sp->name, sp->u.iocb_cmd.u.ctarg.rsp_size,
>             sp->u.iocb_cmd.u.ctarg.req_size);
> 
> --
> 2.17.1
> 

Acked-By: Himanshu Madhani <himanshu.madhani@cavium.com>

Thanks,
- Himanshu
