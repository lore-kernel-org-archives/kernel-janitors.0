From: Qinglang Miao <miaoqinglang@huawei.com>
Date: Wed, 06 Jan 2021 06:06:48 +0000
Subject: Re: [PATCH v2] net: qrtr: fix null pointer dereference in qrtr_ns_remove
Message-Id: <fdea7394-3e4a-0afe-6b22-7e3a258f5607@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210105055754.16486-1-miaoqinglang@huawei.com>
 <4596fb37-5e74-5bf6-60e5-ded6fbb83969@web.de>
In-Reply-To: <4596fb37-5e74-5bf6-60e5-ded6fbb83969@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>, netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, hulkci@huawei.com, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>

Hi Markus,

I'd like to take some of your advice in this patch, but I noticed that 
this one has been applied.

Some of your advice would be considered kindly on my future work.

Thanks.

在 2021/1/5 21:14, Markus Elfring 写道:
>> A null-ptr-deref bug is reported by Hulk Robot like this:
> 
> Can it be clearer to use the term “null pointer dereference” for the final commit message?
This advice is too detailed for 'null-ptr-deref' is known as a general 
phrase like 'use-after-free' for kernel developer, I think.>
> 
>> --------------
> 
> I suggest to choose an other character for drawing such a text line.
It's an acceptable advice, thanks.
> 
> 
>> Fix it by making …
> 
> Would you like to replace this wording by the tag “Fixes”?
Sorry, I didn't get your words.

'Fix it by' follows the solution
'Fixes' follows the commit which brought the problem.

In fact, I do considered using 'Fixes' on this one, but it's hard to 
tell which specific commit brought this null pointer dereference.
> 
> Will an other imperative wording variant be helpful for this change description?
> 
> 
> …
>> +++ b/net/qrtr/qrtr.c
>> @@ -1287,13 +1287,19 @@ static int __init qrtr_proto_init(void)
> …
>> +err_sock:
>> +	sock_unregister(qrtr_family.family);
>> +err_proto:
>> +	proto_unregister(&qrtr_proto);
>>   	return rc;
>>   }
> 
> Would it be clearer to use the labels “unregister_sock” and “unregister_proto”?
In fact, The reason I use 'err_sock' rather than 'unregister_sock' is to 
keep same in 'net/qrtr/ns.c'.

I agree with you that “unregister_sock” is better in normal case.
> 
> Regards,
> Markus
> .
> 
