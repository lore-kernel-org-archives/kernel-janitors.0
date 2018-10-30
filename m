From: Daniel Lezcano <daniel.lezcano@linaro.org>
Date: Tue, 30 Oct 2018 16:20:43 +0000
Subject: Re: [PATCH 1/2] thermal: armada: constify thermal_zone_of_device_ops structure
Message-Id: <a7cdde4f-6d50-b01c-7dd3-5360b8d0e8cf@linaro.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1540912500-21941-1-git-send-email-Julia.Lawall@lip6.fr>
 <1540912500-21941-2-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1540912500-21941-2-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Julia Lawall <Julia.Lawall@lip6.fr>, Zhang Rui <rui.zhang@intel.com>
Cc: kernel-janitors@vger.kernel.org, Eduardo Valentin <edubezval@gmail.com>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org

On 30/10/2018 16:14, Julia Lawall wrote:
> The thermal_zone_of_device_ops structure can be const as it is only
> passed as the last argument of devm_thermal_zone_of_sensor_register
> and the corresponding parameter is declared as const.
>=20
> Done with the help of Coccinelle.
>=20
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
>=20
> ---
>  drivers/thermal/armada_thermal.c |    2 +-

Reviewed-by: Daniel Lezcano <daniel.lezcano@linaro.org>


--=20
 <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for ARM=
 SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
