From: David Miller <davem@davemloft.net>
Date: Tue, 07 Feb 2012 18:39:57 +0000
Subject: Re: [patch] caif: remove duplicate initialization
Message-Id: <20120207.133957.864759536065326497.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120207072015.GB21047@elgon.mountain>
In-Reply-To: <20120207072015.GB21047@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: sjur.brandeland@stericsson.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 7 Feb 2012 10:20:15 +0300

> "priv" is initialized twice.  I kept the second one, because it is next
> to the check for NULL.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks Dan.
