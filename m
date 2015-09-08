From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 08 Sep 2015 08:55:00 +0000
Subject: Re: [PATCH 1/2] pinctrl: qcom: ssbi: convert null test to IS_ERR test
Message-Id: <CACRpkdb7ckOyvC=XVBvwPnxvXLEWoGA4vtj3va8dtJ1EDyaWHA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1440450747-10080-1-git-send-email-Julia.Lawall@lip6.fr>
	<1440450747-10080-2-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1440450747-10080-2-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Aug 24, 2015 at 11:12 PM, Julia Lawall <Julia.Lawall@lip6.fr> wrote:

> Since commit 323de9efdf3e ("pinctrl: make pinctrl_register() return proper
> error code"), pinctrl_register returns an error code rather than NULL on
> failure.  Update some drivers that were introduced more recently.
>
> The semantic patch that makes this change is as follows:
> (http://coccinelle.lip6.fr/)
>
> // <smpl>
> @@
> expression e,e1,e2;
> @@
>
> e = pinctrl_register(...)
> ... when != e = e1
> if (
> -   e = NULL
> +   IS_ERR(e)
>    ) {
>      ...
>      return
> -      e2
> +      PTR_ERR(e)
>      ;
>      }
> // </smpl>
>
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Patch applied for fixes.

Yours,
Linus Walleij
