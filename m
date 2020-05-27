From: David Miller <davem@davemloft.net>
Date: Wed, 27 May 2020 18:29:22 +0000
Subject: Re: [PATCH] net: dsa: b53: remove redundant premature assignment to new_pvid
Message-Id: <20200527.112922.1235278258146783650.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200527120129.172676-1-colin.king@canonical.com>
In-Reply-To: <20200527120129.172676-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: f.fainelli@gmail.com, andrew@lunn.ch, vivien.didelot@gmail.com, kuba@kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Wed, 27 May 2020 13:01:29 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> Variable new_pvid is being assigned with a value that is never read,
> the following if statement updates new_pvid with a new value in both
> of the if paths. The assignment is redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied to net-next, thanks.
