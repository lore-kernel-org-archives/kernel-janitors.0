From: Andrew Lunn <andrew@lunn.ch>
Date: Tue, 24 Dec 2019 11:25:15 +0000
Subject: Re: [PATCH net-next] net: dsa: drop pointless static qualifier in ar9331_sw_mbus_init
Message-Id: <20191224112515.GE3395@lunn.ch>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191224024059.184847-1-maowenan@huawei.com>
In-Reply-To: <20191224024059.184847-1-maowenan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mao Wenan <maowenan@huawei.com>
Cc: vivien.didelot@gmail.com, f.fainelli@gmail.com, davem@davemloft.net, linux@rempel-privat.de, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Dec 24, 2019 at 10:40:59AM +0800, Mao Wenan wrote:
> There is no need to have the 'T *v' variable static

What does 'T *v' mean?

The patch itself looks O.K, but the description should be better, and
the subject line.

    Andrew
