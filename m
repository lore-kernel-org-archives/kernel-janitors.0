From: Divy Le Ray <divy@chelsio.com>
Date: Sun, 15 Feb 2009 21:32:07 +0000
Subject: Re: [PATCH 17/43] drivers/net/cxgb3: fix sparse warnings: fix signedness
Message-Id: <499889D7.2070305@chelsio.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090214210940.23489.95001.stgit@vmbox.hanneseder.net> <20090214211612.23489.60993.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090214211612.23489.60993.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hannes Eder <hannes@hanneseder.net>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hannes Eder wrote:
> Fix this sparse warning:
>   drivers/net/cxgb3/ael1002.c:1010:60: warning: incorrect type in argument 4 (different signedness)
>
> Signed-off-by: Hannes Eder <hannes@hanneseder.net>
>   
Acked-by: Divy Le Ray <divy@chelsio.com>
