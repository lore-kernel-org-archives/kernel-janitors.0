From: Michael Veeck <michael.veeck@gmx.net>
Date: Sat, 07 Feb 2004 17:35:05 +0000
Subject: Re: [Kernel-janitors] [PATCH] drivers/net/acenic.c MIN/MAX removal
Message-Id: <402521C9.9050402@gmx.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <40250629.3030004@gmx.net>
In-Reply-To: <40250629.3030004@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



Jeff Garzik schrieb:
> Michael Veeck wrote:
> 
>> Hi!
>> Patch (against 2.6.3-rc1) removes unnecessary min/max macros and 
>> changes calls to use kernel.h macros instead.
>> Feedback always welcome
>> Michael
>>
>>
>> ------------------------------------------------------------------------
>>
>> --- linux-2.6.2.org/drivers/net/acenic.c    2004-02-07 
>> 15:25:57.000000000 +0100
>> +++ linux-2.6.2.new/drivers/net/acenic.c    2004-02-07 
>> 15:33:24.286033896 +0100
>> @@ -335,10 +335,6 @@
>>  #define ACE_PROBE_ARG                struct net_device *dev
>>  #endif
>>  
>> -#ifndef min_t
>> -#define min_t(type,a,b)    (((a)<(b))?(a):(b))
>> -#endif
> 
> 
> 
> Read the code you're patching :)
> 
> You're killing compat code the driver author added.
> 
>     Jeff
> 

Ah, that didnt came into my mind. But since #ifndef min_t doesnt seem to 
be in any of the "#if LINUX_VERSION_CODE >= " why not put it in the 
appropiate one?

Do you know when the min_t was introduced in include/linux/kernel.h ?

	Veeck

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
