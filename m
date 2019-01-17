From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 17 Jan 2019 02:41:47 +0000
Subject: Re: [PATCH] mac80211-next: remove duplicated include from virt_wifi.c
Message-Id: <282cdf9e-55c6-19a8-756a-8dd5843d887d@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1545274285-143886-1-git-send-email-yuehaibing@huawei.com>
 <cfdac00b-ea9a-1805-4668-64e44c523f6d@huawei.com>
 <87va2o4ma7.fsf@codeaurora.org>
In-Reply-To: <87va2o4ma7.fsf@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kalle Valo <kvalo@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org


On 2019/1/17 0:09, Kalle Valo wrote:
> YueHaibing <yuehaibing@huawei.com> writes:
> 
>> ping...
>>
>> On 2018/12/20 10:51, YueHaibing wrote:
>>> Remove duplicated include.
>>>
>>> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
>>> ---
>>>  drivers/net/wireless/virt_wifi.c | 5 -----
>>>  1 file changed, 5 deletions(-)
> 
> BTW, the prefix should be "virt_wifi:".

Thanks ,will fix it in v2
> 
