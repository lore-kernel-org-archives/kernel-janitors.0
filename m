From: David Miller <davem@davemloft.net>
Date: Wed, 18 Feb 2009 01:39:32 +0000
Subject: Re: [PATCH 26/43] drivers/net/sfc: fix sparse warning: symbol
Message-Id: <20090217.173932.176817674.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090214210940.23489.95001.stgit@vmbox.hanneseder.net>
	<20090214213932.24377.94262.stgit@vmbox.hanneseder.net>
	<20090216003820.GO15266@solarflare.com>
In-Reply-To: <20090216003820.GO15266@solarflare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: bhutchings@solarflare.com
Cc: hannes@hanneseder.net, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Ben Hutchings <bhutchings@solarflare.com>
Date: Mon, 16 Feb 2009 00:38:20 +0000

> Hannes Eder wrote:
> > Impact: Move variable declaration as close to their usage as possible.
> > 
> > Fix this sparse warning:
> >   drivers/net/sfc/tenxpress.c:589:22: warning: symbol 'link_ok' shadows an earlier one
> >   drivers/net/sfc/tenxpress.c:575:30: originally declared here
> > 
> > Signed-off-by: Hannes Eder <hannes@hanneseder.net>
> Acked-by: Ben Hutchings <bhutchings@solarflare.com>

Applied.
