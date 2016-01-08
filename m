From: David Miller <davem@davemloft.net>
Date: Fri, 08 Jan 2016 18:24:55 +0000
Subject: Re: [patch] isdn: act200: fix MODULE_PARM_DESC() typo
Message-Id: <20160108.132455.1028143073335198363.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160108105850.GD32195@mwanda>
In-Reply-To: <20160108105850.GD32195@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: isdn@linux-pingi.de, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 8 Jan 2016 13:58:50 +0300

> There is no "membase", it was "act_port" that was intended.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
