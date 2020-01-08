From: Marcel Holtmann <marcel@holtmann.org>
Date: Wed, 08 Jan 2020 20:48:09 +0000
Subject: Re: [PATCH -next] Bluetooth: hci_qca: Remove set but not used variable 'opcode'
Message-Id: <ED15472A-FD5F-4D10-90F3-E6932CA28BA7@holtmann.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200108015431.51996-1-yuehaibing@huawei.com>
In-Reply-To: <20200108015431.51996-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Johan Hedberg <johan.hedberg@gmail.com>, BlueZ devel list <linux-bluetooth@vger.kernel.org>, kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>

Hi Yue,

> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/bluetooth/hci_qca.c: In function 'qca_controller_memdump':
> drivers/bluetooth/hci_qca.c:980:6: warning:
> variable 'opcode' set but not used [-Wunused-but-set-variable]
> 
> It is never used since commit d841502c79e3 ("Bluetooth: hci_qca: Collect
> controller memory dump during SSR"), so remove it.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
> drivers/bluetooth/hci_qca.c | 3 +--
> 1 file changed, 1 insertion(+), 2 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel
