From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 04 Aug 2016 07:02:35 +0000
Subject: Re: [patch] ppc/cell: missing error code in spufs_mkgang()
Message-Id: <2833167.fj71jLNsZj@wuerfel>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160804053703.GN775@mwanda>
In-Reply-To: <20160804053703.GN775@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jeremy Kerr <jk@ozlabs.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, kernel-janitors@vger.kernel.org

On Thursday, August 4, 2016 8:37:03 AM CEST Dan Carpenter wrote:
> We should return -ENOMEM if alloc_spu_gang() fails.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 

Acked-by: Arnd Bergmann <arnd@arndb.de>
