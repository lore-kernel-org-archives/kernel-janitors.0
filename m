From: Jonathan Cameron <jic23@kernel.org>
Date: Sat, 16 Apr 2016 12:35:17 +0000
Subject: Re: [PATCH 08/10] iio: common: hid-sensors: use tab for indention
Message-Id: <57123185.8040807@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1460662602-2951-1-git-send-email-sst@poczta.fm>
 <1460662602-2951-9-git-send-email-sst@poczta.fm>
In-Reply-To: <1460662602-2951-9-git-send-email-sst@poczta.fm>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Slawomir Stepien <sst@poczta.fm>, knaack.h@gmx.de, pmeerw@pmeerw.net
Cc: linux-iio@vger.kernel.org, kernel-janitors@vger.kernel.org

On 14/04/16 20:36, Slawomir Stepien wrote:
> This fixes the error reported by checkpatch.pl:
> 
> ERROR: code indent should use tabs where possible
> 
> Signed-off-by: Slawomir Stepien <sst@poczta.fm>
Applied,

Thanks,

Jonathan
> ---
>  drivers/iio/common/hid-sensors/hid-sensor-trigger.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/common/hid-sensors/hid-sensor-trigger.c b/drivers/iio/common/hid-sensors/hid-sensor-trigger.c
> index 5955110..5b41f9d 100644
> --- a/drivers/iio/common/hid-sensors/hid-sensor-trigger.c
> +++ b/drivers/iio/common/hid-sensors/hid-sensor-trigger.c
> @@ -115,7 +115,7 @@ int hid_sensor_power_state(struct hid_sensor_common *st, bool state)
>  		return ret;
>  	}
>  
> - 	return 0;
> +	return 0;
>  #else
>  	atomic_set(&st->user_requested_state, state);
>  	return _hid_sensor_power_state(st, state);
> 

