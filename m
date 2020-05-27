From: Florian Fainelli <f.fainelli@gmail.com>
Date: Wed, 27 May 2020 16:23:53 +0000
Subject: Re: [PATCH] net: dsa: b53: remove redundant premature assignment to new_pvid
Message-Id: <53bdf3f4-1a72-956c-8c32-424ad42c02b5@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200527120129.172676-1-colin.king@canonical.com>
In-Reply-To: <20200527120129.172676-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org



On 5/27/2020 5:01 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Variable new_pvid is being assigned with a value that is never read,
> the following if statement updates new_pvid with a new value in both
> of the if paths. The assignment is redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
