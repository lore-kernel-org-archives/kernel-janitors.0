From: Eduardo Valentin <eduardo.valentin@ti.com>
Date: Wed, 12 Dec 2012 06:51:55 +0000
Subject: Re: [PATCH 1/5] staging: omap-thermal: fix error check in omap_thermal_expose_sensor() and in omap_t
Message-Id: <50C8298B.50503@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1355271894-5284-1-git-send-email-tipecaml@gmail.com> <1355271894-5284-2-git-send-email-tipecaml@gmail.com>
In-Reply-To: <1355271894-5284-2-git-send-email-tipecaml@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Cyril Roelandt <tipecaml@gmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, gregkh@linuxfoundation.org, rui.zhang@intel.com, durgadoss.r@intel.com, rjw@sisk.pl, devel@driverdev.osuosl.org

On 12-12-2012 02:24, Cyril Roelandt wrote:
>
> The omap_bandgap_get_sensor_data() function returns ERR_PTR(), so we need to use
> IS_ERR() rather than a NULL check.
>
> Signed-off-by: Cyril Roelandt <tipecaml@gmail.com>

Acked-by: Eduardo Valentin <eduardo.valentin@ti.com>

> ---
>   drivers/staging/omap-thermal/omap-thermal-common.c |    4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/staging/omap-thermal/omap-thermal-common.c b/drivers/staging/omap-thermal/omap-thermal-common.c
> index 61f1070..79a55aa 100644
> --- a/drivers/staging/omap-thermal/omap-thermal-common.c
> +++ b/drivers/staging/omap-thermal/omap-thermal-common.c
> @@ -260,7 +260,7 @@ int omap_thermal_expose_sensor(struct omap_bandgap *bg_ptr, int id,
>
>   	data = omap_bandgap_get_sensor_data(bg_ptr, id);
>
> -	if (!data)
> +	if (IS_ERR(data))
>   		data = omap_thermal_build_data(bg_ptr, id);
>
>   	if (!data)
> @@ -309,7 +309,7 @@ int omap_thermal_register_cpu_cooling(struct omap_bandgap *bg_ptr, int id)
>   	struct omap_thermal_data *data;
>
>   	data = omap_bandgap_get_sensor_data(bg_ptr, id);
> -	if (!data)
> +	if (IS_ERR(data))
>   		data = omap_thermal_build_data(bg_ptr, id);
>
>   	if (!data)
>

