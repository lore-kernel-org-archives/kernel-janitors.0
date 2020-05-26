From: David Miller <davem@davemloft.net>
Date: Tue, 26 May 2020 00:53:06 +0000
Subject: Re: [PATCH net-next] ipv4: potential underflow in compat_ip_setsockopt()
Message-Id: <20200525.175306.1437742984438170741.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200523174648.GA105146@mwanda>
In-Reply-To: <20200523174648.GA105146@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: viro@zeniv.linux.org.uk, kuznet@ms2.inr.ac.ru, yoshfuji@linux-ipv6.org, kuba@kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 23 May 2020 20:46:48 +0300

> The value of "n" is capped at 0x1ffffff but it checked for negative
> values.  I don't think this causes a problem but I'm not certain and
> it's harmless to prevent it.
> 
> Fixes: 2e04172875c9 ("ipv4: do compat setsockopt for MCAST_MSFILTER directly")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
