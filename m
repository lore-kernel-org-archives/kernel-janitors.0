From: David Miller <davem@davemloft.net>
Date: Wed, 04 Jul 2018 13:40:17 +0000
Subject: Re: [PATCH] net: alteon: acenic: remove redundant pointer rxdesc
Message-Id: <20180704.224017.1182444162221613940.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180704070135.13938-1-colin.king@canonical.com>
In-Reply-To: <20180704070135.13938-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: jes@trained-monkey.org, linux-acenic@sunsite.dk, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Wed,  4 Jul 2018 08:01:35 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> Pointer rxdesc is being assigned but is never used hence it is
> redundant and can be removed.
> 
> Cleans up clang warning:
> warning: variable 'rxdesc' set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
