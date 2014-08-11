From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 11 Aug 2014 08:17:22 +0000
Subject: Re: [PATCH 10/14] gpio: delete unneeded test before of_node_put
Message-Id: <CACRpkdb8+o0BA_3v9acBX0xybbZSK9zBPFCnjUnpbj=QHjmUyA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1407492475-26283-10-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1407492475-26283-10-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>

On Fri, Aug 8, 2014 at 12:07 PM, Julia Lawall <Julia.Lawall@lip6.fr> wrote:

> From: Julia Lawall <Julia.Lawall@lip6.fr>
>
> Of_node_put supports NULL as its argument, so the initial test is not
> necessary.
>
> Suggested by Uwe Kleine-K=C3=B6nig.

Patch applied.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
