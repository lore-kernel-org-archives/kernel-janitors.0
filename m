From: Jim Nelson <james4765@cwazy.co.uk>
Date: Fri, 31 Dec 2004 22:16:42 +0000
Subject: Re: [KJ] Re: [PATCH] esp: Make driver SMP-correct
Message-Id: <41D5CFCA.7000300@cwazy.co.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============89293159343238382=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20041231014403.3309.58245.96163@localhost.localdomain>	<20041231014611.003281e5.akpm@osdl.org>	<20041231100037.A29868@flint.arm.linux.org.uk> <20041231170139.B10216@flint.arm.linux.org.uk>
In-Reply-To: <20041231170139.B10216@flint.arm.linux.org.uk>
To: Russell King <rmk+lkml@arm.linux.org.uk>
Cc: Andrew Morton <akpm@osdl.org>, kernel-janitors@lists.osdl.org, linux-kernel@vger.kernel.org

--===============89293159343238382==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Russell King wrote:
> On Fri, Dec 31, 2004 at 10:00:37AM +0000, Russell King wrote:
> 
>>On Fri, Dec 31, 2004 at 01:46:11AM -0800, Andrew Morton wrote:
>>
>>>James Nelson <james4765@verizon.net> wrote:
>>>
>>>>This is an attempt to make the esp serial driver SMP-correct.  It also removes
>>>> some cruft left over from the serial_write() conversion.
>>>
>>>>From a quick scan:
>>>
>>>- startup() does multiple sleeping allocations and request_irq() under
>>>  spin_lock_irqsave().  Maybe fixed by this:
>>
>>However, can you guarantee that two threads won't enter startup() at
>>the same time?  (that's what ASYNC_INITIALIZED is protecting the
>>function against, and the corresponding shutdown() as well.)
>>
>>It's probably better to port ESP to the serial_core structure where
>>this type of thing is already taken care of.
> 
> 
> For the record, Verizon appear to have adopted silly policies.
> 
>>From now on, I will be removing the CC: line containing any verizon
> email address until further notice, or just plain ignoring mails
> containing such addresses.  Why?  To prevent the inevitable bounce
> caused by their misconfigured systems.  None of the servers I have
> access to on several different ISPs can connect to Verizon's incoming
> mail server.
> 
> See:
>  http://www.broadbandreports.com/forum/remark,12116645~mode=flat~days=9999
> 
> particularly the last post by techie68, who claims to be a Verizon
> tech support person.
> 
> I encourage James Nelson to find another provider without silly policies
> in the mean time.
> 
> 

Another mail provider has been found.  Bloody Verizon.

Documentation/serial/driver mentions a reference implementation - serial_amba.c. 
Couldn't find it in the 2.6.10 kernel sources - was it removed, and what would be 
a good refernce implementation in the current sources?

Jim

--===============89293159343238382==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============89293159343238382==--
