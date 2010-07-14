From: Greg KH <gregkh@suse.de>
Date: Wed, 14 Jul 2010 20:36:26 +0000
Subject: Re: [PATCH 09/11] staging: msm: formatting of pointers in printk()
Message-Id: <20100714203626.GA29243@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1279130717-15755-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1279130717-15755-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kulikov Vasiliy <segooon@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Dominik Brodowski <linux@dominikbrodowski.net>, Alexander Kurz <linux@kbdbabel.org>, Jiri Kosina <jkosina@suse.cz>, Javier Martinez Canillas <martinez.javier@gmail.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

On Wed, Jul 14, 2010 at 10:05:17PM +0400, Kulikov Vasiliy wrote:
> Use %p instead of %08x in printk().
> 
> Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
> ---
>  drivers/staging/comedi/drivers/quatech_daqp_cs.c |    2 +-

Why does your Subject: say "msm"?

greg k-h
