From: "David Laight" <David.Laight@ACULAB.COM>
Date: Thu, 13 Sep 2012 08:31:45 +0000
Subject: RE: [PATCH 9/9] drivers/isdn/gigaset/common.c: Remove useless kfree
Message-Id: <AE90C24D6B3A694183C094C60CF0A2F6026B6FEE@saturn3.aculab.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1347462407-13499-9-git-send-email-peter.senna@gmail.com>
In-Reply-To: <1347462407-13499-9-git-send-email-peter.senna@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Senna Tschudin <peter.senna@gmail.com>, Hansjoerg Lipp <hjlipp@web.de>
Cc: kernel-janitors@vger.kernel.org, Tilman Schmidt <tilman@imap.cc>, Karsten Keil <isdn@linux-pingi.de>, gigaset307x-common@lists.sourceforge.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

> Remove useless kfree() and clean up code related to the removal.
...
> diff --git a/drivers/isdn/gigaset/common.c b/drivers/isdn/gigaset/common.c
> index aa41485..30a6b17 100644
> --- a/drivers/isdn/gigaset/common.c
> +++ b/drivers/isdn/gigaset/common.c
> @@ -1123,7 +1123,6 @@ struct gigaset_driver *gigaset_initdriver(unsigned minor, unsigned minors,
>  	return drv;
> 
>  error:
> -	kfree(drv->cs);
>  	kfree(drv);
>  	return NULL;
>  }
> 

Seems to me that (assuming kfree(NULL) is ok) the kfree()
is best left in - just in case some other error path is
added after drv->cs is assigned.
Better safe than a memory leak.

	David



