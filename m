From: David Miller <davem@davemloft.net>
Date: Wed, 06 Jan 2016 20:28:35 +0000
Subject: Re: [patch -next] fsl/fman: fix the pause_time test
Message-Id: <20160106.152835.1032541049238097795.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160106095809.GC23185@mwanda>
In-Reply-To: <20160106095809.GC23185@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: igal.liberman@freescale.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 6 Jan 2016 12:58:09 +0300

> pause_time is unsigned so it can't be less than zero.  The bug means
> that we allow invalid pause-times.
> 
> Fixes: 57ba4c9b56d8 ('fsl/fman: Add FMan MAC support')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
