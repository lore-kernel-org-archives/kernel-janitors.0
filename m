From: Jeff Garzik <jgarzik@pobox.com>
Date: Wed, 03 Apr 2013 23:56:27 +0000
Subject: Re: [patch] pata_legacy: bogus clock in opti82c46x_set_piomode()
Message-Id: <515CC1AB.60603@pobox.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130311114151.GB8235@longonot.mountain>
In-Reply-To: <20130311114151.GB8235@longonot.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-ide@vger.kernel.org, kernel-janitors@vger.kernel.org

On 03/11/2013 07:41 AM, Dan Carpenter wrote:
> "sysclk" is used as an index into a 4 element array.  My static
> checker complains because it can be out of bounds.  From the
> context, it looks like there is a right bit shift missing.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> I don't have the hardware to test this.

applied (to #upstream)



