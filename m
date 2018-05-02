From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Date: Wed, 02 May 2018 08:59:33 +0000
Subject: Re: [PATCH] drm: omapdrm: silence unititialized variable warning
Message-Id: <5184a8fa-4acb-e6b5-099d-aca1793b1b71@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180418142937.GA13828@mwanda>
In-Reply-To: <20180418142937.GA13828@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org

Hi,

On 18/04/18 17:29, Dan Carpenter wrote:
> Smatch complains that "area_free" could be used without being
> initialized.  This code is several years old and premusably works fine
> so this can't be a very serious bug.  But it's easy enough to silence
> the warning.  If "area_free" is false at the end of the function then
> we return -ENOMEM.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/gpu/drm/omapdrm/tcm-sita.c b/drivers/gpu/drm/omapdrm/tcm-sita.c
> index d7f7bc9f061a..817be3c41863 100644
> --- a/drivers/gpu/drm/omapdrm/tcm-sita.c
> +++ b/drivers/gpu/drm/omapdrm/tcm-sita.c
> @@ -90,7 +90,7 @@ static int l2r_t2b(u16 w, u16 h, u16 a, s16 offset,
>  {
>  	int i;
>  	unsigned long index;
> -	bool area_free;
> +	bool area_free = false;
>  	unsigned long slots_per_band = PAGE_SIZE / slot_bytes;
>  	unsigned long bit_offset = (offset > 0) ? offset / slot_bytes : 0;
>  	unsigned long curr_bit = bit_offset;
> 

Thanks, I've queued this for 4.17 fixes.

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
