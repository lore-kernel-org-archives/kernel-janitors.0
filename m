From: Michael Ellerman <mpe@ellerman.id.au>
Date: Wed, 13 Apr 2016 13:33:34 +0000
Subject: Re: cxl: Delete an unnecessary check before the function call "kfree"
Message-Id: <3qlPrt5jf7z9t3t@ozlabs.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <563C7B7A.2080403@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>, Ian Munsie <imunsie@au1.ibm.com>, Michael Neuling <mikey@neuling.org>, linuxppc-dev@lists.ozlabs.org
Cc: Julia Lawall <julia.lawall@lip6.fr>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Fri, 2015-06-11 at 10:05:46 UTC, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 6 Nov 2015 11:00:23 +0100
> 
> The kfree() function tests whether its argument is NULL and then
> returns immediately. Thus the test around the call is not needed.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> Reviewed-by: Andrew Donnellan <andrew.donnellan@au1.ibm.com>
> Acked-by: Ian Munsie <imunsie@au1.ibm.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/1050e689a63baffdadcd33498c

cheers
