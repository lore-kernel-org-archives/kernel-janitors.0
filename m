From: Klaus Schmidinger <Klaus.Schmidinger@cadsoft.de>
Date: Sun, 06 Jul 2008 09:09:19 +0000
Subject: Re: [linux-dvb] [PATCH] Remove fdump tool for av7110 firmware
Message-Id: <48708BBF.9050400@cadsoft.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1214139259.2994.8.camel@jaswinder.satnam>
	<200807060315.51736@orion.escape-edv.de>
In-Reply-To: <200807060315.51736@orion.escape-edv.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-dvb@linuxtv.org
Cc: kernelnewbies <kernelnewbies@nl.linux.org>, kernel-janitors <kernel-janitors@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Jaswinder Singh <jaswinder@infradead.org>, David Woodhouse <dwmw2@infradead.org>, Alan Cox <alan@lxorguk.ukuu.org.uk>

On 07/06/08 03:15, Oliver Endriss wrote:
> Jaswinder Singh wrote:
>> There's no point in this, since the user can use the BUILTIN_FIRMWARE
>> option to include arbitrary firmware files directly in the kernel image.
> 
> NAK! This option allows to compile the firmware into the _driver_,
> which is very useful if you want to test various driver/firmware
> combinations. Having the firmware in the _kernel_ does not help!

I strongly support Oliver's request!
Working with various driver versions is much easier with the
firmware compiled into the driver!

Klaus

> Well, I am tired to fight for this option in the kernel every other
> month. :-(
> 
> @Mauro:
> Is there a way to strip this stuff from Kconfig/Makefile/av7110*.[ch]
> for submission to the kernel? Basically I don't care whether and how
> they cripple the driver in the kernel. But I would like to keep the code
> 'as is' in the linuxtv repositories.
> 
> CU
> Oliver
