From: David Miller <davem@davemloft.net>
Date: Mon, 18 Feb 2019 20:08:36 +0000
Subject: Re: [PATCH] net/mlx4_en: fix spelling mistake: "quiting" -> "quitting"
Message-Id: <20190218.120836.1419708231583986821.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190217230331.18678-1-colin.king@canonical.com>
In-Reply-To: <20190217230331.18678-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: tariqt@mellanox.com, netdev@vger.kernel.org, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Sun, 17 Feb 2019 23:03:31 +0000

> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in a en_err error message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thanks Colin.

And I agree that this doesn't really deserve a Fixes: tag.

Fixes: tags should really be for changes that introduce truly
functional bugs.

And that could even be applied in this case _iff_ the string
was essential in some way for userland tools which parse the
output or similar.  But that is not the case here.

Anyways, thanks.
