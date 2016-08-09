From: Michael Ellerman <patch-notifications@ellerman.id.au>
Date: Tue, 09 Aug 2016 11:26:44 +0000
Subject: Re: ppc/cell: missing error code in spufs_mkgang()
Message-Id: <3s7sS44Lmzz9t1Q@ozlabs.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20160804053703.GN775@mwanda>
References: <20160804053703.GN775@mwanda>
In-Reply-To: <20160804053703.GN775@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Jeremy Kerr <jk@ozlabs.org>
Cc: Arnd Bergmann <arnd@arndb.de>, kernel-janitors@vger.kernel.org, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org

On Thu, 2016-04-08 at 05:37:03 UTC, Dan Carpenter wrote:
> We should return -ENOMEM if alloc_spu_gang() fails.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Acked-by: Arnd Bergmann <arnd@arndb.de>

Applied to powerpc fixes, thanks.

https://git.kernel.org/powerpc/c/54a94fcf2f00c9deb9491d5ab2

cheers
