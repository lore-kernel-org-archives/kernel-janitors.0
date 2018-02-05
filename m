From: Andrew Lunn <andrew@lunn.ch>
Date: Mon, 05 Feb 2018 15:11:22 +0000
Subject: Re: [PATCH] net: phy-micrel: remove redundant initialization of pointer of_node
Message-Id: <20180205151122.GE11811@lunn.ch>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180205124759.19046-1-colin.king@canonical.com>
In-Reply-To: <20180205124759.19046-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Feb 05, 2018 at 12:47:59PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Pointer of_node is initialized with a value that is never read, of_node
> is later updated with a new value instead, hence the initialization is
> redundant and can be removed.  Also remove unused pointer dev and
> remove an empty line.
> 
> Cleans up clang warnings:
> drivers/net/phy/micrel.c:393:28: warning: Value stored to 'of_node'
> during its initialization is never read
> drivers/net/phy/micrel.c:532:28: warning: Value stored to 'of_node'
> during its initialization is never read
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Hi Colin

You probably need to repost once netdev re-opens.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
