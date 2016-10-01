From: James Hogan <james.hogan@imgtec.com>
Date: Sat, 01 Oct 2016 20:33:51 +0000
Subject: Re: [PATCH 14/15] irqchip/metag-ext: improve function-level documentation
Message-Id: <CAAG0J9-+nvBi0ZmEPMgGF-Bqj4Drq4j8rFyGK7Fq1Ji7LF5z2A@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1475351192-27079-1-git-send-email-Julia.Lawall@lip6.fr> <1475351192-27079-15-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1475351192-27079-15-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, metag <linux-metag@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

Hi Julia,

On 1 October 2016 at 20:46, Julia Lawall <Julia.Lawall@lip6.fr> wrote:
> Drop the variable irq which ceased to be a parameter in bd0b9ac4.

I think 12 nibbles of the hash is recommended now due to collisions,
as is quoting the subject line, e.g. commit bd0b9ac405e1 ("genirq:
Remove irq argument from irq flow handlers").

>
> Issue detected using Coccinelle (http://coccinelle.lip6.fr/)
>
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Acked-by: James Hogan <james.hogan@imgtec.com>

Thanks
James

>
> ---
>  drivers/irqchip/irq-metag-ext.c |    1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/irqchip/irq-metag-ext.c b/drivers/irqchip/irq-metag-ext.c
> index 8c38b3d..0cdd923 100644
> --- a/drivers/irqchip/irq-metag-ext.c
> +++ b/drivers/irqchip/irq-metag-ext.c
> @@ -436,7 +436,6 @@ static int meta_intc_irq_set_type(struct irq_data *data, unsigned int flow_type)
>
>  /**
>   * meta_intc_irq_demux() - external irq de-multiplexer
> - * @irq:       the virtual interrupt number
>   * @desc:      the interrupt description structure for this irq
>   *
>   * The cpu receives an interrupt on TR2 when a SoC interrupt has occurred. It is
>
