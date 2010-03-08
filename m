From: Julia Lawall <julia@diku.dk>
Date: Mon, 08 Mar 2010 21:36:01 +0000
Subject: Re: [patch] arch/powerpc/platforms/pseries/ras.c - cleanup
Message-Id: <Pine.LNX.4.64.1003082235030.5727@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <hn3osd$4in$1@dough.gmane.org>
In-Reply-To: <hn3osd$4in$1@dough.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe Jaillet <christophe.jaillet@wanadoo.fr>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 8 Mar 2010, Christophe Jaillet wrote:

> From: Christophe Jaillet <christophe.jaillet@wanadoo.fr>
> 
> Hi, here is a patch against arch/powerpc/platforms/pseries/ras.c.
> 
> No need to memset (.., 0, ...) a buffer that is complety filled by a memcpy
> the line after.

I find 14 occurrences of this in linux-next.  Could it be useful for 
something?

julia


> 
> 
> Signed-off-by: Christophe Jaillet <christophe.jaillet@wanadoo.fr>
> 
> ---
> 
> diff --git a/arch/powerpc/platforms/pseries/ras.c
> b/arch/powerpc/platforms/pseries/ras.c
> index 2b548af..7a401ed 100644
> --- a/arch/powerpc/platforms/pseries/ras.c
> +++ b/arch/powerpc/platforms/pseries/ras.c
> @@ -276,7 +276,6 @@ static struct rtas_error_log *fwnmi_get_errinfo(struct
> pt_regs *regs)
>       (errdata >= rtas.base && errdata < rtas.base + rtas.size - 16)) {
>    savep = __va(errdata);
>    regs->gpr[3] = savep[0]; /* restore original r3 */
> -  memset(mce_data_buf, 0, RTAS_ERROR_LOG_MAX);
>    memcpy(mce_data_buf, (char *)(savep + 1), RTAS_ERROR_LOG_MAX);
>    errhdr = (struct rtas_error_log *)mce_data_buf;
>   } else {
> 
> 
> 
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
