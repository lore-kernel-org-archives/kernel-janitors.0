From: David Miller <davem@davemloft.net>
Date: Tue, 14 Jul 2015 22:42:23 +0000
Subject: Re: [patch] net/xen-netback: off by one in BUG_ON() condition
Message-Id: <20150714.154223.1886620792340165985.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150711222055.GA11708@mwanda>
In-Reply-To: <20150711222055.GA11708@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: ian.campbell@citrix.com, zoltan.kiss@citrix.com, wei.liu2@citrix.com, xen-devel@lists.xenproject.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sun, 12 Jul 2015 01:20:55 +0300

> The > should be >=.  I also added spaces around the '-' operations so
> the code is a little more consistent and matches the condition better.
> 
> Fixes: f53c3fe8dad7 ('xen-netback: Introduce TX grant mapping')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied and queued up for -stable, thanks.
