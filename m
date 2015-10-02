From: Marcel Holtmann <marcel@holtmann.org>
Date: Fri, 02 Oct 2015 21:35:34 +0000
Subject: Re: [patch] nl802154: Missing return in nl802154_add_llsec_key()
Message-Id: <A78598D3-3A0B-4D38-A665-509FF4D6E42A@holtmann.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151002074729.GA16768@mwanda>
In-Reply-To: <20151002074729.GA16768@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Alexander Aring <alex.aring@gmail.com>, linux-wpan@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Dan,

> There was a missing return here so it meant that often
> ieee802154_llsec_parse_key_id() was not called.
> 
> Fixes: a26c5fd7622d ('nl802154: add support for security layer')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

patch has been applied to bluetooth-next tree.

Regards

Marcel

