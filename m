From: Jakub Kicinski <kuba@kernel.org>
Date: Wed, 04 Nov 2020 01:50:16 +0000
Subject: Re: [PATCH] net: dev_ioctl: remove redundant initialization of variable err
Message-Id: <20201103175016.0070fe48@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201102121615.695196-1-colin.king@canonical.com>
In-Reply-To: <20201102121615.695196-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon,  2 Nov 2020 12:16:15 +0000 Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable err is being initialized with a value that is never read
> and it is being updated later with a new value.  The initialization is
> redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
