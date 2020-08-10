From: Colin Ian King <colin.king@canonical.com>
Date: Mon, 10 Aug 2020 17:26:16 +0000
Subject: Re: [PATCH] USB: storage: isd200: fix spelling mistake "removeable" -> "removable"
Message-Id: <783b3e8a-40b1-379d-ae22-9b1fd9c50684@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200810083211.48282-1-colin.king@canonical.com>
 <20200810142547.GC299045@rowland.harvard.edu>
 <ca88752c86bf8a42f9aa56b69df585542ea26622.camel@perches.com>
In-Reply-To: <ca88752c86bf8a42f9aa56b69df585542ea26622.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>, Alan Stern <stern@rowland.harvard.edu>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 10/08/2020 18:14, Joe Perches wrote:
> On Mon, 2020-08-10 at 10:25 -0400, Alan Stern wrote:
>> On Mon, Aug 10, 2020 at 09:32:11AM +0100, Colin King wrote:
>>> From: Colin Ian King <colin.king@canonical.com>
>>>
>>> There is a spelling mistake in a usb_stor_dbg debug message. Fix it.
> 
> This is an alternate spelling in a few dictionaries.
> Is this an acceptable Briticism?
> If so, I suggest no change.

I was keeping it consistent with all the other occurrences of this word
in kernel messages.

> 
>>> diff --git a/drivers/usb/storage/isd200.c b/drivers/usb/storage/isd200.c
> []
>>> @@ -1383,7 +1383,7 @@ static int isd200_scsi_to_ata(struct scsi_cmnd *srb, struct us_data *us,
>>>  				ATA_CMD_MEDIA_LOCK : ATA_CMD_MEDIA_UNLOCK;
>>>  			isd200_srb_set_bufflen(srb, 0);
>>>  		} else {
>>> -			usb_stor_dbg(us, "   Not removeable media, just report okay\n");
>>> +			usb_stor_dbg(us, "   Not removable media, just report okay\n");
>>>  			srb->result = SAM_STAT_GOOD;
>>>  			sendToTransport = 0;
>>>  		}
>>> -- 
>>
>> Acked-by: Alan Stern <stern@rowland.harvard.edu>
> 
