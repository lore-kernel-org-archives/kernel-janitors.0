From: David Miller <davem@davemloft.net>
Date: Sun, 04 Oct 2020 00:09:14 +0000
Subject: Re: [PATCH][next] net: phy: dp83869: fix unsigned comparisons against less than zero values
Message-Id: <20201003.170914.694797784124863729.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201002165422.94328-1-colin.king@canonical.com>
In-Reply-To: <20201002165422.94328-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: andrew@lunn.ch, hkallweit1@gmail.com, kuba@kernel.org, dmurphy@ti.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Fri,  2 Oct 2020 17:54:22 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently the comparisons of u16 integers value and sopass_val with
> less than zero for error checking is always false because the values
> are unsigned. Fix this by making these variables int.  This does not
> affect the shift and mask operations performed on these variables
> 
> Addresses-Coverity: ("Unsigned compared against zero")
> Fixes: 49fc23018ec6 ("net: phy: dp83869: support Wake on LAN")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thank you.
