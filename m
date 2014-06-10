From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 10 Jun 2014 07:55:06 +0000
Subject: Re: [patch] powerpc/spufs: remove duplicate SPUFS_CNTL_MAP_SIZE define
Message-Id: <4266625.8yXnFnBjUA@wuerfel>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140609151917.GM9600@mwanda>
In-Reply-To: <20140609151917.GM9600@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linuxppc-dev@lists.ozlabs.org
Cc: cbe-oss-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>, kernel-janitors@vger.kernel.org, Jeremy Kerr <jk@ozlabs.org>, Dan Carpenter <dan.carpenter@oracle.com>

On Monday 09 June 2014 18:19:17 Dan Carpenter wrote:
> The SPUFS_CNTL_MAP_SIZE define is cut and pasted twice so we can delete
> the second instance.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Arnd Bergmann <arnd@arndb.de>
