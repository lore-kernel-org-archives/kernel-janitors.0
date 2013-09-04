From: David Miller <davem@davemloft.net>
Date: Wed, 04 Sep 2013 17:08:13 +0000
Subject: Re: [patch v2] sfc: check for allocation failure
Message-Id: <20130904.130813.810425005355634326.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130903.224939.866623192858217581.davem@davemloft.net>
	<20130904150727.GA32327@elgon.mountain>
In-Reply-To: <20130904150727.GA32327@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: linux-net-drivers@solarflare.com, bhutchings@solarflare.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 4 Sep 2013 18:07:27 +0300

> It upsets static analyzers when we don't check for allocation failure.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> v2: rebased on latest linux-next

Applied, thanks Dan.

