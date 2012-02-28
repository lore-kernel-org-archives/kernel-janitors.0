From: Marcel Holtmann <marcel@holtmann.org>
Date: Tue, 28 Feb 2012 16:19:28 +0000
Subject: Re: [patch] Bluetooth: use kfree_skb() instead of kfree()
Message-Id: <1330445968.3392.79.camel@aeonflux>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120228065246.GC20506@elgon.mountain>
In-Reply-To: <20120228065246.GC20506@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "Gustavo F. Padovan" <padovan@profusion.mobi>, Andrei Emeltchenko <andrei.emeltchenko@intel.com>, linux-bluetooth@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Dan,

> sk_buffs should be freed using kfree_skb().
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

sadly these keep slipping in every now and then.

Acked-by: Marcel Holtmann <marcel@holtmann.org>

Regards

Marcel


