From: Marcel Holtmann <marcel@holtmann.org>
Date: Mon, 22 May 2017 08:25:48 +0000
Subject: Re: [PATCH] Bluetooth: Delete error messages for failed memory allocations in two functions
Message-Id: <A01E2BDB-7FD3-4258-9F6F-941EFA76935E@holtmann.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <0afbfdb7-48f1-4d15-d5bd-8ea40b1eb52a@users.sourceforge.net>
In-Reply-To: <0afbfdb7-48f1-4d15-d5bd-8ea40b1eb52a@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: "open list:BLUETOOTH DRIVERS" <linux-bluetooth@vger.kernel.org>, Network Development <netdev@vger.kernel.org>, "David S. Miller" <davem@davemloft.net>, "Gustavo F. Padovan" <gustavo@padovan.org>, Johan Hedberg <johan.hedberg@gmail.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

Hallo Markus,

> Omit two extra messages for memory allocation failures in these functions.
> 
> This issue was detected by using the Coccinelle software.
> 
> Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
> net/bluetooth/ecdh_helper.c | 11 +++--------
> 1 file changed, 3 insertions(+), 8 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

