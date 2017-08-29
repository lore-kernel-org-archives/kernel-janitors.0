From: Daniel Lezcano <daniel.lezcano@linaro.org>
Date: Tue, 29 Aug 2017 09:14:11 +0000
Subject: Re: [PATCH] clocksource: Delete an error message for a failed memory allocation in bcm2835_timer_ini
Message-Id: <a292aac5-b98e-6f84-8ef4-e9a00c582ba8@linaro.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1907fa5f-e1c3-a2dd-99e0-f06150086351@users.sourceforge.net>
In-Reply-To: <1907fa5f-e1c3-a2dd-99e0-f06150086351@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: linux-arm-kernel@lists.infradead.org

On 27/08/2017 21:46, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 27 Aug 2017 21:38:13 +0200
>=20
> Omit an extra message for a memory allocation failure in this function.
>=20
> This issue was detected by using the Coccinelle software.
>=20
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---

I have applied it.

Thanks.

  -- Daniel


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
