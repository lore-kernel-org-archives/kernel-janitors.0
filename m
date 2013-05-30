From: Harsh Kumar <harsh1kumar@gmail.com>
Date: Thu, 30 May 2013 07:55:38 +0000
Subject: Re: [Patch] Staging: winbond: usb_free_urb(NULL) is safe
Message-Id: <51A705F0.1070300@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <51A6D6F6.1050204@gmail.com>
In-Reply-To: <51A6D6F6.1050204@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



On Thursday 30 May 2013 01:13 PM, Julia Lawall wrote:
> 
> 
> On Thu, 30 May 2013, Harsh Kumar wrote:
> 
>>
>>
>> On Thursday 30 May 2013 12:58 PM, Julia Lawall wrote:
>>>
>>>
>>> On Thu, 30 May 2013, Harsh Kumar wrote:
>>>
>>>>
>>>>
>>>> On Thursday 30 May 2013 10:41 AM, Julia Lawall wrote:
>>>>>> diff -uprN a/drivers/staging/winbond/wb35reg.c b/drivers/staging/winbond/wb35reg.c
>>>>>> --- a/drivers/staging/winbond/wb35reg.c	2013-05-28 00:52:26.000000000 +0530
>>>>>> +++ b/drivers/staging/winbond/wb35reg.c	2013-05-28
>>> 02:11:35.000000000 +0530
>>>>>> @@ -64,12 +64,11 @@ unsigned char Wb35Reg_BurstWrite(struct
>>>>>>
>>>>>>  		return true;
>>>>>>  	} else {
>>>>>> -		if (urb)
>>>>>> -			usb_free_urb(urb);
>>>>>> +		usb_free_urb(urb);
>>>>>
>>>>> I took a look at this case.  Wouldn't it be nicer to check for failures
>>>>> one by one, as done almost everywhere else in the kernel?  Then you would
>>>>> know what had been successfully allocated and what has to be freed.
>>>>>
>>>>> julia
>>>>>
>>>>>
>>>>>
>>>>
>>>> Do you want that values of urb and reg_queue to be checked separately to see which has
>>>> failed? That will be more logical. But, then what should be done with the knowledge of
>>>> what has failed? Should there be a print or should the return value change?
>>>
>>> I don't know much about the driver, so a safe thing to do would be just to
>>> keep the current semantics.  When the kzalloc fails, just return false.
>>> When the usb_alloc_urb fails, just kfree and then return false.
>>>
>>> Also, currently there is a return false at the end of the function that is
>>> dead code.  Perhaps things could be reorganized so that that is not
>>> necessary.  Usually, after an allocation, the if just takes care of the
>>> error case, and the fallthrough case continues in the normal way.
>>>
>>
>> Okay, got it. I will reorganize the stuff here.
> 
> I think that some of the other cases should be changed in the same way.
> It is just in the destroy function that the if was not needed.
> 
> julia

Yes, I understood that. I will change other cases as well. Thanks.

Harsh

