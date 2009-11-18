From: David Miller <davem@davemloft.net>
Date: Wed, 18 Nov 2009 18:51:42 +0000
Subject: Re: [PATCH 10/16] drivers/net/via-rhine.c: remove exceptional & on
Message-Id: <20091118.105142.37705894.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0911181923340.20943@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0911181923340.20943@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: julia@diku.dk
Cc: rl@hellgate.ch, netdev@vger.kernel.org, arnd@arndb.de, joe@perches.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>
Date: Wed, 18 Nov 2009 19:23:53 +0100 (CET)

> In this file, function names are otherwise used as pointers without &.
 ...
> Signed-off-by: Julia Lawall <julia@diku.dk>

Applied.
