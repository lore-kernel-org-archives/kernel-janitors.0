From: YueHaibing <yuehaibing@huawei.com>
Date: Fri, 15 Feb 2019 12:18:17 +0000
Subject: Re: [PATCH -next] usb: host: oxu210hp-hcd: remove set but not used variables 'uframes, transfer_buff
Message-Id: <8432c416-b0ae-b533-d077-21e7ffd3b3b1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190215031709.86920-1-yuehaibing@huawei.com>
In-Reply-To: <20190215031709.86920-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Colin Ian King <colin.king@canonical.com>
Cc: linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org



On 2019/2/15 16:11, Sergei Shtylyov wrote:
> Hello!
> 
> On 15.02.2019 6:17, YueHaibing wrote:
> 
>> Fixes gcc '-Wunused-but-set-variable' warning:
>>
>> drivers/usb/host/oxu210hp-hcd.c: In function 'scan_periodic':
>> drivers/usb/host/oxu210hp-hcd.c:2256:13: warning:
>>   variable 'uframes' set but not used [-Wunused-but-set-variable]
>>
>> drivers/usb/host/oxu210hp-hcd.c: In function 'oxu_urb_enqueue':
>> drivers/usb/host/oxu210hp-hcd.c:2835:6: warning:
>>   variable 'transfer_buffer_length' set but not used [-Wunused-but-set-variable]
>>
>> It never used since introduction.
> 
>    "It's" or even better, "they are"?

Ok, will fix it, Thanks!

> 
>>
>> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> [...]
> 
> MBR, Sergei
> 
> 
