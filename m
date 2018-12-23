From: Michael Ellerman <patch-notifications@ellerman.id.au>
Date: Sun, 23 Dec 2018 13:28:08 +0000
Subject: Re: [1/5] powerpc/4xx: Combine four seq_printf() calls into two in ocm_debugfs_show()
Message-Id: <43N38S6v33z9sP9@ozlabs.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <90e9f81b-25ad-cf02-663c-50a9997d9d53@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>, linuxppc-dev@lists.ozlabs.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Rob Herring <robh@kernel.org>, Tyrel Datwyler <tyreld@linux.vnet.ibm.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Thu, 2018-01-11 at 18:00:33 UTC, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 11 Jan 2018 18:08:08 +0100
> 
> Some data were printed into a sequence by four separate function calls.
> Print the same data by two single function calls instead.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/b52106a040e6f86848b05be1b43174

cheers
