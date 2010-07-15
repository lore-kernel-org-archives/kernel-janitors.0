From: David Miller <davem@davemloft.net>
Date: Thu, 15 Jul 2010 00:53:28 +0000
Subject: Re: [PATCH] wd: fix memory leak
Message-Id: <20100714.175328.71103110.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1279020192-9484-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1279020192-9484-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: segooon@gmail.com
Cc: kernel-janitors@vger.kernel.org, joe@perches.com, netdev@vger.kernel.org

From: Kulikov Vasiliy <segooon@gmail.com>
Date: Tue, 13 Jul 2010 15:23:12 +0400

> Unmap mapped IO in wd_probe1() if register_netdev() failed.
> 
> Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>

Applied.
