From: Greg KH <gregkh@suse.de>
Date: Fri, 19 Nov 2010 19:02:42 +0000
Subject: Re: [PATCH] drivers: base: core: do not put noninitialized devices
Message-Id: <20101119190242.GA14328@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1290192100-11451-1-git-send-email-segoon@openwall.com>
In-Reply-To: <1290192100-11451-1-git-send-email-segoon@openwall.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vasiliy Kulikov <segoon@openwall.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Nov 19, 2010 at 09:41:40PM +0300, Vasiliy Kulikov wrote:
> If kobject_set_name_vargs() fails then put_device() frees
> device with zero kobj->state_initialized.  This leads to WARN().

Have you seen this happen?

> Divide device_register() call to device_initialize() call before
> kobject_set_name_vargs() and device_add() call after it.
> 
> Signed-off-by: Vasiliy Kulikov <segoon@openwall.com>
> ---
>  Compile tested only.

I'd prefer not to change this unless you are seeing problems with the
current code.

How did kobject_set_name_vargs() fail for you?

thanks,

greg k-h
