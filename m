From: David Miller <davem@davemloft.net>
Date: Sat, 27 Feb 2016 19:06:48 +0000
Subject: Re: [patch] rocker: fix an error code
Message-Id: <20160227.140648.1005754769609600947.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160227113143.GA19177@mwanda>
In-Reply-To: <20160227113143.GA19177@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: jiri@resnulli.us, ying.xue@windriver.com, sfeldma@gmail.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 27 Feb 2016 14:31:43 +0300

> We intended to return PTR_ERR() here instead of 1.
> 
> Fixes: 1f9993f6825f ('rocker: fix a neigh entry leak issue')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks.
