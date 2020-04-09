From: Daniel Lezcano <daniel.lezcano@linaro.org>
Date: Thu, 09 Apr 2020 14:48:01 +0000
Subject: Re: [PATCH] clocksource: davinci: axe a pointless __GFP_NOFAIL
Message-Id: <e1ea1f7b-d5f6-d6bf-52da-32f2d3de7793@linaro.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200409101226.15432-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200409101226.15432-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, tglx@linutronix.de
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 09/04/2020 12:12, Christophe JAILLET wrote:
> There is no need to specify __GFP_NOFAIL when allocating memory here, so
> axe it.
>=20
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---

Applied, thanks
--=20
<http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for ARM =
SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
