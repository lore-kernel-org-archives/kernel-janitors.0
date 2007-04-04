From: Richard Knutsson <ricknu-0@student.ltu.se>
Date: Wed, 04 Apr 2007 01:41:56 +0000
Subject: Re: [KJ] Any need for __cplusplus?
Message-Id: <46130264.5060909@student.ltu.se>
List-Id: <kernel-janitors.vger.kernel.org>
References: <461201B3.8000800@student.ltu.se>
In-Reply-To: <461201B3.8000800@student.ltu.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Robert P. J. Day wrote:
> On Wed, 4 Apr 2007, Richard Knutsson wrote:
>
>   
>> Yep, and just found a few C/C++ structs not even _used_ in the kernel...
>>     
>
> i'm not sure what that means ... can you explain that?  with an
> example or two?
>   
The ones I was talking about is in drivers/scsi/dpt/sys_info.h. Only 
found sysInfo_S to be used (by drivers/scsi/dpt_i2o.c).

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
