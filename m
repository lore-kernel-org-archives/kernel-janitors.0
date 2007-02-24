From: David Negreira <david.negreira@gmail.com>
Date: Sat, 24 Feb 2007 03:24:21 +0000
Subject: [KJ] make menuconfig -> usb dsl support
Message-Id: <1172287461.14947.6.camel@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello there!

I would ask you all to do a make menuconfig, go to device drivers -> usb
support -> usb dsl support
If you do a search (/speedtouch) you will find that there should be an
option there.

Why is that empty ? I know that some kernel versions ago it had support
for an alcatel modem that i have in order to do the proper firmware
loading and had full support for that modem.
What happened?
Should this section be removed from the kernel options ?
If that is the case, can i remove it and submit a patch ?

Waiting for feedback.

--
David Negreira.


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
