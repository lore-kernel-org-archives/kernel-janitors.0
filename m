From: "Zhengbin (OSKernel)" <zhengbin13@huawei.com>
Date: Mon, 22 Jun 2020 03:25:52 +0000
Subject: Re: [PATCH v2] nbd: Fix memory leak in nbd_add_socket
Message-Id: <db17d022-a53a-3781-63d4-c38d5cf5b1e4@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <b55f8af2-b20c-214f-90f0-9b6efcb7273c@web.de>
In-Reply-To: <b55f8af2-b20c-214f-90f0-9b6efcb7273c@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>, linux-block@vger.kernel.org
Cc: nbd@other.debian.org, Navid Emamdoost <navid.emamdoost@gmail.com>, Navid Emamdoost <emamd001@umn.edu>, Kangjie Lu <kjlu@umn.edu>, Stephen McCamant <mccamant@cs.umn.edu>, Qiushi Wu <wu000273@umn.edu>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>, Josef Bacik <josef@toxicpanda.com>, Tuomas Tynkkynen <tuomas.tynkkynen@iki.fi>, Yi Zhang <yi.zhang@huawei.com>


On 2020/6/20 20:05, Markus Elfring wrote:
>> If we add first socket to nbd, config->socks is malloced but
>> num_connections does not update(nsock's allocation fail), the memory
>> is leaked. Cause in later nbd_config_put(), will only free config->socks
>> when num_connections is not 0.
>>
>> Let nsock's allocation first to avoid this.
> I suggest to improve this change description.
> Can an other wording variant be nicer?

em, how about this?


When adding first socket to nbd, if nsock's allocation fails, config->socks

is malloced but num_connections does not update, memory leak will 
occur(Function

nbd_config_put will only free config->socks when num_connections is not 0).

>
>
> …
>> +++ b/drivers/block/nbd.c
>> @@ -1037,21 +1037,22 @@  static int nbd_add_socket(struct nbd_device *nbd, unsigned long arg,
>>   		return -EBUSY;
>>   	}
>>
>> +	nsock = kzalloc(sizeof(struct nbd_sock), GFP_KERNEL);
> Please use the following code variant.
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/coding-style.rst?idC33a9b0b67bb4e8bcd91bdd80da80b0ec151162#n854
>
> +	nsock = kzalloc(sizeof(*nsock), GFP_KERNEL);
>
>
> …
>>   	if (!socks) {
>>   		sockfd_put(sock);
>> +		kfree(nsock);
>>   		return -ENOMEM;
>>   	}
> Please take another software design possibility into account.
>
>   	if (!socks) {
> -		sockfd_put(sock);
> -		return -ENOMEM;
> +		kfree(nsock);
> +		goto put_socket;
>   	}
>
>
> Regards,
> Markus
>
> .
>
