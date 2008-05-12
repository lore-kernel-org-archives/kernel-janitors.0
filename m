From: David Miller <davem@davemloft.net>
Date: Mon, 12 May 2008 22:44:04 +0000
Subject: Re: [PATCH 6/6, revised] drivers/net/pppol2tp.c: remove null
Message-Id: <20080512.154404.127453165.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0805122220350.27663@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0805122220350.27663@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: julia@diku.dk
Cc: netdev@vger.kernel.org, jchapman@katalix.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>
Date: Mon, 12 May 2008 22:21:25 +0200 (CEST)

> If session is NULL, it is not possible to access its name field.  So I have
> split apart the printing of the error message to drop the printing of the
> name field in this case.
> 
> The macro PRINTK actually only evaluates its arguments starting with the
> third one if the bitwise conjunction of the first two is non-zero.
> Normally, this conjunction would only be non-zero if debugging mode were
> turned on, but when session is NULL, the first argument in both the old and
> new code is -1, and thus the bitwise conjunction is true.  Perhaps a
> different strategy is desired, such as using tunnel->debug, which
> session->debug is initialized to, but tunnel can also be NULL, so this does
> not completely solve the problem.
 ...
> Signed-off-by: Julia Lawall <julia@diku.dk>

Applied, thanks.
