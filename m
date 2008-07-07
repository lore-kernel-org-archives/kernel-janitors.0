From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Date: Mon, 07 Jul 2008 20:45:37 +0000
Subject: Re: [linux-dvb] [PATCH] Remove fdump tool for av7110 firmware
Message-Id: <20080707214537.49f69b51@the-village.bc.nu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1214139259.2994.8.camel@jaswinder.satnam>
	<200807060315.51736@orion.escape-edv.de>
	<20080707180222.4b4a53a9@gaivota>
In-Reply-To: <20080707180222.4b4a53a9@gaivota>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: Oliver Endriss <o.endriss@gmx.de>, linux-dvb@linuxtv.org, Jaswinder Singh <jaswinder@infradead.org>, LKML <linux-kernel@vger.kernel.org>, kernelnewbies <kernelnewbies@nl.linux.org>, kernel-janitors <kernel-janitors@vger.kernel.org>, David Woodhouse <dwmw2@infradead.org>

> Having a binary firmware inside a GPL'd file seems to be (at least for some
> people) a GPL violation, since the firmware source code should also be released
> with GPL (please read [1] for a good article about this).

The firmware is usually a separate program, running on a separate
processor communicating by a standard API and is used by Linux, Windows
and other OS's. Thats not quite the same as say the Nvidia driver.

If it happens to keep the GPL zealots happier then fine, but there are
good sound technical reasons for doing it

- compiled in firmware isn't pageable
- compiled in firmware can't be updated separately
- it makes it really hard for end users told to "try the new firmware" -
especially in the enterprise space.

Clearly there are some cases that is less relevant - drivers where the
firmware/OS pair must match such as aic7xxx where you don't really want
firmware floating around loose.

Alan
