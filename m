From: Oliver Neukum <oliver@neukum.org>
Date: Sun, 26 Dec 2010 12:06:22 +0000
Subject: Re: [patch] USB: cdc_ether: remove unneeded check
Message-Id: <201012261306.22500.oliver@neukum.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101225222341.GS1936@bicker>
In-Reply-To: <20101225222341.GS1936@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Oliver Neukum <oliver@neukum.name>, Greg Kroah-Hartman <gregkh@suse.de>, linux-usb@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Am Samstag, 25. Dezember 2010, 23:23:42 schrieb Dan Carpenter:
> We already verified that "dev->udev->actconfig->extralen" was non-zero
> so "len" is non-zero here as well.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
Acked-by: Oliver Neukum <oneukum@suse.de>


