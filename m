From: walter harms <wharms@bfs.de>
Date: Fri, 08 May 2015 11:13:22 +0000
Subject: Re: [patch v2] virtio_console: silence a static checker warning
Message-Id: <554C9A52.4030707@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150508091624.GS14154@mwanda>
In-Reply-To: <20150508091624.GS14154@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



Am 08.05.2015 11:56, schrieb Amit Shah:
> On (Fri) 08 May 2015 [11:30:09], walter harms wrote:
>>
>>
>> Am 08.05.2015 11:16, schrieb Dan Carpenter:
>>> My static checker complains that this sprintf() can overflow but really
>>> it can't.  Just silence the warning by using snprintf().
>>>
>>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>>> ---
>>> v2: the overflow is not possible so just leave the buffer size alone and
>>>     silence the warning with snprintf().
>>>
>>> diff --git a/drivers/char/virtio_console.c b/drivers/char/virtio_console.c
>>> index 50754d20..8283989 100644
>>> --- a/drivers/char/virtio_console.c
>>> +++ b/drivers/char/virtio_console.c
>>> @@ -1492,8 +1492,8 @@ static int add_port(struct ports_device *portdev, u32 id)
>>>  		 * Finally, create the debugfs file that we can use to
>>>  		 * inspect a port's state at any time
>>>  		 */
>>> -		sprintf(debugfs_name, "vport%up%u",
>>> -			port->portdev->vdev->index, id);
>>> +		snprintf(debugfs_name, sizeof(debugfs_name), "vport%up%u",
>>> +			 port->portdev->vdev->index, id);
>>
>>
>> would it help to use %03u (or so) to make it more obvious ?
>>
>> Note: i prefer a leading 0 in my programms to make it more easy
>> to work with grep and friends. you may thing otherwise.
> 
> Well we've been exposing names like /dev/vport0p0, /dev/vport2p15,
> etc., and there might be scripts relying on such names, so that's one
> argument against it.
> 
> However we do have pretty names that map to these ports via udev
> rules, but not sure if we should change the name just to prepend 0s.
> 
> 		Amit
> 
The basic idea was to limit the space, having leading zeros is my idea because
i found this more convenient in the past. Using something like "%3u" will give
static checkers a chance to detect the required max. space.

re,
 wh

