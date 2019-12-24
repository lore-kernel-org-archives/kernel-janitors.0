From: Andrew Lunn <andrew@lunn.ch>
Date: Tue, 24 Dec 2019 12:34:37 +0000
Subject: Re: [PATCH net-next v2] net: dsa: qca: ar9331: drop pointless static qualifier in ar9331_sw_mbus_ini
Message-Id: <20191224123437.GF3395@lunn.ch>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191224112515.GE3395@lunn.ch>
 <20191224115812.166927-1-maowenan@huawei.com>
In-Reply-To: <20191224115812.166927-1-maowenan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mao Wenan <maowenan@huawei.com>
Cc: vivien.didelot@gmail.com, f.fainelli@gmail.com, davem@davemloft.net, linux@rempel-privat.de, marek.behun@nic.cz, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Dec 24, 2019 at 07:58:12PM +0800, Mao Wenan wrote:
> There is no need to set variable 'mbus' static
> since new value always be assigned before use it.
> 
> Signed-off-by: Mao Wenan <maowenan@huawei.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
