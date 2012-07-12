From: David Miller <davem@davemloft.net>
Date: Thu, 12 Jul 2012 14:50:43 +0000
Subject: Re: [patch -next] tcp: update a call to tcp_metric_set()
Message-Id: <20120712.075043.633614495014183744.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120712144637.GA24202@elgon.mountain>
In-Reply-To: <20120712144637.GA24202@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: kuznet@ms2.inr.ac.ru, jmorris@namei.org, yoshfuji@linux-ipv6.org, kaber@trash.net, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 12 Jul 2012 17:46:38 +0300

> We changed how the metrics were stored so RTAX_CWND needs to be changed
> to TCP_METRIC_CWND or it leads to write past the end of the
> ->tcpm_vals[] array.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Update your tree, this is already fixed.
