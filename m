From: Kalle Valo <kvalo@codeaurora.org>
Date: Wed, 16 Jan 2019 16:09:20 +0000
Subject: Re: [PATCH] mac80211-next: remove duplicated include from virt_wifi.c
Message-Id: <87va2o4ma7.fsf@codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1545274285-143886-1-git-send-email-yuehaibing@huawei.com>
        <cfdac00b-ea9a-1805-4668-64e44c523f6d@huawei.com>
In-Reply-To: <cfdac00b-ea9a-1805-4668-64e44c523f6d@huawei.com>
        (yuehaibing@huawei.com's message of "Wed, 16 Jan 2019 20:24:48 +0800")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

YueHaibing <yuehaibing@huawei.com> writes:

> ping...
>
> On 2018/12/20 10:51, YueHaibing wrote:
>> Remove duplicated include.
>> 
>> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
>> ---
>>  drivers/net/wireless/virt_wifi.c | 5 -----
>>  1 file changed, 5 deletions(-)

BTW, the prefix should be "virt_wifi:".

-- 
Kalle Valo
