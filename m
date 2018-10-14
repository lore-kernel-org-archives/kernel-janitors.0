From: Marcel Holtmann <marcel@holtmann.org>
Date: Sun, 14 Oct 2018 08:33:34 +0000
Subject: Re: [PATCH] Bluetooth: Remove redundant check on status
Message-Id: <CDC45F66-4637-4038-ACB7-43DAA9E6A3B6@holtmann.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181010143731.16451-1-colin.king@canonical.com>
In-Reply-To: <20181010143731.16451-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Johan Hedberg <johan.hedberg@gmail.com>, "David S. Miller" <davem@davemloft.net>, linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Colin,

> The check on statis is redundant as a status has to be zero at
> the point it is being checked because of a previous check and return
> path via label 'unlock'.  Remove the redundant check and the deadcode
> that can never be reached.
> 
> Detected by CoverityScan, CID#1471710 ("Logically dead code")
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
> net/bluetooth/hci_event.c | 38 +++++++++++++++++---------------------
> 1 file changed, 17 insertions(+), 21 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel
