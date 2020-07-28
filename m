From: Daniel Lezcano <daniel.lezcano@linaro.org>
Date: Tue, 28 Jul 2020 08:43:20 +0000
Subject: Re: [PATCH] MAINTAINERS: update entry to thermal governors file name prefixing
Message-Id: <d50f49c2-4d88-74f7-29e9-963b806c602e@linaro.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200728045850.22661-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20200728045850.22661-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Amit Kucheria <amit.kucheria@linaro.org>, linux-arm-msm@vger.kernel.org
Cc: Lukasz Luba <lukasz.luba@arm.com>, linux-pm@vger.kernel.org, Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Pia Eichinger <pia.eichinger@st.oth-regensburg.de>, Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 28/07/2020 06:58, Lukas Bulwahn wrote:
> Commit 0015d9a2a727 ("thermal/governors: Prefix all source files with
> gov_") renamed power_allocator.c to gov_power_allocator.c in
> ./drivers/thermal amongst some other file renames, but missed to adjust
> the MAINTAINERS entry.
>=20
> Hence, ./scripts/get_maintainer.pl --self-test=3Dpatterns complains:
>=20
>   warning: no file matches    F:    drivers/thermal/power_allocator.c
>=20
> Update the file entry in MAINTAINERS to the new file name.
>=20
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---


Applied, thanks


--=20
<http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for ARM =
SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
