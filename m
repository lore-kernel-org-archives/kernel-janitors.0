From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 01 Sep 2012 04:15:35 +0000
Subject: Re: [PATCH 3/13] drivers/gpio/gpio-pxa.c: use clk_prepare_enable and clk_disable_unprepare
Message-Id: <CACRpkdYgN5NhgPuKaJJNC2frL2rJ1jdo-DDPPYn1dn38wENpsg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1345996865-32082-1-git-send-email-Julia.Lawall@lip6.fr>
	<1345996865-32082-4-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1345996865-32082-4-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>, Eric Miao <eric.y.miao@gmail.com>, Haojian Zhuang <haojian.zhuang@gmail.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King <linux@arm.linux.org.uk>

On Sun, Aug 26, 2012 at 6:00 PM, Julia Lawall <Julia.Lawall@lip6.fr> wrote:

> From: Julia Lawall <Julia.Lawall@lip6.fr>
>
> Clk_prepare_enable and clk_disable_unprepare combine clk_prepare and
> clk_enable, and clk_disable and clk_unprepare.  They make the code more
> concise, and ensure that clk_unprepare is called when clk_enable fails.

Applied,
if your PXA people don't like it, shout.

Yours,
Linus Walleij
