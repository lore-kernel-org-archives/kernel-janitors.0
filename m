From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 12 May 2015 07:43:42 +0000
Subject: Re: [PATCH 2/2] gpio: x-gene: Remove a useless memset
Message-Id: <CACRpkdbmn0O4cDByE6pWjwcfs3hW7-jtori83L5oeTumpZYGVQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1430483346-10583-1-git-send-email-christophe.jaillet@wanadoo.fr>
In-Reply-To: <1430483346-10583-1-git-send-email-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe Jaillet <christophe.jaillet@wanadoo.fr>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Fri, May 1, 2015 at 2:29 PM, Christophe Jaillet
<christophe.jaillet@wanadoo.fr> wrote:

> priv->irq is allocated using devm_kzalloc so there is no need to memset it.
>
> Signed-off-by: Christophe Jaillet <christophe.jaillet@wanadoo.fr>

Patch applied.

Yours,
Linus Walleij
