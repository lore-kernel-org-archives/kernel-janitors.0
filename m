From: Sun Ke <sunke32@huawei.com>
Date: Tue, 02 Feb 2021 01:36:54 +0000
Subject: Re: [PATCH v2] nbd: Fix NULL pointer in flush_workqueue
Message-Id: <68668f92-b605-3abf-9e9a-cddf6444f478@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210201081918.558905-1-sunke32@huawei.com>
 <ebe7beb2-336d-35d4-48af-8f8cad7b868b@web.de>
In-Reply-To: <ebe7beb2-336d-35d4-48af-8f8cad7b868b@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>, Josef Bacik <josef@toxicpanda.com>, Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org, nbd@other.debian.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

hi，Markus

在 2021/2/2 3:05, Markus Elfring 写道:
> …
>> +++ b/drivers/block/nbd.c
>> @@ -2011,12 +2011,14 @@ static int nbd_genl_disconnect(struct sk_buff *skb, struct genl_info *info)
>>   		       index);
>>   		return -EINVAL;
>>   	}
>> +	mutex_lock(&nbd->config_lock);
>>   	if (!refcount_inc_not_zero(&nbd->refs)) {
>> -		mutex_unlock(&nbd_index_mutex);
>> -		printk(KERN_ERR "nbd: device at index %d is going down\n",
>> -		       index);
>> -		return -EINVAL;
>> +		goto unlock;
>>   	}
>> +	if (!nbd->recv_workq) {
>> +		goto unlock;
>> +	}
> How do you think about to use the following patch variant
> (so that unwanted curly brackets would be avoided for proposed single statements
> in two if branches)?
>
> +	mutex_lock(&nbd->config_lock);
> -	if (!refcount_inc_not_zero(&nbd->refs)) {
> +	if (!refcount_inc_not_zero(&nbd->refs) || !nbd->recv_workq) {
> +		mutex_unlock(&nbd->config_lock);
>   		mutex_unlock(&nbd_index_mutex);
>   		printk(KERN_ERR "nbd: device at index %d is going down\n",tter
>   		       index);
>   		return -EINVAL;
>   	}
It looks better,  thanks for your suggestion.
>
> By the way:
> Would you like to replace the following two statements by the statement
> “goto put_nbd;” in another update step for this function implementation?
>
> 		nbd_put(nbd);
> 		return 0;
Sure, I will do it.
>
> Regards,
> Markus

Thanks,

Sun Ke

> .
