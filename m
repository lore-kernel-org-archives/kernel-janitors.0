From: David Miller <davem@davemloft.net>
Date: Mon, 06 May 2013 20:17:31 +0000
Subject: Re: [patch 2/2 v2] tipc: potential divide by zero in tipc_link_recv_fragment()
Message-Id: <20130506.161731.979339772027829304.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5187F8BD.1080900@cogentembedded.com>
	<20130506193117.GA11399@elgon.mountain>
In-Reply-To: <20130506193117.GA11399@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: jon.maloy@ericsson.com, allan.stephens@windriver.com, netdev@vger.kernel.org, tipc-discussion@lists.sourceforge.net, kernel-janitors@vger.kernel.org, sergei.shtylyov@cogentembedded.com

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 6 May 2013 22:31:17 +0300

> The worry here is that fragm_sz could be zero since it comes from
> skb->data.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
