From: David Miller <davem@davemloft.net>
Date: Fri, 07 Feb 2014 04:06:31 +0000
Subject: Re: [patch] tg3: cleanup an error path in tg3_phy_reset_5703_4_5()
Message-Id: <20140206.200631.1329672470949197117.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140205132920.GE800@elgon.mountain>
In-Reply-To: <20140205132920.GE800@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: nsujir@broadcom.com, mchan@broadcom.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 5 Feb 2014 16:29:21 +0300

> In the original code, if tg3_readphy() fails then it does an unnecessary
> check to verify "err" is still zero and then returns -EBUSY.
> 
> My static checker complains about the unnecessary "if (!err)" check and
> anyway it is better to propagate the -EBUSY error code from
> tg3_readphy() instead of hard coding it here.  And really the original
> code is confusing to look at.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
