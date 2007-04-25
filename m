From: Jaco Kroon <jaco@kroon.co.za>
Date: Wed, 25 Apr 2007 22:25:45 +0000
Subject: Re: [KJ] netlink bug?
Message-Id: <462FD569.6060906@kroon.co.za>
List-Id: <kernel-janitors.vger.kernel.org>
References: <462F68A8.5090803@kroon.co.za>
In-Reply-To: <462F68A8.5090803@kroon.co.za>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Greg KH wrote:
> On Wed, Apr 25, 2007 at 04:41:44PM +0200, Jaco Kroon wrote:
>>  Hi guys,
>>
>>  I've got a piece of code that seems to reliably cause the kernel to panic, 
>>  looks like a problem somewhere down the netlink core...
>>
>>  I've been trying to use NETLINK_FIB_LOOKUP but so far the closest I've come 
>>  to success was a kernel crash, a slightly stripped down version of the code 
>>  that first crashed it attached.  If somebody else can confirm this it would 
>>  be appreciated, also, any pointers on what I'm doing wrong that triggers the 
>>  behaviour to begin with would be appreciated, thanks.
>>
>>  I'm currently on kernel version 2.6.19.2, so this may have been fixed in the 
>>  meantime.  Note that I don't need to run the code as root in order to 
>>  trigger the crash.
> 
> Next time, if you find a kernel issue like this, could you just forward
> this to the security@kernel.org mail alias?  This turned out to be a
> real kernel issue, and now 2.6.20.8 is released with a fix for this
> problem.
> 
> I still think there's a bug in your userspace program, but the kernel
> shouldn't die anymore at least :)

Trust me, I know there is a bug in my userspace app, wasn't aware of the 
security@kernel.org mail alias (and didn't like the idea of pushing 
directly to lkml where it would be likely to be overlooked), will use 
that next time.  I'd like to know _how_ the userspace app should 
actually work, but I'll leave that for another day ... (documentation is 
rather scarce).

Thanks for forwarding, and thanks for getting it resolved.

Jaco
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
