From: David Miller <davem@davemloft.net>
Date: Thu, 01 Jun 2017 16:12:58 +0000
Subject: Re: [PATCH][net-next] net: dsa: make function ksz_rcv static
Message-Id: <20170601.121258.1089374239881121559.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170601122242.14341-1-colin.king@canonical.com>
In-Reply-To: <20170601122242.14341-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: Woojung.Huh@microchip.com, UNGLinuxDriver@microchip.com, andrew@lunn.ch, vivien.didelot@savoirfairelinux.com, f.fainelli@gmail.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Thu,  1 Jun 2017 13:22:42 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> function ksz_rcv can be made static as it does not need to be
> in global scope. Reformat arguments to make it checkpatch warning
> free too.
> 
> Cleans up sparse warning: "symbol 'ksz_rcv' was not declared. Should
> it be static?"
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
