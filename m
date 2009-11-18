From: David Miller <davem@davemloft.net>
Date: Wed, 18 Nov 2009 18:47:28 +0000
Subject: Re: [PATCH 1/16] drivers/net/atl1c: remove exceptional & on
Message-Id: <20091118.104728.238907669.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0911181920010.20943@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0911181920010.20943@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: julia@diku.dk
Cc: jcliburn@gmail.com, chris.snook@gmail.com, jie.yang@atheros.com, atl1-devel@lists.sourceforge.net, arnd@arndb.de, joe@perches.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>
Date: Wed, 18 Nov 2009 19:20:24 +0100 (CET)

Please don't forget to CC: netdev on networking patches.

> In this file, function names are otherwise used as pointers without &.
 ...
> Signed-off-by: Julia Lawall <julia@diku.dk>

Applied to net-next-2.6 thanks.
