From: Amit Shah <amit.shah@redhat.com>
Date: Fri, 19 Jul 2013 06:25:01 +0000
Subject: Re: [patch] virtio: console: fix error handling for debugfs_create_dir()
Message-Id: <20130719061301.GI3087@amit-x200.redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130719055049.GD9729@elgon.mountain>
In-Reply-To: <20130719055049.GD9729@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, virtualization@lists.linux-foundation.org

On (Fri) 19 Jul 2013 [08:50:49], Dan Carpenter wrote:
> debugfs_create_dir() returns ERR_PTR(-ENODEV) if debugfs is disabled.
> Also my static checker doesn't like it when we print the error code, but
> it's always just NULL.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Amit Shah <amit.shah@redhat.com>

Today seems to be the 'fix virtio-console day'.

Thanks,
		Amit
