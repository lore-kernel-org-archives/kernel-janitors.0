From: Marcel Holtmann <marcel@holtmann.org>
Date: Thu, 12 Mar 2020 14:12:56 +0000
Subject: Re: [PATCH] Bluetooth: L2CAP: Fix a condition in l2cap_sock_recvmsg()
Message-Id: <4F91997F-782B-406F-8783-D64EA7826E06@holtmann.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200312113309.GE20562@mwanda>
In-Reply-To: <20200312113309.GE20562@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>, Johan Hedberg <johan.hedberg@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Bluez mailing list <linux-bluetooth@vger.kernel.org>, kernel-janitors@vger.kernel.org

Hi Dan,

> Smatch complains about the indenting:
> 
>    net/bluetooth/l2cap_sock.c:1027 l2cap_sock_recvmsg()
>    warn: inconsistent indenting
> 
> It looks like this is supposed to be an "else if" condition.
> 
> Fixes: 15f02b910562 ("Bluetooth: L2CAP: Add initial code for Enhanced Credit Based Mode")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> net/bluetooth/l2cap_sock.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel
