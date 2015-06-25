From: David Miller <davem@davemloft.net>
Date: Thu, 25 Jun 2015 09:13:24 +0000
Subject: Re: [patch -next] renesas: missing unlock on error path
Message-Id: <20150625.021324.1080187390583121565.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150624143254.GG1702@mwanda>
In-Reply-To: <20150624143254.GG1702@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: masaru.nagai.vx@renesas.com, sergei.shtylyov@cogentembedded.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 24 Jun 2015 17:32:54 +0300

> We need to unlock before returning here.
> 
> Fixes: a0d2f20650e8 ('Renesas Ethernet AVB PTP clock driver')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
