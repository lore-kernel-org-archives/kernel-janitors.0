From: Michael Ellerman <patch-notifications@ellerman.id.au>
Date: Fri, 27 Jan 2017 00:40:36 +0000
Subject: Re: powerpc/sstep: Return directly after a failed address_ok() in emulate_step()
Message-Id: <3v8g1c5k46z9tjx@ozlabs.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <bc39d538-80f2-e810-0d58-39522605e067@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>, linuxppc-dev@lists.ozlabs.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Lennart Sorensen <lsorense@csclub.uwaterloo.ca>, Nicholas Piggin <npiggin@gmail.com>, Oliver O'Halloran <oohall@gmail.com>, Paul Mackerras <paulus@samba.org>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Sat, 2017-01-21 at 14:45:19 UTC, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 21 Jan 2017 15:30:15 +0100
> 
> * Return directly after a call of the function "address_ok" failed
>   in a case block.
> 
>   This issue was detected by using the Coccinelle software.
> 
> * Delete two error code assignments which became unnecessary with
>   this refactoring.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/3c4b66a6d0d2b9f2418f9a09d528e4

cheers
