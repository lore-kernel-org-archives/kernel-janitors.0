From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Mon, 23 Mar 2020 16:56:46 +0000
Subject: Re: [PATCH] usbip: vhci_hcd: slighly simplify code in 'vhci_urb_dequeue()'
Message-Id: <2fb983be-2a42-1b89-447a-a7415ffc7335@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200321152938.19580-1-christophe.jaillet@wanadoo.fr>
 <c8e319c8-cd65-2c2c-df5d-e75908ca63b7@kernel.org>
In-Reply-To: <c8e319c8-cd65-2c2c-df5d-e75908ca63b7@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: shuah <shuah@kernel.org>, valentina.manea.m@gmail.com, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Le 23/03/2020 à 17:48, shuah a écrit :
> On 3/21/20 9:29 AM, Christophe JAILLET wrote:
>> The allocation of 'unlink' can be moved before a spin_lock.
>> This slighly simplifies the error handling if the memory allocation 
>> fails,
>
> slightly (spelling nit)
>
>> aligns the code structure with what is done in 'vhci_tx_urb()' and 
>> reduces
>> potential lock contention.
>>
>
> Are you seeing any problems or is this a potential lock contention?
> If you are seeing issues, please share the problem seen.
>
No, the issue is just theoretical.


>
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>> ---
>>   drivers/usb/usbip/vhci_hcd.c | 5 ++---
>>   1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/usb/usbip/vhci_hcd.c b/drivers/usb/usbip/vhci_hcd.c
>> index 65850e9c7190..b909a634260c 100644
>> --- a/drivers/usb/usbip/vhci_hcd.c
>> +++ b/drivers/usb/usbip/vhci_hcd.c
>> @@ -905,17 +905,16 @@ static int vhci_urb_dequeue(struct usb_hcd 
>> *hcd, struct urb *urb, int status)
>>           /* tcp connection is alive */
>>           struct vhci_unlink *unlink;
>>   -        spin_lock(&vdev->priv_lock);
>> -
>
> This change might simplify the error path, however it could
> open a race window with the unlink activity during 
> vhci_shutdown_connection() when the connection is being taken
> down. It would be safer to hold both locks as soon as the
> connection check is done.

My proposal was just a small clean-up (from my point of view at least).
If it can have some side effects, please, just consider it as a NACK.

CJ

>
>>           /* setup CMD_UNLINK pdu */
>>           unlink = kzalloc(sizeof(struct vhci_unlink), GFP_ATOMIC);
>>           if (!unlink) {
>> -            spin_unlock(&vdev->priv_lock);
>>               spin_unlock_irqrestore(&vhci->lock, flags);
>>               usbip_event_add(&vdev->ud, VDEV_EVENT_ERROR_MALLOC);
>>               return -ENOMEM;
>>           }
>>   +        spin_lock(&vdev->priv_lock);
>> +
>>           unlink->seqnum = atomic_inc_return(&vhci_hcd->seqnum);
>>           if (unlink->seqnum = 0xffff)
>>               pr_info("seqnum max\n");
>>
>
> thanks,
> -- Shuah
>
