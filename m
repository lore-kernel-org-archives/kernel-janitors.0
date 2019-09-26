From: Marcel Holtmann <marcel@holtmann.org>
Date: Thu, 26 Sep 2019 06:34:30 +0000
Subject: Re: [PATCH net] Bluetooth: SMP: remove set but not used variable 'smp'
Message-Id: <1EA3AA11-946A-4C3C-9B87-1A6448B24627@holtmann.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190923140516.166241-1-yuehaibing@huawei.com>
In-Reply-To: <20190923140516.166241-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Johan Hedberg <johan.hedberg@gmail.com>, "David S. Miller" <davem@davemloft.net>, Bluez mailing list <linux-bluetooth@vger.kernel.org>, kernel-janitors@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Yue,

> On Sep 23, 2019, at 16:05, YueHaibing <yuehaibing@huawei.com> wrote:
> 
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> net/bluetooth/smp.c: In function 'smp_irk_matches':
> net/bluetooth/smp.c:505:18: warning:
> variable 'smp' set but not used [-Wunused-but-set-variable]
> 
> net/bluetooth/smp.c: In function 'smp_generate_rpa':
> net/bluetooth/smp.c:526:18: warning:
> variable 'smp' set but not used [-Wunused-but-set-variable]
> 
> It is not used since commit 28a220aac596 ("bluetooth: switch
> to AES library")
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
> net/bluetooth/smp.c | 6 ------
> 1 file changed, 6 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel
