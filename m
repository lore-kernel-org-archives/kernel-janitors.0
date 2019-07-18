From: David Miller <davem@davemloft.net>
Date: Thu, 18 Jul 2019 23:21:16 +0000
Subject: Re: [PATCH] net: ag71xx: fix return value check in ag71xx_probe()
Message-Id: <20190718.162116.629841908556075924.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190717115225.23047-1-weiyongjun1@huawei.com>
In-Reply-To: <20190717115225.23047-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: weiyongjun1@huawei.com
Cc: jcliburn@gmail.com, chris.snook@gmail.com, o.rempel@pengutronix.de, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org


Please resubmit these two ag71xx patches, you use a different subsystem
prefix in the Subject lines, so you should make them consistent.

Using just "ag71xx: " is perfectly fine.

Thank you.
