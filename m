From: David Miller <davem@davemloft.net>
Date: Wed, 27 Oct 2010 19:24:21 +0000
Subject: Re: [PATCH 7/14] drivers/net/typhoon.c: delete double assignment
Message-Id: <20101027.122421.27814587.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1288088743-3725-1-git-send-email-julia@diku.dk>
	<1288088743-3725-8-git-send-email-julia@diku.dk>
In-Reply-To: <1288088743-3725-8-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: julia@diku.dk
Cc: dave@thedillows.org, kernel-janitors@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <julia@diku.dk>
Date: Tue, 26 Oct 2010 12:25:36 +0200

> From: Julia Lawall <julia@diku.dk>
> 
> Delete successive assignments to the same location.  The current definition
> does not initialize the respRing structure, which has the same type as the
> cmdRing structure, so initialize that one instead.
> 
> A simplified version of the semantic match that finds this problem is as
> follows: (http://coccinelle.lip6.fr/)
...
> Signed-off-by: Julia Lawall <julia@diku.dk>

Applied.
