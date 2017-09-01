From: Michael Ellerman <patch-notifications@ellerman.id.au>
Date: Fri, 01 Sep 2017 13:29:46 +0000
Subject: Re: powerpc/mm: Use seq_putc() in two functions
Message-Id: <3xkKpy6bTSz9t32@ozlabs.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <98cb37ed-adee-3e13-8501-baa500c27951@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>, linuxppc-dev@lists.ozlabs.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy <christophe.leroy@c-s.fr>, Oliver O'Halloran <oohall@gmail.com>, Paul Mackerras <paulus@samba.org>, Rashmica Gupta <rashmica.g@gmail.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Sun, 2017-05-07 at 14:38:36 UTC, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 7 May 2017 16:32:04 +0200
> 
> Two single characters (line breaks) should be put into a sequence.
> Thus use the corresponding function "seq_putc".
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/aae85e3c20ec3baa90aa901a517c8f

cheers
