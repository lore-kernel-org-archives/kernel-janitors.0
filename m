From: Jens Axboe <axboe@kernel.dk>
Date: Fri, 18 Sep 2020 17:17:46 +0000
Subject: Re: [PATCH] scsi: arcmsr: Remove the superfluous break
Message-Id: <2ce1124d-7f83-d9aa-f62a-519c8914ad98@kernel.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200918093230.49050-1-jingxiangfeng@huawei.com>
 <20200918145619.GA25599@embeddedor>
 <e9320543ab6e7c8bd5ceae8cfa9d0912a0e962e0.camel@perches.com>
In-Reply-To: <e9320543ab6e7c8bd5ceae8cfa9d0912a0e962e0.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, Jing Xiangfeng <jingxiangfeng@huawei.com>
Cc: jejb@linux.ibm.com, martin.petersen@oracle.com, lee.jones@linaro.org, colin.king@canonical.com, mchehab+huawei@kernel.org, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors <kernel-janitors@vger.kernel.org>

On 9/18/20 11:13 AM, Joe Perches wrote:
> On Fri, 2020-09-18 at 09:56 -0500, Gustavo A. R. Silva wrote:
>> On Fri, Sep 18, 2020 at 05:32:30PM +0800, Jing Xiangfeng wrote:
>>> Remove the superfluous break, as there is a 'return' before it.
>>>
>>
>> Apparently, the change is correct. Please, just add a proper Fixes tag by
>> yourself this time.
> 
> There's no need for a "Fixes:" here, it's purely cosmetic.
> 
> btw:
> 
> There are at least 150 instances of
> 	return foo(...);
> 	break;
> still in the kernel tree:

A lot of these are false positives, since they follow a pattern of:

if (some_condition)
	return func();
break;

-- 
Jens Axboe
