From: Zhou Wang <wangzhou1@hisilicon.com>
Date: Wed, 06 Nov 2019 00:50:03 +0000
Subject: Re: [PATCH -next] crypto: hisilicon: move label err to #ifdef CONFIG_NUMA
Message-Id: <5DC218BB.3080001@hisilicon.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191105143340.32950-1-maowenan@huawei.com>
 <20191105145602.GH10409@kadam>
In-Reply-To: <20191105145602.GH10409@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Mao Wenan <maowenan@huawei.com>
Cc: herbert@gondor.apana.org.au, davem@davemloft.net, tanshukun1@huawei.com, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 2019/11/5 22:56, Dan Carpenter wrote:
> The ifdefs in this function were pretty ugly before but this makes it
> super extra ugly...  :/  There are bunch of ways to fix this nicely
> but my favourite is this:
> 
> Feel free to give me a Suggested-by tag.
> 
> diff --git a/drivers/crypto/hisilicon/zip/zip_main.c b/drivers/crypto/hisilicon/zip/zip_main.c
> index 255b63cfbe1d..1b22f0ead56e 100644
> --- a/drivers/crypto/hisilicon/zip/zip_main.c
> +++ b/drivers/crypto/hisilicon/zip/zip_main.c
> @@ -105,20 +105,27 @@ static void free_list(struct list_head *head)
>  struct hisi_zip *find_zip_device(int node)
>  {
>  	struct hisi_zip *ret = NULL;
> -#ifdef CONFIG_NUMA
>  	struct hisi_zip_resource *res, *tmp;
>  	struct hisi_zip *hisi_zip;
>  	struct list_head *n;
>  	struct device *dev;
>  	LIST_HEAD(head);
>  
> +	if (!IS_ENABLED(CONFIG_NUMA)) {
> +		mutex_lock(&hisi_zip_list_lock);
> +		ret = list_first_entry(&hisi_zip_list, struct hisi_zip, list);
> +		mutex_unlock(&hisi_zip_list_lock);
> +		return ret;
> +	}
> +
>  	mutex_lock(&hisi_zip_list_lock);
>  
>  	list_for_each_entry(hisi_zip, &hisi_zip_list, list) {
>  		res = kzalloc(sizeof(*res), GFP_KERNEL);
> -		if (!res)
> -			goto err;
> -
> +		if (!res) {
> +			ret = NULL;
> +			goto done;
> +		}
>  		dev = &hisi_zip->qm.pdev->dev;
>  		res->hzip = hisi_zip;
>  		res->distance = node_distance(dev->numa_node, node);
> @@ -140,20 +147,10 @@ struct hisi_zip *find_zip_device(int node)
>  		}
>  	}
>  
> +done:
>  	free_list(&head);
> -#else
> -	mutex_lock(&hisi_zip_list_lock);
> -
> -	ret = list_first_entry(&hisi_zip_list, struct hisi_zip, list);
> -#endif
>  	mutex_unlock(&hisi_zip_list_lock);
> -
>  	return ret;
> -
> -err:
> -	free_list(&head);
> -	mutex_unlock(&hisi_zip_list_lock);
> -	return NULL;
>  }
>  
>  struct hisi_zip_hw_error {
> 
> 
> .
> 

Hi Mao and Dan,

I already posted a patch to fix this problem:
[PATCH] crypto: hisilicon - replace #ifdef with IS_ENABLED for CONFIG_NUMA

Many thanks for your help,
Zhou
