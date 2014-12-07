From: Jeremiah Mahler <jmmahler@gmail.com>
Date: Sun, 07 Dec 2014 20:54:37 +0000
Subject: Re: [PATCH 19/20] TTY: fix misspelling of current function in string
Message-Id: <20141207205437.GD5360@hudson.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1417980062-25151-1-git-send-email-Julia.Lawall@lip6.fr>
 <1417980062-25151-20-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1417980062-25151-20-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Julia,

On Sun, Dec 07, 2014 at 08:21:01PM +0100, Julia Lawall wrote:
> Replace a misspelled function name by %s and then __func__.
> 
> This was done using Coccinelle, including the use of Levenshtein distance,
> as proposed by Rasmus Villemoes.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> ---
> The semantic patch is difficult to summarize, but is available in the cover
[...]
> @@ -1458,7 +1458,7 @@ static void rp_wait_until_sent(struct tty_struct *tty, int timeout)
>  
>  	orig_jiffies = jiffies;
>  #ifdef ROCKET_DEBUG_WAIT_UNTIL_SENT
> -	printk(KERN_INFO "In RP_wait_until_sent(%d) (jiff=%lu)...\n", timeout,
> +	printk(KERN_INFO "In %s(%d) (jiff=%lu)...\n", __func__, timeout,
>  	       jiffies);
>  	printk(KERN_INFO "cps=%d...\n", info->cps);
>  #endif
> 
More printk, pr_info, I'm sure you get the idea :-)

I would probably change the printk directly below it too, since it is
right there, but it is up to you.

> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
- Jeremiah Mahler
