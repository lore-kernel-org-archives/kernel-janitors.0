From: Kees Cook <keescook@chromium.org>
Date: Tue, 08 Jan 2019 23:58:14 +0000
Subject: Re: [PATCH 2/2] um: vector: Use 'kmalloc_array' instead of 'kmalloc'
Message-Id: <CAGXu5jKogPgKdL9kZEEbaNYL44LQ8o7EupDiwN+DE42JtckkHg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181226075449.11071-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20181226075449.11071-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Jeff Dike <jdike@addtoit.com>, Richard Weinberger <richard@nod.at>, anton.ivanov@cambridgegreys.com, Mike Rapoport <rppt@linux.vnet.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, YueHaibing <yuehaibing@huawei.com>, linux-um@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Fri, Dec 28, 2018 at 1:57 AM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> Use 'kmalloc_array' instead of 'kmalloc' when appropriate.
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Kees Cook <keescook@chromium.org>

Richard, can you take these?

> ---
> I don't know why it has not already been replaced in 6da2ec56059c
> ("treewide: kmalloc() -> kmalloc_array()".

Hm, not sure. I'd guess it was from the ()s and some Coccinelle rule
missing handling that. I thought I caught them all. :P

> ---
>  arch/um/drivers/vector_kern.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/um/drivers/vector_kern.c b/arch/um/drivers/vector_kern.c
> index 5b917716289d..dee5246bda81 100644
> --- a/arch/um/drivers/vector_kern.c
> +++ b/arch/um/drivers/vector_kern.c
> @@ -507,12 +507,12 @@ static struct vector_queue *create_queue(
>                 return NULL;
>         result->max_depth = max_size;
>         result->dev = vp->dev;
> -       result->mmsg_vector = kmalloc(
> -               (sizeof(struct mmsghdr) * max_size), GFP_KERNEL);
> +       result->mmsg_vector = kmalloc_array(max_size, sizeof(struct mmsghdr),
> +                                           GFP_KERNEL);
>         if (result->mmsg_vector = NULL)
>                 goto out_mmsg_fail;
> -       result->skbuff_vector = kmalloc(
> -               (sizeof(void *) * max_size), GFP_KERNEL);
> +       result->skbuff_vector = kmalloc_array(max_size, sizeof(void *),
> +                                             GFP_KERNEL);
>         if (result->skbuff_vector = NULL)
>                 goto out_skb_fail;
>
> --
> 2.19.1
>


-- 
Kees Cook
