From: "shenyang (M)" <shenyang39@huawei.com>
Date: Wed, 05 Aug 2020 01:58:00 +0000
Subject: Re: [PATCH v4 01/10] crypto: hisilicon/qm - fix wrong release after using strsep
Message-Id: <425f4bdd-cf55-6537-28bf-0377564b531b@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <96ffa633-dda1-7ad1-72da-5563906c1561@web.de>
In-Reply-To: <96ffa633-dda1-7ad1-72da-5563906c1561@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>, Sihang Chen <chensihang1@hisilicon.com>, linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Herbert Xu <herbert@gondor.apana.org.au>, Zaibo Xu <xuzaibo@huawei.com>, Zhou Wang <wangzhou1@hisilicon.com>



On 2020/8/5 2:34, Markus Elfring wrote:
> …
>> +++ b/drivers/crypto/hisilicon/qm.c
>> @@ -1420,16 +1420,17 @@ static int qm_dbg_help(struct hisi_qm *qm, char *s)
> …
>> +	s_tmp = s;
>>  	presult = strsep(&s, " ");
>>  	if (!presult) {
>> -		kfree(s);
>> +		kfree(s_tmp);
>>  		return -EINVAL;
>>  	}
>
> -		kfree(s);
> -		return -EINVAL;
> +		ret = -EINVAL;
> +		goto free_tmp;
>
> I suggest to add a jump target for the desired exception handling.
>
> Regards,
> Markus
>
> .
>

Thanks for your review. There is only one error branch need to do
something uninit. So I think the jump is not necessary and will
affect code reading.:)

Thanks,
Yang
