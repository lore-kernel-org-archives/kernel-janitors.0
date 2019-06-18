From: Lee Jones <lee.jones@linaro.org>
Date: Tue, 18 Jun 2019 08:16:45 +0000
Subject: Re: [PATCH] mfd: stmfx: Fix an endian bug in stmfx_irq_handler()
Message-Id: <20190618081645.GM16364@dell>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAHk-=wgTL5sYCGxX8+xQqyBRWRUE05GAdL58+UTG8bYwjFxMkw@mail.gmail.com>
 <20190617190605.GA21332@mwanda>
In-Reply-To: <20190617190605.GA21332@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Amelie Delaunay <amelie.delaunay@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, kernel-janitors@vger.kernel.org, Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org

On Mon, 17 Jun 2019, Dan Carpenter wrote:

> It's not okay to cast a "u32 *" to "unsigned long *" when you are
> doing a for_each_set_bit() loop because that will break on big
> endian systems.
> 
> Reported-by: Linus Torvalds <torvalds@linux-foundation.org>

Ideally we can get a review too.

> Fixes: 386145601b82 ("mfd: stmfx: Uninitialized variable in stmfx_irq_handler()")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/mfd/stmfx.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mfd/stmfx.c b/drivers/mfd/stmfx.c
> index 7c419c078688..857991cb3cbb 100644
> --- a/drivers/mfd/stmfx.c
> +++ b/drivers/mfd/stmfx.c
> @@ -204,6 +204,7 @@ static struct irq_chip stmfx_irq_chip = {
>  static irqreturn_t stmfx_irq_handler(int irq, void *data)
>  {
>  	struct stmfx *stmfx = data;
> +	unsigned long bits;
>  	u32 pending, ack;
>  	int n, ret;
>  
> @@ -222,7 +223,8 @@ static irqreturn_t stmfx_irq_handler(int irq, void *data)
>  			return IRQ_NONE;
>  	}
>  
> -	for_each_set_bit(n, (unsigned long *)&pending, STMFX_REG_IRQ_SRC_MAX)
> +	bits = pending;
> +	for_each_set_bit(n, &bits, STMFX_REG_IRQ_SRC_MAX)
>  		handle_nested_irq(irq_find_mapping(stmfx->irq_domain, n));
>  
>  	return IRQ_HANDLED;

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
