From: Sreekanth Reddy <sreekanth.reddy@avagotech.com>
Date: Wed, 10 Dec 2014 06:59:51 +0000
Subject: Re: [patch v2] mpt2sas: issue reset is never uninitialized
Message-Id: <CAK=zhgrs3OA6GsMv+m4pzpRkxzCVEYOVjnPdmedVEgNAtg+zzQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20141204105610.GA22643@mwanda>
In-Reply-To: <20141204105610.GA22643@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Nagalakshmi Nandigama <nagalakshmi.nandigama@avagotech.com>, Praveen Krishnamoorthy <praveen.krishnamoorthy@avagotech.com>, Abhijit Mahajan <abhijit.mahajan@avagotech.com>, "James E.J. Bottomley" <JBottomley@parallels.com>, MPT-FusionLinux.pdl@avagotech.com, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

This patch seems to be good. Please consider this patch as Acked-by:
"Sreekanth Reddy" <Sreekanth.Reddy@avagotech.com>

Regards,
Sreekanth

On Thu, Dec 4, 2014 at 4:26 PM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> The "issue_reset" variable can be used uninitialized.  It should be set
> to false at the start.
>
> Also I cleaned up the types by using bool.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> v2: style fix
>
> diff --git a/drivers/scsi/mpt2sas/mpt2sas_base.c b/drivers/scsi/mpt2sas/mpt2sas_base.c
> index 58e4521..3fb01d1 100644
> --- a/drivers/scsi/mpt2sas/mpt2sas_base.c
> +++ b/drivers/scsi/mpt2sas/mpt2sas_base.c
> @@ -3236,7 +3236,7 @@ mpt2sas_base_sas_iounit_control(struct MPT2SAS_ADAPTER *ioc,
>         u16 smid;
>         u32 ioc_state;
>         unsigned long timeleft;
> -       u8 issue_reset;
> +       bool issue_reset = false;
>         int rc;
>         void *request;
>         u16 wait_state_count;
> @@ -3300,7 +3300,7 @@ mpt2sas_base_sas_iounit_control(struct MPT2SAS_ADAPTER *ioc,
>                 _debug_dump_mf(mpi_request,
>                     sizeof(Mpi2SasIoUnitControlRequest_t)/4);
>                 if (!(ioc->base_cmds.status & MPT2_CMD_RESET))
> -                       issue_reset = 1;
> +                       issue_reset = true;
>                 goto issue_host_reset;
>         }
>         if (ioc->base_cmds.status & MPT2_CMD_REPLY_VALID)
> @@ -3341,7 +3341,7 @@ mpt2sas_base_scsi_enclosure_processor(struct MPT2SAS_ADAPTER *ioc,
>         u16 smid;
>         u32 ioc_state;
>         unsigned long timeleft;
> -       u8 issue_reset;
> +       bool issue_reset = false;
>         int rc;
>         void *request;
>         u16 wait_state_count;
> @@ -3398,7 +3398,7 @@ mpt2sas_base_scsi_enclosure_processor(struct MPT2SAS_ADAPTER *ioc,
>                 _debug_dump_mf(mpi_request,
>                     sizeof(Mpi2SepRequest_t)/4);
>                 if (!(ioc->base_cmds.status & MPT2_CMD_RESET))
> -                       issue_reset = 1;
> +                       issue_reset = true;
>                 goto issue_host_reset;
>         }
>         if (ioc->base_cmds.status & MPT2_CMD_REPLY_VALID)
