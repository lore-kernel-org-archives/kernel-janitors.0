From: Jakub Kicinski <kuba@kernel.org>
Date: Sat, 09 May 2020 05:49:08 +0000
Subject: Re: [PATCH][V2] net: tg3: tidy up loop, remove need to compute off with a multiply
Message-Id: <20200508224908.5c594f73@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200508231447.485241-1-colin.king@canonical.com>
In-Reply-To: <20200508231447.485241-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Siva Reddy Kallam <siva.kallam@broadcom.com>, Prashant Sreedharan <prashant@broadcom.com>, Michael Chan <mchan@broadcom.com>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat,  9 May 2020 00:14:47 +0100 Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently the value for 'off' is computed using a multiplication and
> a couple of statements later off is being incremented by len and
> this value is never read.  Clean up the code by removing the
> multiplication and just increment off by len on each iteration.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thank you!
