From: David Miller <davem@davemloft.net>
Date: Fri, 23 Dec 2011 21:52:32 +0000
Subject: Re: [patch] usb: pegasus: cleanup a couple conditions
Message-Id: <20111223.165232.1727326086882956386.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111223104436.GA8592@elgon.mountain>
In-Reply-To: <20111223104436.GA8592@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: petkan@users.sourceforge.net, gregkh@suse.de, linux-usb@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 23 Dec 2011 13:44:36 +0300

> We recently made loopback a bool type instead of an int, so the bitwise
> AND is redundent.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
