From: Marcel Holtmann <marcel@holtmann.org>
Date: Wed, 08 Jan 2020 20:46:20 +0000
Subject: Re: [PATCH -next] Bluetooth: hci_qca: Use vfree() instead of kfree()
Message-Id: <83175A35-B50A-4EB6-BF5B-ABF83F551102@holtmann.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200108035931.51209-1-weiyongjun1@huawei.com>
In-Reply-To: <20200108035931.51209-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Johan Hedberg <johan.hedberg@gmail.com>, Balakrishna Godavarthi <bgodavar@codeaurora.org>, linux-bluetooth@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Wei,

> Use vfree() instead of kfree() to free vmalloc()
> allocated data.
> 
> Fixes: d841502c79e3 ("Bluetooth: hci_qca: Collect controller memory dump during SSR")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
> drivers/bluetooth/hci_qca.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel
