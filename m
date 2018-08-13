From: Michael Ellerman <patch-notifications@ellerman.id.au>
Date: Mon, 13 Aug 2018 11:22:52 +0000
Subject: Re: powerpc: Use common error handling code in setup_new_fdt()
Message-Id: <41ptcs19GYz9s7c@ozlabs.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <0dd9d938-8d89-f0e0-f05f-9a3e5dc42a57@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>, linuxppc-dev@lists.ozlabs.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Borislav Petkov <bp@suse.de>, Brijesh Singh <brijesh.singh@amd.com>, Josh Sklar <sklar@linux.vnet.ibm.com>, Kees Cook <keescook@chromium.org>, Paul Mackerras <paulus@samba.org>, Thiago Jung Bauermann <bauerman@linux.vnet.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Tom Lendacky <thomas.lendacky@amd.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Sun, 2018-03-11 at 08:16:47 UTC, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 11 Mar 2018 09:03:42 +0100
> 
> Add a jump target so that a bit of exception handling can be better reused
> at the end of this function.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> Reviewed-by: Thiago Jung Bauermann <bauerman@linux.vnet.ibm.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/baedcdf5054c151a33e34392af7d8c

cheers
