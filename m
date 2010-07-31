From: Dan Carpenter <error27@gmail.com>
Date: Sat, 31 Jul 2010 19:17:43 +0000
Subject: Re: [PATCH 2/7] usb: fsl_udc_core: check return value of
Message-Id: <20100731191743.GF26313@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1280597900-8405-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1280597900-8405-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kulikov Vasiliy <segooon@gmail.com>
Cc: David Brownell <dbrownell@users.sourceforge.net>, Greg Kroah-Hartman <gregkh@suse.de>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@ozlabs.org, linux-usb@vger.kernel.org, Anton Vorontsov <avorontsov@ru.mvista.com>, Dinh Nguyen <Dinh.Nguyen@freescale.com>

On Sat, Jul 31, 2010 at 09:38:20PM +0400, Kulikov Vasiliy wrote:
> create_proc_read_entry() may fail, if so return -ENOMEM.
> 

It can fail, but also we return NULL if procfs is disabled.  I haven't
looked at it very carefully, would this patch break the module if procfs
was disabled?

The same applies to the similar patches in this set.

regards,
dan carpenter


