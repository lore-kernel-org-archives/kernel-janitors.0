From: David Miller <davem@davemloft.net>
Date: Mon, 06 May 2013 20:17:26 +0000
Subject: Re: [patch 1/2] tipc: add a bounds check in link_recv_changeover_msg()
Message-Id: <20130506.161726.1012915897561757486.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130506182840.GA21347@elgon.mountain>
In-Reply-To: <20130506182840.GA21347@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: jon.maloy@ericsson.com, allan.stephens@windriver.com, netdev@vger.kernel.org, tipc-discussion@lists.sourceforge.net, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 6 May 2013 21:28:41 +0300

> The bearer_id here comes from skb->data and it can be a number from 0 to
> 7.  The problem is that the ->links[] array has only 2 elements so I
> have added a range check.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
