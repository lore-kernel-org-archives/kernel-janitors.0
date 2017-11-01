From: David Miller <davem@davemloft.net>
Date: Wed, 01 Nov 2017 12:30:46 +0000
Subject: Re: [PATCH] net: thunderx: remove a couple of redundant assignments
Message-Id: <20171101.213046.1800118728866748105.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171031143755.26021-1-colin.king@canonical.com>
In-Reply-To: <20171031143755.26021-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

From: Colin King <colin.king@canonical.com>
Date: Tue, 31 Oct 2017 14:37:55 +0000

> From: Colin Ian King <colin.king@canonical.com>
> 
> The assignment to pointer msg is redundant as it is never read, so
> remove msg.  Also remove the first assignment to qset as this is not
> read before the next re-assignment of a new value to qset in the
> for-loop. Cleans up two clang warnings:
> 
> drivers/net/ethernet/cavium/thunder/nic_main.c:589:2: warning: Value
> stored to 'msg' is never read
> drivers/net/ethernet/cavium/thunder/nic_main.c:611:2: warning: Value
> stored to 'qset' is never read
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
