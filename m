From: David Miller <davem@davemloft.net>
Date: Fri, 05 Jun 2020 20:11:38 +0000
Subject: Re: [PATCH net] ethtool: linkinfo: remove an unnecessary NULL check
Message-Id: <20200605.131138.784441206945490177.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200605110413.GF978434@mwanda>
In-Reply-To: <20200605110413.GF978434@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: kuba@kernel.org, mkubecek@suse.cz, f.fainelli@gmail.com, andrew@lunn.ch, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 5 Jun 2020 14:04:13 +0300

> This code generates a Smatch warning:
> 
>     net/ethtool/linkinfo.c:143 ethnl_set_linkinfo()
>     warn: variable dereferenced before check 'info' (see line 119)
> 
> Fortunately, the "info" pointer is never NULL so the check can be
> removed.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
