From: Daniel Lezcano <daniel.lezcano@linaro.org>
Date: Fri, 16 Feb 2018 08:03:57 +0000
Subject: Re: [PATCH] ARM: cpuidle: Delete an error message for a failed memory allocation in arm_idle_init_cp
Message-Id: <582de86a-d0bd-3f2d-0cbd-cf0a7ca924d8@linaro.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <7f419639-edfc-adb8-1dd2-d16b0dbfe19d@users.sourceforge.net>
In-Reply-To: <7f419639-edfc-adb8-1dd2-d16b0dbfe19d@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: SF Markus Elfring <elfring@users.sourceforge.net>, linux-pm@vger.kernel.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On 15/02/2018 16:46, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 15 Feb 2018 16:40:38 +0100
>=20
> Omit an extra message for a memory allocation failure in this function.
>=20
> This issue was detected by using the Coccinelle software.
>=20
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---

Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>
--=20
 <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for ARM=
 SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
