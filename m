From: Daniel Lezcano <daniel.lezcano@linaro.org>
Date: Fri, 23 Jun 2017 10:51:19 +0000
Subject: Re: [bug report] clocksource/drivers: Add timer-of common init routine
Message-Id: <c488db16-afb9-3a72-9afd-c952eca55c63@linaro.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170623104405.GA29841@elgon.mountain>
In-Reply-To: <20170623104405.GA29841@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On 23/06/2017 12:44, Dan Carpenter wrote:
> Hello Daniel Lezcano,
>=20
> The patch dc11bae78529: "clocksource/drivers: Add timer-of common
> init routine" from Jun 5, 2017, leads to the following static checker
> warning:
>=20
> 	drivers/clocksource/timer-of.c:160 timer_of_init()
> 	error: uninitialized symbol 'ret'.

Hi Dan,

the error has been fixed:

https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?h=3Dtim=
ers/core&id=B7dcc4eacc45263ac5d3a0bd78c64e9ff7c94c13

Thanks for reporting the issue.

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
