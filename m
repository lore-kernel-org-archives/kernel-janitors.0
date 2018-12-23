From: Michael Ellerman <patch-notifications@ellerman.id.au>
Date: Sun, 23 Dec 2018 13:28:10 +0000
Subject: Re: [3/5] powerpc/4xx: Delete an error message for a failed memory allocation in three functions
Message-Id: <43N38W0169z9sP2@ozlabs.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <92f46132-b654-cc73-a589-4abf8ab3122a@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>, linuxppc-dev@lists.ozlabs.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Rob Herring <robh@kernel.org>, Tyrel Datwyler <tyreld@linux.vnet.ibm.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Thu, 2018-01-11 at 18:02:45 UTC, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 11 Jan 2018 18:28:54 +0100
> 
> Omit an extra message for a memory allocation failure in these functions.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/a8d5dadae59f5866ac3b68cb993d53

cheers
