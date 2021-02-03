From: Michael Ellerman <patch-notifications@ellerman.id.au>
Date: Wed, 03 Feb 2021 11:40:35 +0000
Subject: Re: [PATCH 0/2] powerpc/82xx: Adjustments for pq2ads_pci_init_irq()
Message-Id: <161235200985.1516112.15383644631445109361.b4-ty@ellerman.id.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <6dc7d70e-8a40-46ab-897b-d2eaf9a87d77@web.de>
In-Reply-To: <6dc7d70e-8a40-46ab-897b-d2eaf9a87d77@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linuxppc-dev@lists.ozlabs.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Kate Stewart <kstewart@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, Michael Ellerman <mpe@ellerman.id.au>, Markus Elfring <Markus.Elfring@web.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Paul Mackerras <paulus@samba.org>, Enrico Weigelt <lkml@metux.net>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Tue, 27 Aug 2019 10:23:29 +0200, Markus Elfring wrote:
> Two update suggestions were taken into account
> from static source code analysis.
> 
> Markus Elfring (2):
>   Delete an unnecessary of_node_put() call
>   Use common error handling code
> 
> [...]

Applied to powerpc/next.

[1/2] powerpc/82xx: Delete an unnecessary of_node_put() call in pq2ads_pci_init_irq()
      https://git.kernel.org/powerpc/c/60aece416483fdf7e51728a3518438e0458bdabb
[2/2] powerpc/82xx: Use common error handling code in pq2ads_pci_init_irq()
      https://git.kernel.org/powerpc/c/c0cff7a17781f8b02b4837a9fc434a7eed322a14

cheers
