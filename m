From: Lars Persson <lars.persson@axis.com>
Date: Thu, 10 Aug 2017 12:31:14 +0000
Subject: Re: [PATCH 02/17] pinctrl: artpec6: constify pinconf_ops, pinctrl_ops, and pinmux_ops structures
Message-Id: <41b88970-c34a-efb0-e2ce-c26ac918390e@axis.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1502359589-15970-1-git-send-email-Julia.Lawall@lip6.fr>
 <1502359589-15970-3-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1502359589-15970-3-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>, Jesper Nilsson <jespern@axis.com>
Cc: bhumirks@gmail.com, kernel-janitors@vger.kernel.org, Lars Persson <larper@axis.com>, Niklas Cassel <niklass@axis.com>, Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@axis.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org



On 08/10/2017 12:06 PM, Julia Lawall wrote:
> This pinctrl_ops structure is only stored in the const pctlops
> field of a pinctrl_desc structure. Make the pinctrl_ops structure
> const as well.
> 
> Done with the help of Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> ---
>   drivers/pinctrl/pinctrl-artpec6.c |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>  

Hi,

Acked-by: Lars Persson <lars.persson@axis.com>

BR,
  Lars
