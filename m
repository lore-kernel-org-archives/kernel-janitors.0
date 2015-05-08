From: Amit Shah <amit.shah@redhat.com>
Date: Fri, 08 May 2015 09:41:47 +0000
Subject: Re: [patch v2] virtio_console: silence a static checker warning
Message-Id: <20150508092947.GA5527@grmbl.mre>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150508063118.GA6361@grmbl.mre> <20150508091624.GS14154@mwanda>
In-Reply-To: <20150508091624.GS14154@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, virtualization@lists.linux-foundation.org

On (Fri) 08 May 2015 [12:16:25], Dan Carpenter wrote:
> My static checker complains that this sprintf() can overflow but really
> it can't.  Just silence the warning by using snprintf().

Reviewed-by: Amit Shah <amit.shah@redhat.com>

Thanks!


		Amit
