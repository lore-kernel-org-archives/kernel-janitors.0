From: Jim Nelson <james4765@verizon.net>
Date: Fri, 31 Dec 2004 11:00:11 +0000
Subject: [KJ] Re: [PATCH] esp: Make driver SMP-correct
Message-Id: <41D5313B.1080907@verizon.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============93912678420365792=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20041231014403.3309.58245.96163@localhost.localdomain> <20041231014611.003281e5.akpm@osdl.org> <20041231100037.A29868@flint.arm.linux.org.uk>
In-Reply-To: <20041231100037.A29868@flint.arm.linux.org.uk>
To: Russell King <rmk+lkml@arm.linux.org.uk>
Cc: Andrew Morton <akpm@osdl.org>, kernel-janitors@lists.osdl.org, linux-kernel@vger.kernel.org

--===============93912678420365792==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Russell King wrote:
> On Fri, Dec 31, 2004 at 01:46:11AM -0800, Andrew Morton wrote:
> 
>>James Nelson <james4765@verizon.net> wrote:
>>
>>>This is an attempt to make the esp serial driver SMP-correct.  It also removes
>>> some cruft left over from the serial_write() conversion.
>>
>>>From a quick scan:
>>
>>- startup() does multiple sleeping allocations and request_irq() under
>>  spin_lock_irqsave().  Maybe fixed by this:
> 
> 
> However, can you guarantee that two threads won't enter startup() at
> the same time?  (that's what ASYNC_INITIALIZED is protecting the
> function against, and the corresponding shutdown() as well.)
> 
> It's probably better to port ESP to the serial_core structure where
> this type of thing is already taken care of.
> 

You are right.  Quite a bit of work, if I am looking at it correctly, though.  Any 
pointers/URLs to help a newbie get their head wrapped around the process?

--===============93912678420365792==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============93912678420365792==--
