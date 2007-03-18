From: Richard Knutsson <ricknu-0@student.ltu.se>
Date: Sun, 18 Mar 2007 14:15:58 +0000
Subject: Re: [KJ] is there a kernel standard for assertions?
Message-Id: <45FD499E.8060001@student.ltu.se>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0703171550100.8121@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0703171550100.8121@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Randy Dunlap wrote:
> On Sun, 18 Mar 2007 04:39:39 +0100 Richard Knutsson wrote:
>
>   
>> Robert P. J. Day wrote:
>>     
>>> On Sat, 17 Mar 2007, Adrian Bunk wrote:
>>>
>>>   
>>>       
>>>> On Sat, Mar 17, 2007 at 02:39:25PM -0600, Matthew Wilcox wrote:
>>>>     
>>>>         
>>>>> On Sat, Mar 17, 2007 at 03:51:49PM -0400, Robert P. J. Day wrote:
>>>>>       
>>>>>           
>>>>>>   it seems like lots of kernel code is re-inventing the idea of an
>>>>>> assertion.  is there no single basic standard for assertions in the
>>>>>> kernel?
>>>>>>         
>>>>>>             
>>>>> BUG_ON().
>>>>>       
>>>>>           
>>>> Or WARN_ON() if it's considered non-fatal.
>>>>     
>>>>         
>>> i'm aware of both of those macros, which is why i'm wondering why so
>>> many developers insist on inventing their own version of an "assert"
>>> routine.  given all of the *existing* debugging routines, shouldn't
>>> inventing your own be discouraged?  is that something that could be
>>> turned into a KJ project of some kind?
>>>   
>>>       
>> Is there any way to just enable the debugging for one sub-system and not 
>> the whole tree?
>>     
>
> A few subsystems have specific debug-enabling config symbols,
> like USB and ACPI and KOBJECT and PM (Power Management) and PCI,
> PCMCIA, NETFILTER, IRDA, IEEE80211, DRIVERS, MTD, PNP, SCSI,
> SPI, SOUND, HID, MMC, EDAC, JBD, JFS, NTFS, UFS, CIFS, DLM,
> and KOBJECTS (just to name some of the big ones).
>
> But BUG_ON() and WARN_ON() are often used without the aid (i.e.,
> enabling) of those DEBUG config symbols.
>   
"Often used without"? Is it possible to enable BUG_ON() and WARN_ON() 
with those config symbols? I can see how to disable ex BUG_ON by:
<in header>

#ifndef DEBUG_CONFIG_SYMBOL

#undef BUG_ON

#define BUG_ON(x)    do {} while(0);

#endif

or

<in code>

#ifdef DEBUG_CONFIG_SYMBOL
	BUG_ON(...)
#endif


But how to enable them when DEBUG is not defined? Otherwise I can 
understand if maintainers do not want to use BUG_ON/WARN_ON and get the 
debugging-info from the whole system.
Would something like SUBSYS_BUG_ON() be acceptable, who are just like 
BUG_ON() but is (en/dis)abled by the subsystems debug-config-symbol? 
(Would require some SUBSYS_BUG_ON_INIT() to define the debug-symbol)

Just my 2c
Richard Knutsson

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
