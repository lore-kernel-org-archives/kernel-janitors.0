From: Sreekanth Reddy <sreekanth.reddy@broadcom.com>
Date: Fri, 26 Jul 2019 09:57:30 +0000
Subject: Re: [PATCH v2] scsi: mpt3sas: clean up a couple sizeof() uses
Message-Id: <CAK=zhgpjPGuzi9Af9pM8QGy2P8nCLuAvFr-DqrW4OvX7QEOs8A@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190726065205.GA22701@mwanda>
In-Reply-To: <20190726065205.GA22701@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Jul 26, 2019 at 12:22 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> There is a copy and paste bug here.  It uses EVENT_TRIGGERS size instead
> of SCSI_TRIGGERS size but fortunately both size are 84 bytes so it
> doesn't affect runtime.
>
> These days the prefered style is to just say sizeof(object) instead of
> sizeof(type) so I have updated the function to the latest style as well.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Acked-by: Sreekanth Reddy <sreekanth.reddy@broadcom.com>

> ---
> v2: Update the style to the 21st Century
>
>  drivers/scsi/mpt3sas/mpt3sas_ctl.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/scsi/mpt3sas/mpt3sas_ctl.c b/drivers/scsi/mpt3sas/mpt3sas_ctl.c
> index d4ecfbbe738c..41c54d4c9451 100644
> --- a/drivers/scsi/mpt3sas/mpt3sas_ctl.c
> +++ b/drivers/scsi/mpt3sas/mpt3sas_ctl.c
> @@ -3278,9 +3278,8 @@ diag_trigger_scsi_store(struct device *cdev,
>         ssize_t sz;
>
>         spin_lock_irqsave(&ioc->diag_trigger_lock, flags);
> -       sz = min(sizeof(struct SL_WH_SCSI_TRIGGERS_T), count);
> -       memset(&ioc->diag_trigger_scsi, 0,
> -           sizeof(struct SL_WH_EVENT_TRIGGERS_T));
> +       sz = min(sizeof(ioc->diag_trigger_scsi), count);
> +       memset(&ioc->diag_trigger_scsi, 0, sizeof(ioc->diag_trigger_scsi));
>         memcpy(&ioc->diag_trigger_scsi, buf, sz);
>         if (ioc->diag_trigger_scsi.ValidEntries > NUM_VALID_ENTRIES)
>                 ioc->diag_trigger_scsi.ValidEntries = NUM_VALID_ENTRIES;
> --
> 2.20.1
>
