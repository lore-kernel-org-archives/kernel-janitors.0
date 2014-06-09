From: Jeremy Kerr <jk@ozlabs.org>
Date: Mon, 09 Jun 2014 23:09:23 +0000
Subject: Re: [patch] powerpc/spufs: remove duplicate SPUFS_CNTL_MAP_SIZE define
Message-Id: <53963EA3.4050400@ozlabs.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140609151917.GM9600@mwanda>
In-Reply-To: <20140609151917.GM9600@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: cbe-oss-dev@lists.ozlabs.org, Arnd Bergmann <arnd@arndb.de>, kernel-janitors@vger.kernel.org, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org

Hi Dan,

> The SPUFS_CNTL_MAP_SIZE define is cut and pasted twice so we can delete
> the second instance.

Looks good to me.

Acked-by: Jeremy Kerr <jk@ozlabs.org>

Cheers,


Jeremy
