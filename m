From: Linus WALLEIJ <linus.walleij@stericsson.com>
Date: Wed, 11 Aug 2010 11:22:36 +0000
Subject: RE: [PATCH 2/5] drivers/dma: Return -ENOMEM on memory allocation
Message-Id: <CEE6BB42CAD6E947908279175AF8470A0262F4A8EF@EXDCVYMBSTM006.EQ1STM.local>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1008111210490.8669@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1008111210490.8669@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

> From: Julia Lawall <julia@diku.dk>
> 
> In this code, 0 is returned on memory allocation failure, even though
> other failures return -ENOMEM or other similar values.

Acked-by: Linus Walleij <linus.walleij@stericsson.com>

Thanks for fixing this Julia!

Yours,
Linus Walleij
