From: Michael Ellerman <patch-notifications@ellerman.id.au>
Date: Sun, 23 Dec 2018 13:28:11 +0000
Subject: Re: [5/5] powerpc/4xx: Delete an unnecessary return statement in two functions
Message-Id: <43N38W5pqRz9sNr@ozlabs.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <de85bbcd-36a8-7de5-8d18-96e1530a23c2@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>, linuxppc-dev@lists.ozlabs.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Rob Herring <robh@kernel.org>, Tyrel Datwyler <tyreld@linux.vnet.ibm.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Thu, 2018-01-11 at 18:04:54 UTC, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 11 Jan 2018 18:40:23 +0100
> 
> The script "checkpatch.pl" pointed information out like the following.
> 
> WARNING: void function return statements are not generally useful
> 
> Thus remove such a statement in the affected functions.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/ae6263cc33742d1c179510b6aadd31

cheers
