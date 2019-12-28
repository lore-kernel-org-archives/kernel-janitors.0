From: David Miller <davem@davemloft.net>
Date: Sat, 28 Dec 2019 00:32:17 +0000
Subject: Re: [PATCH net-next v2] net: dsa: qca: ar9331: drop pointless static qualifier in ar9331_sw_mbus_ini
Message-Id: <20191227.163217.1055599246835779278.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191224112515.GE3395@lunn.ch>
        <20191224115812.166927-1-maowenan@huawei.com>
In-Reply-To: <20191224115812.166927-1-maowenan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: maowenan@huawei.com
Cc: andrew@lunn.ch, vivien.didelot@gmail.com, f.fainelli@gmail.com, linux@rempel-privat.de, marek.behun@nic.cz, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Mao Wenan <maowenan@huawei.com>
Date: Tue, 24 Dec 2019 19:58:12 +0800

> There is no need to set variable 'mbus' static
> since new value always be assigned before use it.
> 
> Signed-off-by: Mao Wenan <maowenan@huawei.com>

Applied, thank you.
