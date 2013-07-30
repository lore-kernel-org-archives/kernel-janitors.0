From: Kumar Gaurav <kumargauravgupta3@gmail.com>
Date: Tue, 30 Jul 2013 16:41:01 +0000
Subject: Re: Unable to use Own USB Module
Message-Id: <51F7E9CD.1010403@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <51F7DE52.5060606@gmail.com>
In-Reply-To: <51F7DE52.5060606@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tuesday 30 July 2013 09:44 PM, Greg Kroah-Hartman wrote:
> On Tue, Jul 30, 2013 at 09:10:02PM +0530, Kumar Gaurav wrote:
>> Hi All,
>>
>> I'm a newbie so please don't spare me if this question seems too amateur.
>>
>> I wanted to try making a basic USB module and use it for test so
>> that i can get basic understanding of working of USB modules.
>>
>> I compiled and booted with kernel 3.11-rc2 with USB_STORAGE=Y following
>> 	http://www.linuxtopia.org/online_books/linux_kernel/kernel_configuration/ch09.html#lkn_usb_storage
>>
>> Iut i'm unable to find module using my USB.
>
> That's because you told it to be built into the kernel, not a module.
>
> And you really don't want to mess around with usb-storage as a "first
> attempt", it's one of the most complex things that USB does (it's really
> SCSI over USB), so it's not easy at all.
>
> good luck,
>
> greg k-h
>
Hi greg,

Thanks for your help and i'm gonna try it out.
Can you suggest me that what can i start with specifically in USB.
I tried sending patch from staging area for correction on coding style 
issue. but wanna try out on some real bug. Currently just experimenting 
with one of your document "Write a real Linux driver".


Regards,
Kumar Gaurav


