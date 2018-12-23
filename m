From: Michael Ellerman <patch-notifications@ellerman.id.au>
Date: Sun, 23 Dec 2018 13:28:09 +0000
Subject: Re: [2/5] powerpc/4xx: Use seq_putc() in ocm_debugfs_show()
Message-Id: <43N38T6bJTz9sP7@ozlabs.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <400b7f67-bd62-9f5f-228b-9633c23671d7@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>, linuxppc-dev@lists.ozlabs.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Rob Herring <robh@kernel.org>, Tyrel Datwyler <tyreld@linux.vnet.ibm.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Thu, 2018-01-11 at 18:01:33 UTC, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 11 Jan 2018 18:10:02 +0100
> 
> A single character (line break) should be put into a sequence.
> Thus use the corresponding function "seq_putc".
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/52930bc6e87191af3894bec302774f

cheers
