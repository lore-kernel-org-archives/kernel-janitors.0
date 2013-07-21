From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sun, 21 Jul 2013 22:33:54 +0000
Subject: Re: [patch] virtio: console: fix error handling for debugfs_create_dir()
Message-Id: <20130721223354.GH5585@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130719055049.GD9729@elgon.mountain>
	<201307191228.41794.arnd@arndb.de> <20130720215048.GD5636@mwanda>
	<201307211136.25989.arnd@arndb.de>
In-Reply-To: <201307211136.25989.arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@arndb.de>
Cc: Amit Shah <amit.shah@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org, virtualization@lists.linux-foundation.org

> I don't see where that oops would happen. In the code I'm looking at,
> all uses of ->debugfs_dir only ever get passed into other debugfs
> functions that are stubbed out to empty inline functions.
> 
> It's not the most obvious interface design, but this all seems intentional
> and correct to me.

Ah.  Ok.  You're right.

regards,
dan carpenter

