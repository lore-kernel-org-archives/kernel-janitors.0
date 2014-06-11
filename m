From: David Miller <davem@davemloft.net>
Date: Wed, 11 Jun 2014 22:40:54 +0000
Subject: Re: [patch] drivers: net: davinci_cpdma: double free on error
Message-Id: <20140611.154054.1561256983795392462.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140611081651.GB29572@mwanda>
In-Reply-To: <20140611081651.GB29572@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: olof@lixom.net, george.cherian@ti.com, christian.riesch@omicron.at, zonque@gmail.com, bigeasy@linutronix.de, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 11 Jun 2014 11:16:51 +0300

> We recently change the kzalloc() to devm_kzalloc() so freeing "ctlr"
> here could lead to a double free.
> 
> Fixes: e194312854ed ('drivers: net: davinci_cpdma: Convert kzalloc() to devm_kzalloc().')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
