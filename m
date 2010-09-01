From: Thomas Dahlmann <dahlmann.thomas@arcor.de>
Date: Wed, 01 Sep 2010 10:03:45 +0000
Subject: Re: [PATCH 2/7] drivers/usb/gadget/amd5536udc.c: Remove double test
Message-Id: <4C7E2501.4050004@arcor.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <634098.18332.qm@web180309.mail.gq1.yahoo.com>
In-Reply-To: <634098.18332.qm@web180309.mail.gq1.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Brownell <david-b@pacbell.net>
Cc: Dan Carpenter <error27@gmail.com>, Julia Lawall <julia@diku.dk>, kernel-janitors@vger.kernel.org, David Brownell <dbrownell@users.sourceforge.net>, Greg Kroah-Hartman <gregkh@suse.de>, linux-geode@lists.infradead.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org

David Brownell schrieb:
> --- On Sat, 8/28/10, Julia Lawall <julia@diku.dk> wrote:
>
>   
>> From: Julia Lawall <julia@diku.dk>
>> Subject: Re: [PATCH 2/7] drivers/usb/gadget/amd5536udc.c: Remove double test
>> To: "Dan Carpenter" <error27@gmail.com>
>> Cc: "Thomas Dahlmann" <dahlmann.thomas@arcor.de>, kernel-janitors@vger.kernel.org, "David Brownell" <dbrownell@users.sourceforge.net>, "Greg Kroah-Hartman" <gregkh@suse.de>, linux-geode@lists.infradead.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
>> Date: Saturday, August 28, 2010, 9:48 AM
>> The same expression is tested twice
>> and the result is the same each time.
>> Instead test for use_dma_ppb as in the test above.
>>
>> The sematic match that finds this problem is as follows:
>> (http://coccinelle.lip6.fr/)
>>
>> // <smpl>
>> @expression@
>> expression E;
>> @@
>>
>> (
>> * E
>>   || ... || E
>> |
>> * E
>>   && ... && E
>> )
>> // </smpl>
>>
>> Signed-off-by: Julia Lawall <julia@diku.dk>
>>     
>
>
> OK by me unless the maintainer/author objects.
>
> Thank you!
>
> - Dave
>
>   

This fix is OK. Thank you for figuring this out!

- Thomas

>
>   
>> ---
>>  drivers/usb/gadget/amd5536udc.c |    2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/usb/gadget/amd5536udc.c
>> b/drivers/usb/gadget/amd5536udc.c
>> index 731150d..6c40c99 100644
>> --- a/drivers/usb/gadget/amd5536udc.c
>> +++ b/drivers/usb/gadget/amd5536udc.c
>> @@ -203,7 +203,7 @@ static void print_regs(struct udc
>> *dev)
>>          DBG(dev, "DMA
>> mode       = PPBNDU (packet per
>> buffer "
>>             
>> "WITHOUT desc. update)\n");
>>         
>> dev_info(&dev->pdev->dev, "DMA mode (%s)\n",
>> "PPBNDU");
>> -    } else if (use_dma &&
>> use_dma_ppb_du && use_dma_ppb_du) {
>> +    } else if (use_dma &&
>> use_dma_ppb && use_dma_ppb_du) {
>>          DBG(dev, "DMA
>> mode       = PPBDU (packet per
>> buffer "
>>             
>> "WITH desc. update)\n");
>>         
>> dev_info(&dev->pdev->dev, "DMA mode (%s)\n",
>> "PPBDU");
>>
>>
>>     
>
>   

