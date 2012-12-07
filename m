From: David Miller <davem@davemloft.net>
Date: Fri, 07 Dec 2012 19:40:54 +0000
Subject: Re: [patch v2] bridge: make buffer larger in br_setlink()
Message-Id: <20121207.144054.818881635723246698.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121207093107.GA2996@casper.infradead.org>
	<20121207111045.GA9676@elgon.mountain>
In-Reply-To: <20121207111045.GA9676@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: tgraf@suug.ch, netdev@vger.kernel.org, shemminger@vyatta.com, bridge@lists.linux-foundation.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 7 Dec 2012 14:10:46 +0300

> We pass IFLA_BRPORT_MAX to nla_parse_nested() so we need
> IFLA_BRPORT_MAX + 1 elements.  Also Smatch complains that we read past
> the end of the array when in br_set_port_flag() when it's called with
> IFLA_BRPORT_FAST_LEAVE.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
