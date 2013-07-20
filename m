From: David Miller <davem@davemloft.net>
Date: Sat, 20 Jul 2013 00:37:33 +0000
Subject: Re: [patch] arcnet: cleanup sizeof parameter
Message-Id: <20130719.173733.2234107766353018238.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130719054805.GB9729@elgon.mountain>
In-Reply-To: <20130719054805.GB9729@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 19 Jul 2013 08:48:05 +0300

> This patch doesn't change the compiled code because ARC_HDR_SIZE is 4
> and sizeof(int) is 4, but the intent was to use the header size and not
> the sizeof the header size.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
