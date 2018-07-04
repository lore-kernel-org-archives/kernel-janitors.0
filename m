From: Florian Fainelli <f.fainelli@gmail.com>
Date: Wed, 04 Jul 2018 19:55:28 +0000
Subject: Re: [PATCH] net: dsa: bcm_sf2: remove redundant variable off
Message-Id: <A8CC1885-AA89-4A72-92B6-AF4578559984@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180704065436.13719-1-colin.king@canonical.com> <20180704142520.GD12405@lunn.ch>
In-Reply-To: <20180704142520.GD12405@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Lunn <andrew@lunn.ch>, Colin King <colin.king@canonical.com>
Cc: Vivien Didelot <vivien.didelot@savoirfairelinux.com>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On July 4, 2018 4:25:20 PM GMT+02:00, Andrew Lunn <andrew@lunn.ch> wrote:
>Hi Florian
>
>I this a bug? It seems to be a result of moving to
>b53_disable_port() in f86ad77faf.
>
>Before you would handle the CPU port differently than a normal
>port. After this change, there is no difference?

This looks like a big indeed, I will check that next week.

-- 
Florian
