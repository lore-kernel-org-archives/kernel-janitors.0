From: Chris Rankin <rankincj@yahoo.com>
Date: Mon, 22 Oct 2007 08:11:36 +0000
Subject: IRQ error when enabling PCI device in Linux 2.6
Message-Id: <218792.41386.qm@web52906.mail.re2.yahoo.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,

I have a PCI driver in 2.6.23.1 that is causing an unhandled IRQ error as soon as the PCI device
is enabled! (It's hostap_plx.) Now I understand that you *need* to enable the PCI device before
you can read the IRQ number or other resources, and this device does work fine in an old Linux
2.4.33 box. So can someone suggest the best way of fixing this driver in Linux 2.6, please?

For reference, the IRQ which the kernel complains that no-one cares about is indeed the IRQ of my
shiny PCI device, as given by lspci. This IRQ is also being shared by another PCI device (and
unavoidably so, I'm afraid).

My kernel is compiled as UP with 4K stacks and PREEMPT enabled.

Cheers,
Chris



      ___________________________________________________________
Yahoo! Answers - Got a question? Someone out there knows the answer. Try it
now.
http://uk.answers.yahoo.com/ 
