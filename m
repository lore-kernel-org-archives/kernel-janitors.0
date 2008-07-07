From: Mauro Carvalho Chehab <mchehab@infradead.org>
Date: Mon, 07 Jul 2008 21:02:22 +0000
Subject: Re: [linux-dvb] [PATCH] Remove fdump tool for av7110 firmware
Message-Id: <20080707180222.4b4a53a9@gaivota>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1214139259.2994.8.camel@jaswinder.satnam>
	<200807060315.51736@orion.escape-edv.de>
In-Reply-To: <200807060315.51736@orion.escape-edv.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oliver Endriss <o.endriss@gmx.de>
Cc: kernelnewbies <kernelnewbies@nl.linux.org>, David Woodhouse <dwmw2@infradead.org>, kernel-janitors <kernel-janitors@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Jaswinder Singh <jaswinder@infradead.org>, linux-dvb@linuxtv.org, Alan Cox <alan@lxorguk.ukuu.org.uk>

Hi Oliver,

> @Mauro:
> Is there a way to strip this stuff from Kconfig/Makefile/av7110*.[ch]
> for submission to the kernel? Basically I don't care whether and how
> they cripple the driver in the kernel. But I would like to keep the code
> 'as is' in the linuxtv repositories.

Having a binary firmware inside a GPL'd file seems to be (at least for some
people) a GPL violation, since the firmware source code should also be released
with GPL (please read [1] for a good article about this).

This seems to be one of the reasons for moving all firmwares that are still in
kernel into a separate dir. A latter step seems to move those files to a cousin
tree, hosted together with kernel tree, and clearly stating that those
firmwares are not GPL, but are allowed to be used with Linux. 

IANAL, but, if the firmware is violating GPL at Kernel, the same violation also
affects our tree. So, from legal POV, I think we ought to do the same thing at
V4L/DVB. 

Probably, it is safe to keep the firmware files into a separate dir,
if we state clearly that the firmwares are not GPL.

Anyway, let's see how we can handle it after having those patches merged at
mainstream.

[1] http://lwn.net/Articles/284932/

Cheers,
Mauro
