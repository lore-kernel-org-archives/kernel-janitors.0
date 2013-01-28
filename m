From: David Miller <davem@davemloft.net>
Date: Mon, 28 Jan 2013 01:39:00 +0000
Subject: Re: [patch] irda: buffer overflow in irnet_ctrl_read()
Message-Id: <20130127.203900.315969902013911354.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130125064056.GA4882@elgon.mountain>
In-Reply-To: <20130125064056.GA4882@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: samuel@sortiz.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 25 Jan 2013 09:40:56 +0300

> The comments here say that the /* Max event is 61 char */ but in 2003 we
> changed the event format and now the max event size is 75.  The longest
> event is:
> 
> 	"Discovered %08x (%s) behind %08x {hints %02X-%02X}\n",
>          12345678901    23  456789012    34567890    1    2 3
> 	            +8    +21        +8          +2   +2     +1
>          = 75 characters.
> 
> There was a check to return -EOVERFLOW if the user gave us a "count"
> value that was less than 64.  Raising it to 75 might break backwards
> compatability.  Instead I removed the check and now it returns a
> truncated string if "count" is too low.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied to net-next, thanks.
