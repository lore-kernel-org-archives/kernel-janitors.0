From: David Miller <davem@davemloft.net>
Date: Wed, 22 Jan 2014 01:03:11 +0000
Subject: Re: [patch] rxrpc: out of bound read in debug code
Message-Id: <20140121.170311.1774535393379603151.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140120102859.GA14233@elgon.mountain>
In-Reply-To: <20140120102859.GA14233@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 20 Jan 2014 13:28:59 +0300

> Smatch complains because we are using an untrusted index into the
> rxrpc_acks[] array.  It's just a read and it's only in the debug code,
> but it's simple enough to add a check and fix it.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks Dan.
