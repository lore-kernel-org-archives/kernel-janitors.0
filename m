From: Kumar Gaurav <kumargauravgupta3@gmail.com>
Date: Fri, 09 Aug 2013 03:31:15 +0000
Subject: Re: [PATCH]arch:avr32:kernel:time.c: Removed IRQF_DISABLED
Message-Id: <52045FB3.9060001@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1376018243-8565-1-git-send-email-kumargauravgupta3@gmail.com>
In-Reply-To: <1376018243-8565-1-git-send-email-kumargauravgupta3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kumar Gaurav <kumargauravgupta3@gmail.com>
Cc: hskinnemoen@gmail.com, egtvedt@samfundet.no, tglx@linutronix.de, srivatsa.bhat@linux.vnet.ibm.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Please ignore the below patch. I'll be resending this with 0 instead of 
IRQF_TRIGGER_NONE
On Friday 09 August 2013 08:47 AM, Kumar Gaurav wrote:
> Removed IRQF_DISABLED as it's no-op and should be removed
>
> Signed-off-by: Kumar Gaurav <kumargauravgupta3@gmail.com>
> ---
>   arch/avr32/kernel/time.c |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/avr32/kernel/time.c b/arch/avr32/kernel/time.c
> index 869a1c6..0566c81 100644
> --- a/arch/avr32/kernel/time.c
> +++ b/arch/avr32/kernel/time.c
> @@ -59,7 +59,7 @@ static irqreturn_t timer_interrupt(int irq, void *dev_id)
>   static struct irqaction timer_irqaction = {
>   	.handler	= timer_interrupt,
>   	/* Oprofile uses the same irq as the timer, so allow it to be shared */
> -	.flags		= IRQF_TIMER | IRQF_DISABLED | IRQF_SHARED,
> +	.flags		= IRQF_TIMER | IRQF_TRIGGER_NONE | IRQF_SHARED,
>   	.name		= "avr32_comparator",
>   };
>   

