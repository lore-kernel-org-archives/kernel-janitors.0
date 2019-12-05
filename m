From: David Miller <davem@davemloft.net>
Date: Thu, 05 Dec 2019 00:59:38 +0000
Subject: Re: [PATCH -next] NFC: port100: Convert cpu_to_le16(le16_to_cpu(E1) + E2) to use le16_add_cpu().
Message-Id: <20191204.165938.1723521846846109078.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191204063717.102854-1-maowenan@huawei.com>
In-Reply-To: <20191204063717.102854-1-maowenan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: maowenan@huawei.com
Cc: gregkh@linuxfoundation.org, alexios.zavras@intel.com, oneukum@suse.com, tglx@linutronix.de, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, hulkci@huawei.com

From: Mao Wenan <maowenan@huawei.com>
Date: Wed, 4 Dec 2019 14:37:17 +0800

> It is better to convert cpu_to_le16(le16_to_cpu(frame->datalen) + len) to
> use le16_add_cpu().
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Mao Wenan <maowenan@huawei.com>

Please resubmit when the net-next tree is open again, right now it is
closed:

	http://vger.kernel.org/~davem/net-next.html
