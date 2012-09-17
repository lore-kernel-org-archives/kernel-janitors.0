From: Jiri Kosina <jkosina@suse.cz>
Date: Mon, 17 Sep 2012 10:59:16 +0000
Subject: Re: [patch 1/2] HID: sensors: use GFP_ATOMIC under spinlock
Message-Id: <alpine.LNX.2.00.1209171258310.31149@pobox.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120914065323.GD11886@elgon.mountain>
In-Reply-To: <20120914065323.GD11886@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: srinivas pandruvada <srinivas.pandruvada@intel.com>, linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org, Jonathan Cameron <jic23@cam.ac.uk>

On Fri, 14 Sep 2012, Dan Carpenter wrote:

> We're holding a spinlock here so we can't call kmalloc() with
> GFP_KERNEL.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Signed-off-by: Jiri Kosina <jkosina@suse.cz>

Jonathan, could you please take this one as well, as it depends on the 
series in your tree?

Thanks.

> 
> diff --git a/drivers/hid/hid-sensor-hub.c b/drivers/hid/hid-sensor-hub.c
> index 4ac759c..0c93b10 100644
> --- a/drivers/hid/hid-sensor-hub.c
> +++ b/drivers/hid/hid-sensor-hub.c
> @@ -173,7 +173,7 @@ int sensor_hub_register_callback(struct hid_sensor_hub_device *hsdev,
>  			spin_unlock(&pdata->dyn_callback_lock);
>  			return -EINVAL;
>  		}
> -	callback = kzalloc(sizeof(*callback), GFP_KERNEL);
> +	callback = kzalloc(sizeof(*callback), GFP_ATOMIC);
>  	if (!callback) {
>  		spin_unlock(&pdata->dyn_callback_lock);
>  		return -ENOMEM;
> @@ -462,7 +462,7 @@ static int sensor_hub_raw_event(struct hid_device *hdev,
>  		if (pdata->pending.status && pdata->pending.attr_usage_id =
>  				report->field[i]->usage->hid) {
>  			hid_dbg(hdev, "data was pending ...\n");
> -			pdata->pending.raw_data = kmalloc(sz, GFP_KERNEL);
> +			pdata->pending.raw_data = kmalloc(sz, GFP_ATOMIC);
>  			if (pdata->pending.raw_data) {
>  				memcpy(pdata->pending.raw_data, ptr, sz);
>  				pdata->pending.raw_size  = sz;
> 

-- 
Jiri Kosina
SUSE Labs
