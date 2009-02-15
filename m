From: Divy Le Ray <divy@chelsio.com>
Date: Sun, 15 Feb 2009 21:30:34 +0000
Subject: Re: [PATCH 16/43] drivers/net/cxgb3: fix sparse warning: symbol shadows
Message-Id: <4998897A.3030904@chelsio.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090214210940.23489.95001.stgit@vmbox.hanneseder.net> <20090214211557.23489.75670.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090214211557.23489.75670.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hannes Eder <hannes@hanneseder.net>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hannes Eder wrote:
> Impact: Move variable declaration as close to usage as possible.
>
> Fix this sparse warning:
>   drivers/net/cxgb3/cxgb3_main.c:1586:21: warning: symbol 'cap' shadows an earlier one
>
> Signed-off-by: Hannes Eder <hannes@hanneseder.net>
>   
Acked-by: Divy Le Ray <divy@chelsio.com>
