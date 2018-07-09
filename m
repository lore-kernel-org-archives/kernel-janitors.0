From: Florian Fainelli <f.fainelli@gmail.com>
Date: Mon, 09 Jul 2018 16:10:00 +0000
Subject: Re: [PATCH] net: dsa: bcm_sf2: remove redundant variable off
Message-Id: <2f4bab8e-6f4f-cec1-77cc-4caeb95ebf2f@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180704065436.13719-1-colin.king@canonical.com>
 <20180704142520.GD12405@lunn.ch>
In-Reply-To: <20180704142520.GD12405@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Lunn <andrew@lunn.ch>, Colin King <colin.king@canonical.com>
Cc: Vivien Didelot <vivien.didelot@savoirfairelinux.com>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Andrew,

On 07/04/2018 07:25 AM, Andrew Lunn wrote:
> Hi Florian
> 
> I this a bug? It seems to be a result of moving to
> b53_disable_port() in f86ad77faf.
> 
> Before you would handle the CPU port differently than a normal
> port. After this change, there is no difference?

This is not a bug actually but it is not obvious because there was a
separate definition added in bcm_sf2_regs.h for port 8 named
CORE_IMP_CTL. The logic in b53_regs.h is:

#define B53_PORT_CTRL(i)                (0x00 + (i))

and due to the memory map used in bcm_sf2, that would translate into:

8 << 2 = 0x20 which is correct here and matches the definition of
CORE_IMP_CTL.

in fact, the new code is more correct because any port could be a DSA
CPU port, whereas before we assumed that port 8 = CPU port, which is
not necessarily true.

Thanks!
-- 
Florian
