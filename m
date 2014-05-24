From: David Miller <davem@davemloft.net>
Date: Sat, 24 May 2014 18:01:51 +0000
Subject: Re: [patch] qlcnic: info leak in qlcnic_dcb_peer_app_info()
Message-Id: <20140524.140151.1688847033053939933.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140523163721.GA14067@mwanda>
In-Reply-To: <20140523163721.GA14067@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: shahed.shaikh@qlogic.com, sucheta.chakraborty@qlogic.com, Dept-HSGLinuxNICDev@qlogic.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 23 May 2014 19:37:21 +0300

> This function is called from dcbnl_build_peer_app().  The "info"
> struct isn't initialized at all so we disclose 2 bytes of uninitialized
> stack data.  We should clear it before passing it to the user.
> 
> Fixes: 48365e485275 ('qlcnic: dcb: Add support for CEE Netlink interface.')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> This is a static analysis patch, and I am not familiar with this code.
> We may want to put some useful information here, to go with the
> app_count.

I've applied this and queued it up for -stable, thanks Dan.
