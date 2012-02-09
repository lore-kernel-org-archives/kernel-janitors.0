From: David Miller <davem@davemloft.net>
Date: Thu, 09 Feb 2012 20:43:41 +0000
Subject: Re: [patch] bna: fix error handling of bnad_get_flash_partition_by_offset()
Message-Id: <20120209.154341.1329684491104733307.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120209104934.GC5540@elgon.mountain>
In-Reply-To: <20120209104934.GC5540@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: rmody@brocade.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 9 Feb 2012 13:49:34 +0300

> The current error handling doesn't work because we flash_part is a u32
> so the checks for negative error codes don't work.  I considered making
> things signed but I don't know the hardware enough to say if that's a
> problem.  Really, we don't use the error codes so just returning zero
> for all problems is fine.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Looks good, applied, thanks Dan.
