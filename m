From: Jiri Kosina <jkosina@suse.cz>
Date: Mon, 16 Feb 2009 12:42:45 +0000
Subject: Re: [PATCH] h8300: Storage class should be before const qualifier
Message-Id: <alpine.LNX.1.10.0902161342180.18110@jikos.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090209203932.GA5992@xenon.distanz.ch>
In-Reply-To: <20090209203932.GA5992@xenon.distanz.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, 9 Feb 2009, Tobias Klauser wrote:

> The C99 specification states in section 6.11.5:
> 
> The placement of a storage-class specifier other than at the beginning
> of the declaration specifiers in a declaration is an obsolescent
> feature.
> 
> Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
> ---
>  arch/h8300/kernel/timer/tpu.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/h8300/kernel/timer/tpu.c b/arch/h8300/kernel/timer/tpu.c
> index df7f453..79ae1db 100644
> --- a/arch/h8300/kernel/timer/tpu.c
> +++ b/arch/h8300/kernel/timer/tpu.c
> @@ -68,7 +68,7 @@ static struct irqaction tpu_irq = {
>  	.mask		= CPU_MASK_NONE,
>  };
>  
> -const static int __initdata divide_rate[] = {
> +static const int __initdata divide_rate[] = {
>  #if CONFIG_H8300_TPU_CH = 0
>  	1,4,16,64,0,0,0,0,
>  #elif (CONFIG_H8300_TPU_CH = 1) || (CONFIG_H8300_TPU_CH = 5)

This doesn't seem to be picked by anyone for current -next/-mmotm, I have 
applied it to trivial tree. Thanks,

-- 
Jiri Kosina
SUSE Labs
