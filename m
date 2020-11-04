From: Jakub Kicinski <kuba@kernel.org>
Date: Wed, 04 Nov 2020 01:52:43 +0000
Subject: Re: [PATCH] octeontx2-pf: Fix sizeof() mismatch
Message-Id: <20201103175243.1f167807@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201102134601.698436-1-colin.king@canonical.com>
In-Reply-To: <20201102134601.698436-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Sunil Goutham <sgoutham@marvell.com>, Geetha sowjanya <gakula@marvell.com>, hariprasad <hkelam@marvell.com>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon,  2 Nov 2020 13:46:01 +0000 Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> An incorrect sizeof() is being used, sizeof(u64 *) is not correct,
> it should be sizeof(*sq->sqb_ptrs).
> 
> Fixes: caa2da34fd25 ("octeontx2-pf: Initialize and config queues")
> Addresses-Coverity: ("Sizeof not portable (SIZEOF_MISMATCH)")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, but to net-next. The driver depends on 64BIT so this is
harmless.
