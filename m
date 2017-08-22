From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 22 Aug 2017 12:43:49 +0000
Subject: Re: [PATCH 00/17] constify pinconf_ops, pinctrl_ops, and pinmux_ops structures
Message-Id: <CACRpkdZA_Nff+5Gk9wexoroX2=-tMzNJFVQbWmV8nhWooEwWbA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1502359589-15970-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1502359589-15970-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

On Thu, Aug 10, 2017 at 12:06 PM, Julia Lawall <Julia.Lawall@lip6.fr> wrote:

> These structures are only stored in fields of a pinctrl_desc
> structure that are const. Make the structures const as well.
>
> Done with the help of Coccinelle.

Thanks Julia, all patches applied with relevant ACKs collected.

Yours,
Linus Walleij
