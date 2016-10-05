From: Michael Ellerman <patch-notifications@ellerman.id.au>
Date: Wed, 05 Oct 2016 02:36:28 +0000
Subject: Re: cxl: replace loop with for_each_child_of_node(), remove unneeded of_node_put()
Message-Id: <3spfzw6LSRz9t0t@ozlabs.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <1469764534-26948-1-git-send-email-andrew.donnellan@au1.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Donnellan <andrew.donnellan@au1.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: clombard@linux.vnet.ibm.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, fbarrat@linux.vnet.ibm.com, julia.lawall@lip6.fr, imunsie@au1.ibm.com, elfring@users.sourceforge.net

On Fri, 2016-29-07 at 03:55:34 UTC, Andrew Donnellan wrote:
> Rewrite the cxl_guest_init_afu() loop in cxl_of_probe() to use
> for_each_child_of_node() rather than a hand-coded for loop.
> 
> Remove the useless of_node_put(afu_np) call after the loop, where it's
> guaranteed that afu_np = NULL.
> 
> Reported-by: SF Markus Elfring <elfring@users.sourceforge.net>
> Reported-by: Julia Lawall <julia.lawall@lip6.fr>
> Signed-off-by: Andrew Donnellan <andrew.donnellan@au1.ibm.com>
> Reviewed-by: Frederic Barrat <fbarrat@linux.vnet.ibm.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/735840b44bcc998e2574faf63d1aaa

cheers
