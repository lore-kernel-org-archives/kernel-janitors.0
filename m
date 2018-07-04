From: Andrew Lunn <andrew@lunn.ch>
Date: Wed, 04 Jul 2018 14:25:20 +0000
Subject: Re: [PATCH] net: dsa: bcm_sf2: remove redundant variable off
Message-Id: <20180704142520.GD12405@lunn.ch>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180704065436.13719-1-colin.king@canonical.com>
In-Reply-To: <20180704065436.13719-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Vivien Didelot <vivien.didelot@savoirfairelinux.com>, Florian Fainelli <f.fainelli@gmail.com>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Florian

I this a bug? It seems to be a result of moving to
b53_disable_port() in f86ad77faf.

Before you would handle the CPU port differently than a normal
port. After this change, there is no difference?

      Andrew
