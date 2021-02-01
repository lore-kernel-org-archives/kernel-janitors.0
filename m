From: Sun Ke <sunke32@huawei.com>
Date: Mon, 01 Feb 2021 06:43:00 +0000
Subject: Re: [PATCH] nbd: Fix NULL pointer in flush_workqueue
Message-Id: <28c83b00-7d0b-ee0d-640b-017c9f8410eb@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210128074153.1633374-1-sunke32@huawei.com>
 <1739e522-5980-f86e-cb90-19b61539a5cf@web.de>
In-Reply-To: <1739e522-5980-f86e-cb90-19b61539a5cf@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>, linux-block@vger.kernel.org, nbd@other.debian.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Jens Axboe <axboe@kernel.dk>, Josef Bacik <josef@toxicpanda.com>

hi，Markus

在 2021/1/29 3:42, Markus Elfring 写道:
> …
>> +++ b/drivers/block/nbd.c
>> @@ -2011,12 +2011,20 @@ static int nbd_genl_disconnect(struct sk_buff *skb, struct genl_info *info)
>>   		       index);
>>   		return -EINVAL;
>>   	}
>> +	mutex_lock(&nbd->config_lock);
>>   	if (!refcount_inc_not_zero(&nbd->refs)) {
>>   		mutex_unlock(&nbd_index_mutex);
>> +		mutex_unlock(&nbd->config_lock);
> Can an other function call order become relevant for the unlocking of these mutexes?
Do you think the nbd->config_lock  mutex here is useless?
>
>
>>   		printk(KERN_ERR "nbd: device at index %d is going down\n",
>>   		       index);
> May such an error message be moved into the lock scope?
Sure.
>
>
>>   		return -EINVAL;
>>   	}
>> +	if (!nbd->recv_workq) {
>> +		mutex_unlock(&nbd->config_lock);
>> +		mutex_unlock(&nbd_index_mutex);
>> +		return -EINVAL;
>> +	}
> How do you think about to connect the code from this if branch
> with a jump target like “unlock” so that such statements would be shareable
> for the desired exception handling?
OK, I will improve it in V2 patch.
>
>
>> +	mutex_unlock(&nbd->config_lock);
>>   	mutex_unlock(&nbd_index_mutex);
>>   	if (!refcount_inc_not_zero(&nbd->config_refs)) {
>>   		nbd_put(nbd);
>
> Regards,
> Markus
> .
