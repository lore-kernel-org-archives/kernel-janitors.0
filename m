From: Arnd Bergmann <abergman@de.ibm.com>
Date: Mon, 20 Mar 2006 09:54:13 +0000
Subject: Re: [KJ] [PATCH] usb.h: reduce syslog clutter
Message-Id: <200603201054.13536.abergman@de.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <441C6536.2060800@imap.cc>
In-Reply-To: <441C6536.2060800@imap.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Saturday 18 March 2006 20:53, Tilman Schmidt wrote:
> +#if defined(CONFIG_MODULES) && defined(THIS_MODULE)
> +#define KMSG_LOCATION_PREFIX THIS_MODULE ? THIS_MODULE->name : __FILE__
> +#else
> +#define KMSG_LOCATION_PREFIX __FILE__
> +#endif
> +

Shouldn't this simply use KBUILD_MODNAME?

	Arnd <><
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
