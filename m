From: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Date: Wed, 04 Apr 2018 11:58:59 +0000
Subject: Re: [PATCH -next] usb: dwc2: pci: Fix error return code in dwc2_pci_probe()
Message-Id: <410670D7E743164D87FA6160E7907A560113AE3A0C@am04wembxb.internal.synopsys.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1522244473-103213-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1522244473-103213-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Grigor Tovmasyan <Grigor.Tovmasyan@synopsys.com>, Wei Yongjun <weiyongjun1@huawei.com>, Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Vardan Mikayelyan <mvardan@synopsys.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On 3/30/2018 11:35 AM, Grigor Tovmasyan wrote:
> On 3/28/2018 5:36 PM, Wei Yongjun wrote:
>> Fix to return error code -ENOMEM from the alloc fail error handling
>> case instead of 0, as done elsewhere in this function.
>>
>> Fixes: ecd29dabb2ba ("usb: dwc2: pci: Handle error cleanup in probe")
>> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> 
> Reviewed-by: Grigor Tovmasyan <tovmasya@synopsys.com>

Acked-by: Minas Harutyunyan <hminas@synopsys.com>
> 
>> ---
>>    drivers/usb/dwc2/pci.c | 4 +++-
>>    1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/usb/dwc2/pci.c b/drivers/usb/dwc2/pci.c
>> index 7f21747..bea2e8e 100644
>> --- a/drivers/usb/dwc2/pci.c
>> +++ b/drivers/usb/dwc2/pci.c
>> @@ -141,8 +141,10 @@ static int dwc2_pci_probe(struct pci_dev *pci,
>>    		goto err;
>>    
>>    	glue = devm_kzalloc(dev, sizeof(*glue), GFP_KERNEL);
>> -	if (!glue)
>> +	if (!glue) {
>> +		ret = -ENOMEM;
>>    		goto err;
>> +	}
>>    
>>    	ret = platform_device_add(dwc2);
>>    	if (ret) {
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-usb" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  https://urldefense.proofpoint.com/v2/url?u=http-3A__vger.kernel.org_majordomo-2Dinfo.html&d=DwICAw&c=DPL6_X_6JkXFx7AXWqB0tg&r=K1ULVL1slpLXpMJJlAXSOxws4tRq0IkTBqxDkyW2hUQ&m=6vLEHiNG2gKkx9F-l1Yy77Kde75g7qA8Aw3fKXaQgCI&s=rFkdkzcIhy-tbIL8_skjqNXbFvj1Iolbh9CZ4-LNt4U&e>>
> 
> 

