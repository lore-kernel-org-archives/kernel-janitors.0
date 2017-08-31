From: Michael Ellerman <patch-notifications@ellerman.id.au>
Date: Thu, 31 Aug 2017 11:36:05 +0000
Subject: Re: powerpc: remapping too much memory
Message-Id: <3xjgLF5Q9Lz9t2W@ozlabs.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20170628114907.kf3t65mrdbq7rsfm@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Scott Wood <oss@buserror.net>
Cc: kernel-janitors@vger.kernel.org, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org

On Wed, 2017-06-28 at 11:49:07 UTC, Dan Carpenter wrote:
> There is a cut and paste error here so we use "sizeof(struct mpc83xx_pmc)"
> to remap the memory for "clock_regs".  That sizeof() is 20 bytes and we
> only need to remap 12 bytes.  It presumably doesn't affect run time too
> much...
> 
> I changed them to both use "sizeof(*variable_name)" because that's the
> prefered kernel style these days.
> 
> Fixes: d49747bdfb2d ("powerpc/mpc83xx: Power Management support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/c65540453e150844367ffe98e45d51

cheers
