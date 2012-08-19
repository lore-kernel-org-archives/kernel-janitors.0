From: Rupesh Gujare <rgujare@ozmodevices.com>
Date: Sun, 19 Aug 2012 13:06:59 +0000
Subject: Re: [patch] staging: ozwpan: fix memcmp() test in oz_set_active_pd()
Message-Id: <5030E4F3.3050101@ozmodevices.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120818084759.GB30592@elgon.mountain>
In-Reply-To: <20120818084759.GB30592@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 19/08/12 13:37, Tomas Winkler wrote:
>> On 18/08/12 09:47, Dan Carpenter wrote:
>>> "addr" is a pointer so it's either 4 or 8 bytes, but actually we want
>>> to compare 6 bytes (ETH_ALEN).
>>>
>>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>>
>> Acked-by: Rupesh Gujare<rgujare@ozmodevices.com>
> why not to use 'if (is_zero_ether_addr())" from linux/etherdevice.h
>
Tom,

Thanks for pointing this out, that looks more efficient. Interested in 
submitting a patch ?

Dan,

What do you think ?


-- 
Regards,
Rupesh Gujare




