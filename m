From: Anton Ivanov <anton.ivanov@cambridgegreys.com>
Date: Wed, 02 Jan 2019 16:34:22 +0000
Subject: Re: [PATCH 2/2] um: vector: Use 'kmalloc_array' instead of 'kmalloc'
Message-Id: <49451efd-0984-ab88-eef9-4dfd8b8473a7@cambridgegreys.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181226075449.11071-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20181226075449.11071-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, jdike@addtoit.com, richard@nod.at, rppt@linux.vnet.ibm.com, akpm@linux-foundation.org, yuehaibing@huawei.com, keescook@chromium.org
Cc: linux-um@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org



On 12/26/18 7:54 AM, Christophe JAILLET wrote:
> Use 'kmalloc_array' instead of 'kmalloc' when appropriate.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> I don't know why it has not already been replaced in 6da2ec56059c
> ("treewide: kmalloc() -> kmalloc_array()".
> ---
>   arch/um/drivers/vector_kern.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/um/drivers/vector_kern.c b/arch/um/drivers/vector_kern.c
> index 5b917716289d..dee5246bda81 100644
> --- a/arch/um/drivers/vector_kern.c
> +++ b/arch/um/drivers/vector_kern.c
> @@ -507,12 +507,12 @@ static struct vector_queue *create_queue(
>   		return NULL;
>   	result->max_depth = max_size;
>   	result->dev = vp->dev;
> -	result->mmsg_vector = kmalloc(
> -		(sizeof(struct mmsghdr) * max_size), GFP_KERNEL);
> +	result->mmsg_vector = kmalloc_array(max_size, sizeof(struct mmsghdr),
> +					    GFP_KERNEL);
>   	if (result->mmsg_vector = NULL)
>   		goto out_mmsg_fail;
> -	result->skbuff_vector = kmalloc(
> -		(sizeof(void *) * max_size), GFP_KERNEL);
> +	result->skbuff_vector = kmalloc_array(max_size, sizeof(void *),
> +					      GFP_KERNEL);
>   	if (result->skbuff_vector = NULL)
>   		goto out_skb_fail;
>   
> 

Acked-by: Anton Ivanov <anton.ivanov at cambridgegreys.com>

-- 
Anton R. Ivanov

Cambridge Greys Limited, England and Wales company No 10273661
http://www.cambridgegreys.com/
