From: Alexander Aring <alex.aring@gmail.com>
Date: Fri, 02 Oct 2015 10:37:07 +0000
Subject: Re: [patch] nl802154: Missing return in nl802154_add_llsec_key()
Message-Id: <20151002103703.GA7896@omega>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151002071958.GA565@omega>
 <20151002074729.GA16768@mwanda>
In-Reply-To: <20151002074729.GA16768@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-wpan@vger.kernel.org, Marcel Holtmann <marcel@holtmann.org>, kernel-janitors@vger.kernel.org

Hi,

On Fri, Oct 02, 2015 at 10:47:29AM +0300, Dan Carpenter wrote:
> There was a missing return here so it meant that often
> ieee802154_llsec_parse_key_id() was not called.
> 
> Fixes: a26c5fd7622d ('nl802154: add support for security layer')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 

Acked-by: Alexander Aring <alex.aring@gmail.com>

Thanks.

- Alex
