From: Marcel Holtmann <marcel@holtmann.org>
Date: Mon, 18 Feb 2019 10:48:18 +0000
Subject: Re: [PATCH] Bluetooth: remove redundant zero check on count
Message-Id: <050CD529-5C31-4761-BCC8-04630D0038DE@holtmann.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190204190310.24179-1-colin.king@canonical.com>
In-Reply-To: <20190204190310.24179-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Johan Hedberg <johan.hedberg@gmail.com>, linux-bluetooth@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Colin,

> Variable count is never zero inside the loop so the check if count is
> zero is redundant and can be removed. Fix this.
> 
> Detected by CoverityScan, CID#1466880 ("Logically dead code")
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
> drivers/bluetooth/h4_recv.h | 3 ---
> 1 file changed, 3 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel
