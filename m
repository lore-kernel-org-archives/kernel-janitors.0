From: Russell King <rmk+lkml@arm.linux.org.uk>
Date: Fri, 31 Dec 2004 10:00:37 +0000
Subject: [KJ] Re: [PATCH] esp: Make driver SMP-correct
Message-Id: <20041231100037.A29868@flint.arm.linux.org.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============68911009737428741=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20041231014403.3309.58245.96163@localhost.localdomain> <20041231014611.003281e5.akpm@osdl.org>
In-Reply-To: <20041231014611.003281e5.akpm@osdl.org>; from akpm@osdl.org on Fri, Dec 31, 2004 at 01:46:11AM -0800
To: Andrew Morton <akpm@osdl.org>
Cc: James Nelson <james4765@verizon.net>, kernel-janitors@lists.osdl.org, linux-kernel@vger.kernel.org

--===============68911009737428741==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 31, 2004 at 01:46:11AM -0800, Andrew Morton wrote:
> James Nelson <james4765@verizon.net> wrote:
> >
> > This is an attempt to make the esp serial driver SMP-correct.  It also removes
> >  some cruft left over from the serial_write() conversion.
> 
> >From a quick scan:
> 
> - startup() does multiple sleeping allocations and request_irq() under
>   spin_lock_irqsave().  Maybe fixed by this:

However, can you guarantee that two threads won't enter startup() at
the same time?  (that's what ASYNC_INITIALIZED is protecting the
function against, and the corresponding shutdown() as well.)

It's probably better to port ESP to the serial_core structure where
this type of thing is already taken care of.

-- 
Russell King
 Linux kernel    2.6 ARM Linux   - http://www.arm.linux.org.uk/
 maintainer of:  2.6 PCMCIA      - http://pcmcia.arm.linux.org.uk/
                 2.6 Serial core

--===============68911009737428741==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============68911009737428741==--
