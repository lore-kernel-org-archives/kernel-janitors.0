From: Guenter Roeck <groeck@google.com>
Date: Tue, 07 Apr 2020 14:04:43 +0000
Subject: Re: [PATCH] platform/chrome: cros_ec_sensorhub: Off by one in cros_sensorhub_send_sample()
Message-Id: <CABXOdTehw76P0aTZ5CuT0E0S8qSzNbCrt5neLYM=WFE3Kxwdng@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200407092935.GJ68494@mwanda>
In-Reply-To: <20200407092935.GJ68494@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Benson Leung <bleung@chromium.org>, Gwendal Grignou <gwendal@chromium.org>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Guenter Roeck <groeck@chromium.org>, linux-kernel <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Tue, Apr 7, 2020 at 2:31 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> The sensorhub->push_data[] array has sensorhub->sensor_num elements.
> It's allocated in cros_ec_sensorhub_ring_add().  So the > should be >> to prevent a read one element beyond the end of the array.
>
> Fixes: 145d59baff59 ("platform/chrome: cros_ec_sensorhub: Add FIFO support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
>  drivers/platform/chrome/cros_ec_sensorhub_ring.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/platform/chrome/cros_ec_sensorhub_ring.c b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
> index 230e6cf3da2f..85e8ba782f0c 100644
> --- a/drivers/platform/chrome/cros_ec_sensorhub_ring.c
> +++ b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
> @@ -40,7 +40,7 @@ cros_sensorhub_send_sample(struct cros_ec_sensorhub *sensorhub,
>         int id = sample->sensor_id;
>         struct iio_dev *indio_dev;
>
> -       if (id > sensorhub->sensor_num)
> +       if (id >= sensorhub->sensor_num)
>                 return -EINVAL;
>
>         cb = sensorhub->push_data[id].push_data_cb;
> --
> 2.25.1
>
