From: David Miller <davem@davemloft.net>
Date: Thu, 18 Nov 2010 18:36:18 +0000
Subject: Re: [PATCH 4/4] net: caif: spi: fix potential NULL dereference
Message-Id: <20101118.103618.102550300.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1290104226-31428-1-git-send-email-segoon@openwall.com>
In-Reply-To: <1290104226-31428-1-git-send-email-segoon@openwall.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: segoon@openwall.com
Cc: kernel-janitors@vger.kernel.org, sjur.brandeland@stericsson.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

From: Vasiliy Kulikov <segoon@openwall.com>
Date: Thu, 18 Nov 2010 21:17:05 +0300

> alloc_netdev() is not checked here for NULL return value.  dev is
> check instead.  It might lead to NULL dereference of ndev.
> 
> Signed-off-by: Vasiliy Kulikov <segoon@openwall.com>
> ---
>  Compile tested.
>  Maybe dev is also must be checked here, but it looks like a trivial typo.

Definitely looks correct to me, applied, thanks!
