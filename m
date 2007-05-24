From: Jaco Kroon <jaco@kroon.co.za>
Date: Thu, 24 May 2007 21:26:31 +0000
Subject: Re: [KJ] This might be a basic thing
Message-Id: <46560307.90503@kroon.co.za>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

ed wrote:
> Hi,
> 
> I have recently had an issue with a USB storage device that can read
> many different removable media devices, SD, CF/MD, SM/XD etc etc.
> 
> However, on different computers I get different results, some can read
> the SD only, (one other computer that belongs to a friend who has the
> same gadget as me) can read/write the SD.
> 
> I am sure this is something hardware related to the device. I've had
> it apart and I have tried to jam the SD read/lock tab sensor in the
> write-present position to no avail.
> 
> Would this be a signal that is given to the kernel, or would it be a
> signal that the usb device/gadget chip process.
> 
> What I'm looking to do is fiddle the usb-storage code so that the
> write-present tab is always considered on (I've not yet read the code,
> as I want to just get an idea for what is involved first).
> 
> Am I trying to do something insane or impossible - is the USB gadget
> the overlord and I am just unfortunate to have a device that I cannot
> write with - ever?

No, it was already done, I recall a while back where there was an option 
on the usb-storage module to ignore the write-protect bit because 
apparantly it didn't work so well at the time (albeit it always seemed 
to work for me), I don't see that option any more however.  IIRC this 
was beginning 2004 round about.  You might want to go take a look at the 
kernels released around then.

Jaco

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
