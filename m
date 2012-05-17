From: David Miller <davem@davemloft.net>
Date: Thu, 17 May 2012 08:48:37 +0000
Subject: Re: [patch] isdn: remove duplicate NULL check
Message-Id: <20120517.044837.2251136486222452174.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120517065102.GC14660@elgon.mountain>
In-Reply-To: <20120517065102.GC14660@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: isdn@linux-pingi.de, dhowells@redhat.com, ext-phil.2.carmody@nokia.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 17 May 2012 09:51:02 +0300

> We test both "!skb_out" and "skb_out" here which is duplicative and
> causes a static checker warning.  I considered that the intent might
> have been to test "skb_in" but that's a valid pointer here.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks.
