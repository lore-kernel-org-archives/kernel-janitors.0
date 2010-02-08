From: Marcel Holtmann <marcel@holtmann.org>
Date: Mon, 08 Feb 2010 08:00:52 +0000
Subject: Re: [patch] bluetooth: ath3k: add kfree() on error path
Message-Id: <1265616052.31341.256.camel@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100208054317.GA10576@bicker>
In-Reply-To: <20100208054317.GA10576@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Alicke Xu <sxu@atheros.com>, "Luis R. Rodriguez" <lrodriguez@atheros.com>, Vikram Kandukuri <vikram.kandukuri@atheros.com>, linux-bluetooth@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Dan,

> Add a couple kfree() calls on an error path.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> 
> ---
> I only compile tested this one and it's obvoiusly low priority.  Could it go into linux-next?

patch has been applied. Thanks.

Regards

Marcel


