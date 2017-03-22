From: David Miller <davem@davemloft.net>
Date: Wed, 22 Mar 2017 00:43:47 +0000
Subject: Re: [PATCH] bna: integer overflow bug in debugfs
Message-Id: <20170321.174347.845428848919617726.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170317205234.GA2888@mwanda>
In-Reply-To: <20170317205234.GA2888@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: rasesh.mody@cavium.com, kgudipat@brocade.com, sudarsana.kalluru@cavium.com, Dept-GELinuxNICDev@cavium.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 17 Mar 2017 23:52:35 +0300

> We could allocate less memory than intended because we do:
> 
> 	bnad->regdata = kzalloc(len << 2, GFP_KERNEL);
> 
> The shift can overflow leading to a crash.  This is debugfs code so the
> impact is very small.
> 
> Fixes: 7afc5dbde091 ("bna: Add debugfs interface.")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
