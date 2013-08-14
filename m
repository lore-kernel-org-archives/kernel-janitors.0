From: Gareth Davies <grmd@lotwillow.co.uk>
Date: Wed, 14 Aug 2013 06:31:02 +0000
Subject: Re: Configure DMA atributes?
Message-Id: <20130814073102.17686rp67c37s3l2@isher.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CA+MoWDo8nhoomstYJx6Q5Krj-m=_swmpMu2iE5aHRH-gDf-QEQ@mail.gmail.com>
In-Reply-To: <CA+MoWDo8nhoomstYJx6Q5Krj-m=_swmpMu2iE5aHRH-gDf-QEQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernelnewbies@lists.kernelnewbies.org

On Mon, 12 Aug 2013 19:55:35 +0200, you wrote:
>
> From: drivers/net/ethernet/realtek/8139cp.c
>
[snip]
>
> If I comment the assignment to pci_using_dac, the compiler issues
> warnings, but it makes no visible difference to assign 1 or 0.
>
> If I had real hardware what could I brake by playing with this code?
>

Does the following help:
<URL:http://en.wikipedia.org/wiki/Conventional_PCI#Dual-cycle_address>

On real hardware, when using a PCI bus, setting the PCIDAC flag in  
8139cp.c is intended to signify that 64-bit addressing is being used.

-- 
Gareth Davies, Lotwillow Ltd

