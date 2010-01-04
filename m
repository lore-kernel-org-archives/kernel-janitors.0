From: David Miller <davem@davemloft.net>
Date: Mon, 04 Jan 2010 05:44:12 +0000
Subject: Re: [PATCH 4/5] drivers/net/can: Correct NULL test
Message-Id: <20100103.214412.50599561.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0912272227290.20548@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0912272227290.20548@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: julia@diku.dk
Cc: urs.thuermann@volkswagen.de, oliver.hartkopp@volkswagen.de, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>
Date: Sun, 27 Dec 2009 22:27:44 +0100 (CET)

> From: Julia Lawall <julia@diku.dk>
> 
> Test the just-allocated value for NULL rather than some other value.
 ...
> Signed-off-by: Julia Lawall <julia@diku.dk>

Applied.
