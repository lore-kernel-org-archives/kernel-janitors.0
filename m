From: David Miller <davem@davemloft.net>
Date: Fri, 09 Dec 2011 00:54:52 +0000
Subject: Re: [patch] sock_diag: off by one checks
Message-Id: <20111208.195452.1335073462061460670.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111208064938.GB16735@elgon.mountain>
In-Reply-To: <20111208064938.GB16735@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: xemul@parallels.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 8 Dec 2011 09:49:38 +0300

> These tests are off by one because sock_diag_handlers[] only has AF_MAX
> elements.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
