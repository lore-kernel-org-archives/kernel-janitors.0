From: David Miller <davem@davemloft.net>
Date: Wed, 02 Jan 2008 03:31:12 +0000
Subject: Re: [PATCH] net/x25: Add missing x25_neigh_put
Message-Id: <20080101.193112.20706369.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0801012206090.19803@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0801012206090.19803@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: julia@diku.dk
Cc: eis@baty.hanse.de, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>
Date: Tue, 1 Jan 2008 22:07:04 +0100 (CET)

> The function x25_get_neigh increments a reference count.  At the point of
> the second goto out, the result of calling x25_get_neigh is only stored in
> a local variable, and thus no one outside the function will be able to
> decrease the reference count.  Thus, x25_neigh_put should be called before
> the return in this case.

Patch applied, thanks.
