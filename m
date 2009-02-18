From: David Miller <davem@davemloft.net>
Date: Wed, 18 Feb 2009 01:27:15 +0000
Subject: Re: [PATCH 16/43] drivers/net/cxgb3: fix sparse warning: symbol
Message-Id: <20090217.172715.248316017.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090214210940.23489.95001.stgit@vmbox.hanneseder.net>
	<20090214211557.23489.75670.stgit@vmbox.hanneseder.net>
	<4998897A.3030904@chelsio.com>
In-Reply-To: <4998897A.3030904@chelsio.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: divy@chelsio.com
Cc: hannes@hanneseder.net, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Divy Le Ray <divy@chelsio.com>
Date: Sun, 15 Feb 2009 13:30:34 -0800

> Hannes Eder wrote:
> > Impact: Move variable declaration as close to usage as possible.
> >
> > Fix this sparse warning:
> >   drivers/net/cxgb3/cxgb3_main.c:1586:21: warning: symbol 'cap' shadows an earlier one
> >
> > Signed-off-by: Hannes Eder <hannes@hanneseder.net>
> >   
> Acked-by: Divy Le Ray <divy@chelsio.com>

Applied.
