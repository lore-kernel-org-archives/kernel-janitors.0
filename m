From: Michael Ellerman <patch-notifications@ellerman.id.au>
Date: Wed, 03 Feb 2021 11:40:39 +0000
Subject: Re: [PATCH] powerpc/setup: Adjust six seq_printf() calls in show_cpuinfo()
Message-Id: <161235201005.1516112.10488411245763781267.b4-ty@ellerman.id.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5b62379e-a35f-4f56-f1b5-6350f76007e7@web.de>
In-Reply-To: <5b62379e-a35f-4f56-f1b5-6350f76007e7@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linuxppc-dev@lists.ozlabs.org, Andrew Morton <akpm@linux-foundation.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Mike Rapoport <rppt@linux.ibm.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Markus Elfring <Markus.Elfring@web.de>, Christophe Leroy <christophe.leroy@c-s.fr>, Paul Mackerras <paulus@samba.org>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Tue, 2 Jul 2019 14:56:46 +0200, Markus Elfring wrote:
> A bit of information should be put into a sequence.
> Thus improve the execution speed for this data output by better usage
> of corresponding functions.
> 
> This issue was detected by using the Coccinelle software.

Applied to powerpc/next.

[1/1] powerpc/setup: Adjust six seq_printf() calls in show_cpuinfo()
      https://git.kernel.org/powerpc/c/675b963e2b6007818fe1b0a64b47be40c125246e

cheers
