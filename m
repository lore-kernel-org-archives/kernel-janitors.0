From: David Miller <davem@davemloft.net>
Date: Wed, 08 Oct 2014 20:08:50 +0000
Subject: Re: [patch 2/2 v2 -next] cxgb4: clean up a type issue
Message-Id: <20141008.160850.1626104412481474827.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20141003.154629.555967384624529643.davem@davemloft.net>
	<20141008134434.GB12036@mwanda>
In-Reply-To: <20141008134434.GB12036@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: hariprasad@chelsio.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 8 Oct 2014 16:44:34 +0300

> The tx_desc struct holds 8 __be64 values.  The original code in
> ring_tx_db() took a tx_desc pointer then casted it to an int pointer and
> then casted it to a u64 pointer.  It was confusing and triggered some
> static checker warnings.
> 
> I have changed the cxgb_pio_copy() function to only take tx_desc
> pointers.  This isn't really a loss of flexibility because anything else
> was buggy to begin with.
> 
> I also removed the casting on the destination pointer since that was
> unnecessary and a bit messy.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
