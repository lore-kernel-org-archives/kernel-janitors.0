From: Daniel Lezcano <daniel.lezcano@linaro.org>
Date: Fri, 20 Dec 2019 08:29:08 +0000
Subject: Re: [PATCH] thermal/drivers/cpu_cooling: Fix an IS_ERR() vs NULL bug
Message-Id: <2b3e9f1d-8a78-8cfa-3452-1ef4b3b91a39@linaro.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191220053750.4wcxgieqmceyhwo5@kili.mountain>
In-Reply-To: <20191220053750.4wcxgieqmceyhwo5@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>, Amit Daniel Kachhap <amit.kachhap@gmail.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, Javi Merino <javi.merino@kernel.org>, Zhang Rui <rui.zhang@intel.com>, Amit Kucheria <amit.kucheria@verdurent.com>, linux-pm@vger.kernel.org, kernel-janitors@vger.kernel.org


Hi Dan,

On 20/12/2019 06:40, Dan Carpenter wrote:
> The idle_inject_register() function returns NULL on error, it never
> returns error pointers.
>=20
> Fixes: 1e044f70e5c2 ("thermal/drivers/cpu_cooling: Introduce the cpu idle=
 cooling driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks for the fix. It was fixed with the V5 version.



--=20
 <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for ARM=
 SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
