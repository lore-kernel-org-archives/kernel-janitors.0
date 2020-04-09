From: Daniel Lezcano <daniel.lezcano@linaro.org>
Date: Thu, 09 Apr 2020 09:43:09 +0000
Subject: Re: [PATCH] clocksource: davinci: avoid trailing '\n' hidden in pr_fmt()
Message-Id: <54def81a-5065-93d6-3397-5086f2d86994@linaro.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200409092543.14727-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200409092543.14727-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, tglx@linutronix.de
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 09/04/2020 11:25, Christophe JAILLET wrote:
> pr_xxx() functions usually have '\n' at the end of the logging message.
> Here, this '\n' is added via the 'pr_fmt' macro.
>=20
> In order to be more consistent with other files, use a more standard
> convention and put these '\n' back in the messages themselves and remove =
it
> from the pr_fmt macro.
>=20
> While at it, remove a useless message in case of 'kzalloc' failure,
> especially with a __GFP_NOFAIL flag.
>=20
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied, thanks

> ---
> Not sure that the __GFP_NOFAIL is relevant here.

No, it is not relevant.


--=20
<http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for ARM =
SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
