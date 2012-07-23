From: David Miller <davem@davemloft.net>
Date: Mon, 23 Jul 2012 08:00:09 +0000
Subject: Re: [patch] openvswitch: potential NULL deref in sample()
Message-Id: <20120723.010009.1045686375865776921.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120723074628.GA30892@elgon.mountain>
In-Reply-To: <20120723074628.GA30892-mgFCXtclrQlZLf2FXnZxJA@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org
Cc: dev-yBygre7rU0TnMu66kgdUjQ@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 23 Jul 2012 10:46:28 +0300

> If there is no OVS_SAMPLE_ATTR_ACTIONS set then "acts_list" is NULL and
> it leads to a NULL dereference when we call nla_len(acts_list).  This
> is a static checker fix, not something I have seen in testing.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks Dan.
