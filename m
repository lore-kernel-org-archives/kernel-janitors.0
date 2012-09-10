From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Date: Mon, 10 Sep 2012 14:06:48 +0000
Subject: Re: [balbi-usb:gadget 58/62] drivers/usb/gadget/ether.c:113:1: error: expected ')' before '.' token
Message-Id: <504DF3F8.6080208@linutronix.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120910135441.GA12990@localhost>
In-Reply-To: <20120910135441.GA12990@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Fengguang Wu <fengguang.wu@intel.com>
Cc: kernel-janitors@vger.kernel.org, Felipe Balbi <balbi@ti.com>, linux-omap@vger.kernel.org, linux-usb@vger.kernel.org

On 09/10/2012 03:54 PM, Fengguang Wu wrote:
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git gadget
> head:   7a7322b0a5d984025dd4faea9098b8fef07f8d8f
> commit: 721e2e91945bc2520d57d795dfe1b502ecec567c [58/62] usb: gadget: lib=
composite: move composite.c into libcomposite
> config: x86_64-randconfig-s284 (attached as .config)
>
> All related error/warning messages:
>
> In file included from drivers/usb/gadget/ether.c:110:0:
> drivers/usb/gadget/u_ether.c:87:21: error: expected ')' before 'uint'

That is the problem. u_ether.c lacks a "#include <linux/module.h>". It
built here because I had rndis & EEM which included that file=85

Thanks for finding this so quickly.

Felipe, patch on top or do fix up this commit?

Sebastian
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
