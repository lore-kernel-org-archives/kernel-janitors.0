From: walter harms <wharms@bfs.de>
Date: Sun, 01 Sep 2019 13:04:19 +0000
Subject: Re: [PATCH -next] scsi: smartpqi: remove set but not used variable 'ctrl_info'
Message-Id: <5D6BC1D3.7040605@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190831130348.20552-1-yuehaibing@huawei.com>
In-Reply-To: <20190831130348.20552-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



Am 31.08.2019 15:03, schrieb YueHaibing:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/scsi/smartpqi/smartpqi_init.c: In function 'pqi_driver_version_show':
> drivers/scsi/smartpqi/smartpqi_init.c:6164:24: warning:
>  variable 'ctrl_info' set but not used [-Wunused-but-set-variable]
> 
> commit 6d90615f1346 ("scsi: smartpqi: add sysfs entries") add it but never
> use, so remove it also variable 'shost'
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/scsi/smartpqi/smartpqi_init.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/scsi/smartpqi/smartpqi_init.c b/drivers/scsi/smartpqi/smartpqi_init.c
> index ea5409bebf57..b9e7dabee1e5 100644
> --- a/drivers/scsi/smartpqi/smartpqi_init.c
> +++ b/drivers/scsi/smartpqi/smartpqi_init.c
> @@ -6160,12 +6160,6 @@ static ssize_t pqi_firmware_version_show(struct device *dev,
>  static ssize_t pqi_driver_version_show(struct device *dev,
>  	struct device_attribute *attr, char *buffer)
>  {
> -	struct Scsi_Host *shost;
> -	struct pqi_ctrl_info *ctrl_info;
> -
> -	shost = class_to_shost(dev);
> -	ctrl_info = shost_to_hba(shost);
> -
>  	return snprintf(buffer, PAGE_SIZE,
>  		"%s\n", DRIVER_VERSION BUILD_TIMESTAMP);
>  }
> 

so, only snprintf() is left. That begs an other question:
Is that function need at all or can it be replaced with snprintf() ?

re,
 wh
