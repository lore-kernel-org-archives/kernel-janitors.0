From: Aaron Lu <aaron.lu@amd.com>
Date: Sat, 19 May 2012 03:38:21 +0000
Subject: Re: [patch] [SCSI] scsi_pm: passing wrong pointer to resume()
Message-Id: <20120519033821.GA2425@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120518140827.GA1584@elgon.mountain>
 <2FB252790F768E479D722B6F9B6D68C4B03E50@SCYBEXDAG02.amd.com>
In-Reply-To: <2FB252790F768E479D722B6F9B6D68C4B03E50@SCYBEXDAG02.amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "James E.J. Bottomley" <JBottomley@parallels.com>, Alan Stern <stern@rowland.harvard.edu>, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Aaron Lu <aaron.lwe@gmail.com>

> From: Dan Carpenter [dan.carpenter@oracle.com]
> To: James E.J. Bottomley; Lu, Aaron
> Cc: linux-scsi@vger.kernel.org; linux-kernel@vger.kernel.org; kernel-janitors@vger.kernel.org; Alan Stern
> Subject: [patch] [SCSI] scsi_pm: passing wrong pointer to resume()
> 
> This gets caught by GCC:
> drivers/scsi/scsi_pm.c:30:5: warning: passing argument 1 of
>         ‘scsi_device_resume’ from incompatible pointer type
>         [enabled by default]

Thanks for pointing this out.
I've posted v2 the other day and James is aware of this already:
http://marc.info/?l=linux-scsi&m3706440112890&w=2

> 
> It probably would have been caught in testing as well, but it's on an
> error path.

I'm dealing with such error so developed this patch. But there are other
changes too in my code, so I prepared this patch in another clean repo
and made the mistake, sorry for not testing it before submit. 

-Aaron

> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> I haven't tested this.  :/  Sorry for that.
> 
> diff --git a/drivers/scsi/scsi_pm.c b/drivers/scsi/scsi_pm.c
> index 9bd2c41..d4201de 100644
> --- a/drivers/scsi/scsi_pm.c
> +++ b/drivers/scsi/scsi_pm.c
> @@ -27,7 +27,7 @@ static int scsi_dev_type_suspend(struct device *dev, pm_message_t msg)
>                 if (drv && drv->suspend) {
>                         err = drv->suspend(dev, msg);
>                         if (err)
> -                               scsi_device_resume(dev);
> +                               scsi_device_resume(to_scsi_device(dev));
>                 }
>         }
>         dev_dbg(dev, "scsi suspend: %d\n", err);
> 
