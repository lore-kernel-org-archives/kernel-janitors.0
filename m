From: David Miller <davem@davemloft.net>
Date: Fri, 27 Feb 2015 20:59:18 +0000
Subject: Re: [patch 1/2] rocker: add a check for NULL in rocker_probe_ports()
Message-Id: <20150227.155918.1581047845198975426.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150225133532.GU19745@mwanda>
In-Reply-To: <20150225133532.GU19745@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: jiri@resnulli.us, sfeldma@gmail.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 25 Feb 2015 16:35:32 +0300

> Make sure kmalloc() succeeds.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
