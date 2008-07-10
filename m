From: Fredrik Noring <noring@nocrew.org>
Date: Thu, 10 Jul 2008 07:38:36 +0000
Subject: Re: [PATCH] dsp56k: use request_firmware
Message-Id: <CFF38114-82BA-4A35-B378-8D0A5628E560@nocrew.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1215253496.7816.7.camel@jaswinder.satnam> <A3D470E0-953E-40D6-BF5A-D06B76451154@nocrew.org> <1215357224.2817.2.camel@jaswinder.satnam> <43A34816-3B93-4D05-AE0A-65C0FBF35589@nocrew.org> <1215358732.2817.11.camel@jaswinder.satnam> <1215363247.3189.113.camel@shinybook.infradead.org> <35647D7D-85D1-4308-B3A1-63CDCC3F14F7@nocrew.org> <1215608750.11567.177.camel@pmac.infradead.org>
In-Reply-To: <1215608750.11567.177.camel@pmac.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Woodhouse <dwmw2@infradead.org>
Cc: Jaswinder Singh <jaswinder@infradead.org>, LKML <linux-kernel@vger.kernel.org>, kernelnewbies <kernelnewbies@nl.linux.org>, kernel-janitors <kernel-janitors@vger.kernel.org>, Alan Cox <alan@lxorguk.ukuu.org.uk>, Lars Brinkhoff <lars@nocrew.org>, =?ISO-8859-1?Q?Tomas_Sk=E4re?= <tomas@nocrew.org>

Hi David,

9 jul 2008 kl. 15.05 skrev David Woodhouse:
> It is in fact identical. Disassembly with the tools found on  
> sourceforge
> was fun, since they have endianness bugs, don't recognise the 'JMP'
> which was the first instruction, and need each 3-byte instruction in  
> the
> binary to be prefixed with a zero byte to make it 4 bytes. But after
> sorting that out and going through it instruction by instruction, it
> really does seem to match.

Heh. Amazing.

[ I think the code can be simplified: It currently copies itself to a  
high program memory location, but this is not necessary because DSP  
soft reset was never implemented (the reset would have been trapped by  
the code, in order to load a new program). The driver instead power- 
cycles the DSP every time a new program is loaded. ]

> Thanks very much for digging it out.

No problem!

> When you say 'GPL like the driver it came from', actually the driver
> doesn't specify any version of the GPL but does refer to the top-level
> COPYING file. So we'll take that to mean 'GPLv2 and not later', like  
> the
> majority of the kernel. OK?

OK with me.

Thanks,
Fredrik

