From: Russell King <rmk@arm.linux.org.uk>
Date: Fri, 06 Aug 2004 16:33:40 +0000
Subject: [Kernel-janitors] Re: [PATCH] serial/8250_pci: replace
Message-Id: <20040806173340.D13948@flint.arm.linux.org.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============74551374707927254=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============74551374707927254==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 27, 2004 at 04:00:52PM -0700, Nishanth Aravamudan wrote:
> Description: Use msleep() instead of schedule_timeout() to 
> guarantee the task delays for the desired time.

Applied, thanks.

-- 
Russell King
 Linux kernel    2.6 ARM Linux   - http://www.arm.linux.org.uk/
 maintainer of:  2.6 PCMCIA      - http://pcmcia.arm.linux.org.uk/
                 2.6 Serial core

--===============74551374707927254==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============74551374707927254==--
