From: Wolfgang =?iso-8859-1?q?M=FCes?= <wolfgang@iksw-muees.de>
Date: Wed, 28 Jul 2004 18:23:23 +0000
Subject: [Kernel-janitors] Re: [PATCH] usb/auerswald: replace
Message-Id: <200407282023.23796.wolfgang@iksw-muees.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Hello Nishanth,

On Wednesday 28 July 2004 01:12, Nishanth Aravamudan wrote:
> I would appreciate any comments from the janitors list.
>
> Applys-to: 2.6.7
>
> Description: Use msleep() instead of schedule_timeout() to
> guarantee the task delays for the desired time.
>
> Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>
>
>
> --- linux-vanilla/drivers/usb/misc/auerswald.c	2004-06-16

I am the author of this driver.

Can you give me the rationale of the proposed change?
In what sense is msleep() better/other than schedule_timeout?

Note that I am rewriting this driver now. But I have heavy problems with=20
the error handling of control IN messages and/or INT IN messages on USB=20
2.0 UHCI in SMP systems....

best regards
Wolfgang M=FCes


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
