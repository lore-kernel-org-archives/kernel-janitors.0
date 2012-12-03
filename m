From: David Miller <davem@davemloft.net>
Date: Mon, 03 Dec 2012 01:33:09 +0000
Subject: Re: [PATCH 1/6] bna: remove useless calls to memset().
Message-Id: <20121202.203309.1858145449914043352.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1354416022-20189-1-git-send-email-tipecaml@gmail.com>
	<1354416022-20189-2-git-send-email-tipecaml@gmail.com>
In-Reply-To: <1354416022-20189-2-git-send-email-tipecaml@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: tipecaml@gmail.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, rmody@brocade.com, netdev@vger.kernel.org

From: Cyril Roelandt <tipecaml@gmail.com>
Date: Sun,  2 Dec 2012 03:40:17 +0100

> These calls are followed by calls to memcpy() on the same memory area, so they
> can safely be removed.
> 
> Signed-off-by: Cyril Roelandt <tipecaml@gmail.com>

Applied, thanks.
