From: Harsh Kumar <harsh1kumar@gmail.com>
Date: Thu, 30 May 2013 06:50:08 +0000
Subject: Re: [Patch] Staging: winbond: usb_free_urb(NULL) is safe
Message-Id: <51A6F3D0.4050803@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <51A6D6F6.1050204@gmail.com>
In-Reply-To: <51A6D6F6.1050204@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



On Thursday 30 May 2013 10:41 AM, Julia Lawall wrote:
>> diff -uprN a/drivers/staging/winbond/wb35reg.c b/drivers/staging/winbond/wb35reg.c
>> --- a/drivers/staging/winbond/wb35reg.c	2013-05-28 00:52:26.000000000 +0530
>> +++ b/drivers/staging/winbond/wb35reg.c	2013-05-28 02:11:35.000000000 +0530
>> @@ -64,12 +64,11 @@ unsigned char Wb35Reg_BurstWrite(struct
>>  
>>  		return true;
>>  	} else {
>> -		if (urb)
>> -			usb_free_urb(urb);
>> +		usb_free_urb(urb);
> 
> I took a look at this case.  Wouldn't it be nicer to check for failures 
> one by one, as done almost everywhere else in the kernel?  Then you would 
> know what had been successfully allocated and what has to be freed.
> 
> julia
> 
> 
> 

Do you want that values of urb and reg_queue to be checked separately to see which has 
failed? That will be more logical. But, then what should be done with the knowledge of 
what has failed? Should there be a print or should the return value change?

Actually, the return values of these functions like Wb35Reg_BurstWrite() have not 
been used where these functions are called. Maybe, we need to check whether write & 
read are successful or not. Maybe, that also needs to be changed.

