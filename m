From: Marcel Holtmann <marcel@holtmann.org>
Date: Tue, 19 Nov 2019 08:17:08 +0000
Subject: Re: [PATCH] Bluetooth: delete a stray unlock
Message-Id: <FD103E14-D634-48A6-9C31-9A70A54EE0BC@holtmann.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191119053710.eflgllzyoyglrrj7@kili.mountain>
In-Reply-To: <20191119053710.eflgllzyoyglrrj7@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Andrei Emeltchenko <andrei.emeltchenko@intel.com>, Johan Hedberg <johan.hedberg@gmail.com>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, linux-bluetooth@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Dan,

> We used to take a lock in amp_physical_cfm() but then we moved it to
> the caller function.  Unfortunately the unlock on this error path was
> overlooked so it leads to a double unlock.
> 
> Fixes: a514b17fab51 ("Bluetooth: Refactor locking in amp_physical_cfm")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> net/bluetooth/l2cap_core.c | 4 +---
> 1 file changed, 1 insertion(+), 3 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel
