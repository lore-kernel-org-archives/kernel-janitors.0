From: David Miller <davem@davemloft.net>
Date: Wed, 03 Oct 2012 02:41:42 +0000
Subject: Re: [patch] bnx2x: use strlcpy() to copy a string
Message-Id: <20121002.224142.1359092826405265517.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121002114746.GB1413@elgon.mountain>
In-Reply-To: <20121002114746.GB1413@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: eilong@broadcom.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 2 Oct 2012 14:47:46 +0300

> DRV_MODULE_VERSION is smaller than the ->version buffer so the memcpy()
> copies 1 byte past the end of the string.  It's not super harmful, but
> it makes the static checkers complain.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks Dan.
