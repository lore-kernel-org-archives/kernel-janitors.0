From: Michael Ellerman <patch-notifications@ellerman.id.au>
Date: Wed, 03 Feb 2021 11:40:37 +0000
Subject: Re: [PATCH 0/2] PowerPC-pSeries: Adjustments for dlpar_store()
Message-Id: <161235200944.1516112.5674406874820012967.b4-ty@ellerman.id.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <db28c84d-ac07-6d9a-a371-c97ab72bf763@web.de>
In-Reply-To: <db28c84d-ac07-6d9a-a371-c97ab72bf763@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linuxppc-dev@lists.ozlabs.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Frank Rowand <frank.rowand@sony.com>, Michael Ellerman <mpe@ellerman.id.au>, Allison Randal <allison@lohutok.net>, Markus Elfring <Markus.Elfring@web.de>, Oliver O'Halloran <oohall@gmail.com>, Nathan Lynch <nathanl@linux.ibm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Paul Mackerras <paulus@samba.org>, Gen Zhang <blackgod016574@gmail.com>, Nathan Fontenot <nfont@linux.vnet.ibm.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Tue, 27 Aug 2019 14:40:42 +0200, Markus Elfring wrote:
> Two update suggestions were taken into account
> from static source code analysis.
> 
> Markus Elfring (2):
>   Delete an unnecessary kfree() call
>   Delete an error message for a failed string duplication
> 
> [...]

Applied to powerpc/next.

[1/2] powerpc/pseries: Delete an unnecessary kfree() call in dlpar_store()
      https://git.kernel.org/powerpc/c/de060ac83e5c1fe5fb8c505a4e99c1fe4f70ff94
[2/2] powerpc/pseries: Delete an error message for a failed string duplication in dlpar_store()
      https://git.kernel.org/powerpc/c/6e7a4da754f3087fa1f0839c1128aac233c21442

cheers
