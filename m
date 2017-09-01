From: Michael Ellerman <patch-notifications@ellerman.id.au>
Date: Fri, 01 Sep 2017 13:29:52 +0000
Subject: Re: powerpc/eeh: Delete an error message for a failed memory allocation in two functions
Message-Id: <3xkKq44VX5z9t3x@ozlabs.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <0a35cb55-9f6b-21ca-565f-cab26237c962@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>, linuxppc-dev@lists.ozlabs.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Russell Currey <ruscur@russell.cc>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Fri, 2017-08-04 at 14:46:51 UTC, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 4 Aug 2017 16:37:56 +0200
> 
> Omit an extra message for a memory allocation failure in these functions.
> 
> This issue was detected by using the Coccinelle software.
> 
> Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/6ab41161b44a3b4d504ac29c9dd997

cheers
