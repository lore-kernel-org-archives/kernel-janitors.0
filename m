From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 18 Jun 2014 18:48:14 +0000
Subject: Re: [PATCH] Staging: rtl8192e prohibit deferencing of NULL pointer
Message-Id: <20140618184814.GO5500@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <53A1D769.7090301@ict.tuwien.ac.at>
In-Reply-To: <53A1D769.7090301@ict.tuwien.ac.at>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Jun 18, 2014 at 06:16:09PM +0000, Andreas Platschek wrote:
> If ieee = NULL we jump to rx_dropped. Therefore we have to check again,
> if ieee != NULL before we use it.

Take a look at the caller as well.  It doesn't check ieee for NULL so
probably this can never be NULL.  How would that make sense if ieee were
NULL?

Also the patch doesn't apply.  Read Documentation/email-clients.txt

regards,
dan carpenter

