From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 12 Dec 2019 09:52:54 +0000
Subject: Re: [PATCH net-next] net: Remove unused including <linux/version.h>
Message-Id: <CAHmME9pVuOR-EMxXVHVqippJ6UL4cMEoXZ4hoooK-qtQ=az5uQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191212091527.35293-1-yuehaibing@huawei.com>
In-Reply-To: <20191212091527.35293-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: "David S . Miller" <davem@davemloft.net>, WireGuard mailing list <wireguard@lists.zx2c4.com>, Netdev <netdev@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Thu, Dec 12, 2019 at 10:18 AM YueHaibing <yuehaibing@huawei.com> wrote:
>
> Remove including <linux/version.h> that don't need it.
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>

Thanks. Committed with some wording changes to wireguard-linux.git for staging:

https://git.kernel.org/pub/scm/linux/kernel/git/zx2c4/wireguard-linux.git/commit/?id2fd1993cdbf64a57395320c719e58b9a75b767

I'll re-send this to net-next as part of a cleanup series I'm
preparing in a few days.

Jason
