From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 07 Jan 2020 10:45:07 +0000
Subject: Re: [PATCH 16/16] pinctrl: nuvoton: npcm7xx: constify copied structure
Message-Id: <CACRpkdZxQCfyWgWfFtnxo9wvV7z2d7jCLV5fBKW9wD2ZnQUp6A@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1577864614-5543-1-git-send-email-Julia.Lawall@inria.fr> <1577864614-5543-17-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1577864614-5543-17-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@inria.fr>
Cc: kernel-janitors@vger.kernel.org, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Jan 1, 2020 at 9:20 AM Julia Lawall <Julia.Lawall@inria.fr> wrote:

> The npcmgpio_irqchip structure is only copied into another
> structure, so make it const.
>
> The opportunity for this change was found using Coccinelle.
>
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

Patch applied.

Yours,
Linus Walleij
