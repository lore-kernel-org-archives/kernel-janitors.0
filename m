From: David Miller <davem@davemloft.net>
Date: Thu, 10 Jan 2013 07:53:49 +0000
Subject: Re: [patch] bnx2x: NULL dereference on error in debug code
Message-Id: <20130109.235349.2198186690882677527.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130108134213.GA23742@elgon.mountain>
In-Reply-To: <20130108134213.GA23742@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: eilong@broadcom.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 8 Jan 2013 16:42:14 +0300

> "vfop" is NULL here.  I've changed the debugging to not use it.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks Dan.
