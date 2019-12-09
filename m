From: David Miller <davem@davemloft.net>
Date: Mon, 09 Dec 2019 22:27:52 +0000
Subject: Re: [PATCH v2 -next] NFC: port100: Convert cpu_to_le16(le16_to_cpu(E1) + E2) to use le16_add_cpu().
Message-Id: <20191209.142752.72047324724544266.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191209130845.47777-1-maowenan@huawei.com>
In-Reply-To: <20191209130845.47777-1-maowenan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: maowenan@huawei.com
Cc: gregkh@linuxfoundation.org, alexios.zavras@intel.com, oneukum@suse.com, tglx@linutronix.de, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, hulkci@huawei.com

From: Mao Wenan <maowenan@huawei.com>
Date: Mon, 9 Dec 2019 21:08:45 +0800

> Convert cpu_to_le16(le16_to_cpu(frame->datalen) + len) to
> use le16_add_cpu(), which is more concise and does the same thing. 
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Mao Wenan <maowenan@huawei.com>

Applied, thanks.
