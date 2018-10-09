From: YueHaibing <yuehaibing@huawei.com>
Date: Tue, 09 Oct 2018 01:24:34 +0000
Subject: Re: [PATCH net-next] mt76x0: pci: fix set external PA I/O current
Message-Id: <e77eab30-6989-afcc-c257-c7201faf5732@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1539004909-195005-1-git-send-email-yuehaibing@huawei.com>
 <20181008.110230.1232459474222849074.davem@davemloft.net>
In-Reply-To: <20181008.110230.1232459474222849074.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Miller <davem@davemloft.net>
Cc: kvalo@codeaurora.org, nbd@nbd.name, lorenzo.bianconi@redhat.com, sgruszka@redhat.com, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org


On 2018/10/9 2:02, David Miller wrote:
> From: YueHaibing <yuehaibing@huawei.com>
> Date: Mon, 8 Oct 2018 13:21:49 +0000
> 
>> Fixes gcc '-Wunused-but-set-variable' warning:
>>
>> drivers/net/wireless/mediatek/mt76/mt76x0/pci.c: In function 'mt76x0e_register_device':
>> drivers/net/wireless/mediatek/mt76/mt76x0/pci.c:107:8: warning:
>>  variable 'data' set but not used [-Wunused-but-set-variable]
>>
>> It seems correct value to write is 'data'
>>
>> Fixes: 2b2cb40bcd7d ("mt76x0: pci: add hw initialization at bootstrap")
>> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> 
> Wireless changes should be marked as appropriate in the Subject line
> for targetting the wireless GIT tree, not "net-next".

Ok, will fix it in v2.

> 
> .
> 
