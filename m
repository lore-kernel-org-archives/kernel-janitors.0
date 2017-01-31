From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 31 Jan 2017 14:44:43 +0000
Subject: Re: [PATCH] gpiolib: Fix a WARN_ON that can never trigger
Message-Id: <CACRpkdY+ng2YvWpd_WxDVtKcN6H3nU8BZ0isUeCvhfKw+mjKpw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170127115642.19174-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20170127115642.19174-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Fri, Jan 27, 2017 at 12:56 PM, Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:

> "if (!x) WARN_ON(x)" can never trigger.
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Good catch.

Patch applied.

Yours,
Linus Walleij
