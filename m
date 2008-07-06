From: Fredrik Noring <noring@nocrew.org>
Date: Sun, 06 Jul 2008 13:36:58 +0000
Subject: Re: [PATCH] dsp56k: use request_firmware
Message-Id: <A3D470E0-953E-40D6-BF5A-D06B76451154@nocrew.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1215253496.7816.7.camel@jaswinder.satnam>
In-Reply-To: <1215253496.7816.7.camel@jaswinder.satnam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaswinder Singh <jaswinder@infradead.org>
Cc: LKML <linux-kernel@vger.kernel.org>, David Woodhouse <dwmw2@infradead.org>, kernelnewbies <kernelnewbies@nl.linux.org>, kernel-janitors <kernel-janitors@vger.kernel.org>, Alan Cox <alan@lxorguk.ukuu.org.uk>, lars@nocrew.org, tomas@nocrew.org

Hi Jaswinder,

5 jul 2008 kl. 12.24 skrev Jaswinder Singh:
> +	for (i = 0; i < fw->size; i + 3) {

Are you sure about "i + 3" in this loop? Isn't GCC complaining,  
something like "statement with no effect"?

> +Driver: ATARI_DSP56K - Atari DSP56k support
> +
> +File: dsp56k/bootstap.bin
> +
> +Licence: Unknown
> +
> +Found in hex form in kernel source.

I wrote this DSP56k assembler code in 1995. It's a trivial copy loop  
that loads the main DSP program into memory. Please consider it GPL  
like the driver code it came from.

A disassembler would easily recreate the original ~50 lines of  
assembler source code, in case you'd like to assemble it with the rest  
of kernel. :)

Thanks,
Fredrik

