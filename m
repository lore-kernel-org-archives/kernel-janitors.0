From: David Miller <davem@davemloft.net>
Date: Mon, 01 May 2017 02:42:59 +0000
Subject: Re: [PATCH net-next] lwtunnel: fix error path in lwtunnel_fill_encap()
Message-Id: <20170430.224259.758720932636802809.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170428130347.53hagk77wh6scmcs@mwanda>
In-Reply-To: <20170428130347.53hagk77wh6scmcs@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: bianpan2016@163.com, roopa@cumulusnetworks.com, dsa@cumulusnetworks.com, rshearma@brocade.com, tom@herbertland.com, david.lebrun@uclouvain.be, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 28 Apr 2017 16:03:48 +0300

> We recently added a check to see if nla_nest_start() fails.  There are
> two issues with that.  First, if it fails then I don't think we should
> call nla_nest_cancel().  Second, it's slightly convoluted but the
> current code returns success but we should return -EMSGSIZE instead.
> 
> Fixes: a50fe0ffd76f ("lwtunnel: check return value of nla_nest_start")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
