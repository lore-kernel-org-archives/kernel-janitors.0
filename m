From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Mon, 12 Apr 2010 03:04:46 +0000
Subject: Re: [PATCH] usb/serial/generic: Fix compile error
Message-Id: <20100412030446.GB29292@core.coreip.homeip.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1270999742.11481.44.camel@lenovo>
In-Reply-To: <1270999742.11481.44.camel@lenovo>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Javier,

On Sun, Apr 11, 2010 at 11:29:02AM -0400, Javier Martinez Canillas wrote:
> usb/serial/generic.c gives me a compile error when CONFIG_MAGIC_SYSRQ is
> not defined.
> 
> The problem is that usb_serial_handle_sysrq_char() calls handle_sysrq()
> that only is defined if CONFIG_MAGIC_SYSRQ is defined.
> 
> This patch add an empty handle_sysrq inline function if
> CONFIG_MAGIC_SYSRQ is not defined and generic.c compiles cleanly.
> 

Thanks for the patch. I will fold it into the one where I managed to
loose the static inline if you do not mind.

-- 
Dmitry
