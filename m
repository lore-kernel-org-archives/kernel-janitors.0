From: Richard Knutsson <ricknu-0@student.ltu.se>
Date: Mon, 12 Feb 2007 05:28:44 +0000
Subject: Re: [KJ] memory zeroing macros
Message-Id: <45CFFB0C.1080206@student.ltu.se>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0702101731480.6852@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0702101731480.6852@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Greg KH wrote:
> On Mon, Feb 12, 2007 at 01:51:20AM +0000, Srdjan Todorovic wrote:
>   
>> On Sun, 11 Feb 2007, Greg KH wrote:
>>     
>>> Not true at all, 0 and len get switched a lot accidentally.  See the
>>> archives for times people have swept the kernel tree to fix this issue
>>> up.
>>>       
>> I agree with you here, Greg, about accidentally switching the args to
>> memset(). However just because someone (I've done this in the past,
>> damn hard to debug since you don't expect to make this silly mistake)
>> can do:
>>
>>   if (x = 0)  { }
>>     
>
> gcc will now warn against this :)
>
> Anyway, anyone is welcome to sweep the kernel tree to see if there are
> any 0 for the len argument in the tree left.
>
> thanks,
>
> greg k-h
>   
linux-2.6]$ grep -Enr "memset *\(.*, *0 *\)" *
Documentation/scsi/ChangeLog.1992-1997:260:     * scsi.c (scan_scsis): memset(SDpnt, 0) and set SCmd.device to SDpnt.
include/asm-arm/uaccess.h:392:#define __clear_user(addr,n)              (memset((void __force *)addr, 0, n), 0)
include/asm-frv/uaccess.h:274:#define clear_user(dst,count)                    (memset(____force(dst), 0, (count)), 0)
linux-2.6]$ 

So it seems ok.
Added it to an error-script with whom I can scan the tree in irregular intervals.

Richard Knutsson


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
