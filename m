From: "H Hartley Sweeten" <hartleys@visionengravers.com>
Date: Mon, 28 Dec 2009 16:24:19 +0000
Subject: RE: [PATCH 1/5] arch/arm: Correct NULL test
Message-Id: <BD79186B4FD85F4B8E60E381CAEE19090200F461@mi8nycmail19.Mi8.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0912272226360.20548@ask.diku.dk><20091227215106.GA18317@pengutronix.de>
	<Pine.LNX.4.64.0912272307310.20548@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0912272307310.20548@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

On Sunday, December 27, 2009 3:08 PM, Julia Lawall wrote:
>>>  	dbgfs_chan = kmalloc(sizeof(*dbgfs_state) * num_dma_channels,
>>>  			     GFP_KERNEL);
>>> -	if (!dbgfs_state)
>>> +	if (!dbgfs_chan)
>>>  		goto err_alloc;
>> Shouldn't the malloc line read:
>> 
>> 	... = kmalloc(sizeof(*dbgfs_chan) * ...)
>> 	                      ^^^^^^^^^^
>> 
>> ?
>
> Good point, thanks.  I will send a revised patch.

Wouldn't this be clearer?

	... = kmalloc(sizeof(struct dentry) * ...)

Regards,
Hartley
