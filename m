From: Daniel Lezcano <daniel.lezcano@linaro.org>
Date: Tue, 21 Jul 2020 13:13:53 +0000
Subject: Re: [PATCH] thermal: ti-soc-thermal: Fix reversed condition in ti_thermal_expose_sensor()
Message-Id: <145478f0-3db1-4121-ad7c-78bc67a69c66@linaro.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200616091949.GA11940@mwanda>
In-Reply-To: <20200616091949.GA11940@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>, Eduardo Valentin <edubezval@gmail.com>, Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: Keerthy <j-keerthy@ti.com>, Zhang Rui <rui.zhang@intel.com>, Amit Kucheria <amit.kucheria@verdurent.com>, linux-pm@vger.kernel.org, linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 16/06/2020 11:19, Dan Carpenter wrote:
> This condition is reversed and will cause breakage.
>=20
> Fixes: 7440f518dad9 ("thermal/drivers/ti-soc-thermal: Avoid dereferencing=
 ERR_PTR")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
 Applied.


--=20
<http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for ARM =
SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
