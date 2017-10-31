From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 31 Oct 2017 09:09:43 +0000
Subject: Re: [PATCH] gpio-adnp: Use common error handling code in adnp_gpio_dbg_show()
Message-Id: <CACRpkdaz3QLYmA4AkUUZ1Hr0un9a0bub1isJ24Nh_JkwR=W3Qg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1e2fb84c-9a5b-dc56-c93b-7eef03fc9b7a@users.sourceforge.net>
In-Reply-To: <1e2fb84c-9a5b-dc56-c93b-7eef03fc9b7a@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Thierry Reding <thierry.reding@avionic-design.de>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Sun, Oct 22, 2017 at 8:27 PM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 22 Oct 2017 20:21:55 +0200
>
> Add a jump target so that a bit of exception handling can be better reused
> at the end of this function.
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

That's a nice patch.
Patch applied.

Yours,
Linus Walleij
