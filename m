From: Kalle Valo <kvalo@codeaurora.org>
Date: Wed, 16 Jan 2019 16:09:44 +0000
Subject: Re: [PATCH] mac80211-next: remove set but not used variable 'w_priv'
Message-Id: <87r2dc4m9j.fsf@codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1545274318-144187-1-git-send-email-yuehaibing@huawei.com>
        <65a8caf2-98c0-cf43-f63b-d89ed556111f@huawei.com>
In-Reply-To: <65a8caf2-98c0-cf43-f63b-d89ed556111f@huawei.com>
        (yuehaibing@huawei.com's message of "Wed, 16 Jan 2019 20:24:23 +0800")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

YueHaibing <yuehaibing@huawei.com> writes:

> ping...
>
> On 2018/12/20 10:51, YueHaibing wrote:
>> Fixes gcc '-Wunused-but-set-variable' warning:
>> 
>> drivers/net/wireless/virt_wifi.c: In function 'virt_wifi_net_device_stop':
>> drivers/net/wireless/virt_wifi.c:432:31: warning:
>>  variable 'w_priv' set but not used [-Wunused-but-set-variable]
>> 
>> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Same here, the prefix should be "virt_wifi:".

-- 
Kalle Valo
