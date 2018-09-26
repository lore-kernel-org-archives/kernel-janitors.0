From: "Madhani, Himanshu" <Himanshu.Madhani@cavium.com>
Date: Wed, 26 Sep 2018 16:26:55 +0000
Subject: Re: [PATCH] scsi: qla2xxx: don't allow negative thresholds
Message-Id: <8141FFBC-174F-44C6-AECD-E06B99A3E2F2@cavium.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180920100236.GB9551@mwanda>
In-Reply-To: <20180920100236.GB9551@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


> On Sep 20, 2018, at 3:02 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> 
> External Email
> 
> We shouldn't allow negative thresholds.  I don't know what it would do
> but it can't be good.
> 
> Fixes: 8b4673ba3a1b ("scsi: qla2xxx: Add support for ZIO6 interrupt threshold")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/scsi/qla2xxx/qla_attr.c b/drivers/scsi/qla2xxx/qla_attr.c
> index a31d23905753..b28f159fdaee 100644
> --- a/drivers/scsi/qla2xxx/qla_attr.c
> +++ b/drivers/scsi/qla2xxx/qla_attr.c
> @@ -1228,7 +1228,7 @@ qla_zio_threshold_store(struct device *dev, struct device_attribute *attr,
>                return -EINVAL;
>        if (sscanf(buf, "%d", &val) != 1)
>                return -EINVAL;
> -       if (val > 256)
> +       if (val < 0 || val > 256)
>                return -ERANGE;
> 
>        atomic_set(&vha->hw->zio_threshold, val);

Looks Good. 

Acked-by: Himanshu Madhani <himanshu.madhani@cavium.com>

Thanks,
- Himanshu
