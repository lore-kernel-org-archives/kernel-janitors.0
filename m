From: Jakub Kicinski <kuba@kernel.org>
Date: Sat, 09 May 2020 05:48:39 +0000
Subject: Re: [PATCH] net: lio_core: remove redundant assignment to variable tx_done
Message-Id: <20200508224839.050d90b1@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200508225810.484331-1-colin.king@canonical.com>
In-Reply-To: <20200508225810.484331-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Derek Chickles <dchickles@marvell.com>, Satanand Burla <sburla@marvell.com>, Felix Manlunas <fmanlunas@marvell.com>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri,  8 May 2020 23:58:10 +0100 Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable tx_done is being assigned with a value that is never read
> as the function returns a few statements later.  The assignment is
> redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thank you!
