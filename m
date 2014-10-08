From: David Miller <davem@davemloft.net>
Date: Wed, 08 Oct 2014 20:08:44 +0000
Subject: Re: [patch 1/2 v2 -next] cxgb4: potential shift wrapping bug
Message-Id: <20141008.160844.421959946480563087.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20141003.154629.555967384624529643.davem@davemloft.net>
	<20141008134317.GA12036@mwanda>
In-Reply-To: <20141008134317.GA12036@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: hariprasad@chelsio.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 8 Oct 2014 16:43:17 +0300

> "cntxt_id" is an unsigned int but "udb" is a u64 so there is a potential
> shift wrapping bug here.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
