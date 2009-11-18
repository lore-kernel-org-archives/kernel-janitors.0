From: David Miller <davem@davemloft.net>
Date: Wed, 18 Nov 2009 18:49:42 +0000
Subject: Re: [PATCH 6/16] drivers/net/pppol2tp.c: remove exceptional & on
Message-Id: <20091118.104942.27855290.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0911181922240.20943@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0911181922240.20943@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: julia@diku.dk
Cc: jchapman@katalix.com, netdev@vger.kernel.org, arnd@arndb.de, joe@perches.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>
Date: Wed, 18 Nov 2009 19:22:44 +0100 (CET)

> In this file, function names are otherwise used as pointers without &.
 ...
> Signed-off-by: Julia Lawall <julia@diku.dk>

Applied.
