From: Vojtech Pavlik <vojtech@suse.cz>
Date: Fri, 11 Feb 2005 07:40:26 +0000
Subject: [KJ] Re: [PATCH] Add module autoloading support to input layer
Message-Id: <20050211074026.GA1675@ucw.cz>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============02627602844580279=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============02627602844580279==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 10, 2005 at 03:33:40PM -0800, Duncan Palmer wrote:
> Hi Vojtech,
> 
> Currently, the input device layer relies on the input
> event handler modules being loaded manually, and
> doesn't define any module aliases to support
> autloading of these from userspace or in-kernel. 
> 
> The attached patch defines MODULE_ALIAS_INPUT which
> creates modules aliases of the form input-handler-xxx,
> where xxx is minor >> 5 (to account for the event
> handlers working with a range of minor numbers). It
> also modifies input.c to load missing event handler
> modules.
> 
> Does this look good to you? If so, will the powers
> that be on KJ please consider applying?

I think that autoloading is a dead end of getting modules into the
kernel. The correct way is from the other side - from device discovery
and through hotplug.

So I'll not apply your patch.

> diff -ur linux-2.6.11-rc2-mm1.orig/include/linux/input.h linux-2.6.11-rc2-mm1/include/linux/input.h
> --- linux-2.6.11-rc2-mm1.orig/include/linux/input.h	2005-01-28 13:01:08.000000000 +1100
> +++ linux-2.6.11-rc2-mm1/include/linux/input.h	2005-02-02 16:52:58.000000000 +1100
> @@ -1012,5 +1012,8 @@
>  
>  extern struct class_simple *input_class;
>  
> +#define MODULE_ALIAS_INPUT(x)  \
> +	MODULE_ALIAS("input-handler-" __stringify(x))
> +
>  #endif
>  #endif
> diff -ur linux-2.6.11-rc2-mm1.orig/drivers/input/evdev.c linux-2.6.11-rc2-mm1/drivers/input/evdev.c
> --- linux-2.6.11-rc2-mm1.orig/drivers/input/evdev.c	2005-01-28 13:03:04.000000000 +1100
> +++ linux-2.6.11-rc2-mm1/drivers/input/evdev.c	2005-02-02 16:49:03.000000000 +1100
> @@ -11,6 +11,7 @@
>  #define EVDEV_MINOR_BASE	64
>  #define EVDEV_MINORS		32
>  #define EVDEV_BUFFER_SIZE	64
> +#define EVDEV_HANDLER_ID    2   /* EVDEV_MINOR_BASE >> 5 */
>  
>  #include <linux/poll.h>
>  #include <linux/slab.h>
> @@ -487,3 +488,4 @@
>  MODULE_AUTHOR("Vojtech Pavlik <vojtech@ucw.cz>");
>  MODULE_DESCRIPTION("Input driver event char devices");
>  MODULE_LICENSE("GPL");
> +MODULE_ALIAS_INPUT(EVDEV_HANDLER_ID);
> diff -ur linux-2.6.11-rc2-mm1.orig/drivers/input/input.c linux-2.6.11-rc2-mm1/drivers/input/input.c
> --- linux-2.6.11-rc2-mm1.orig/drivers/input/input.c	2005-01-28 13:00:29.000000000 +1100
> +++ linux-2.6.11-rc2-mm1/drivers/input/input.c	2005-02-02 16:52:38.000000000 +1100
> @@ -536,7 +536,12 @@
>  	struct file_operations *old_fops, *new_fops = NULL;
>  	int err;
>  
> -	/* No load-on-demand here? */
> +	if (!handler)
> +	{
> +		request_module("input-handler-%d", (int)(iminor(inode) >> 5));
> +		/* The module will register itself upon loading */
> +		handler = input_table[iminor(inode) >> 5];
> +	}
>  	if (!handler || !(new_fops = fops_get(handler->fops)))
>  		return -ENODEV;
>  
> diff -ur linux-2.6.11-rc2-mm1.orig/drivers/input/joydev.c linux-2.6.11-rc2-mm1/drivers/input/joydev.c
> --- linux-2.6.11-rc2-mm1.orig/drivers/input/joydev.c	2004-12-25 08:34:45.000000000 +1100
> +++ linux-2.6.11-rc2-mm1/drivers/input/joydev.c	2005-02-02 16:20:55.000000000 +1100
> @@ -28,14 +28,16 @@
>  #include <linux/device.h>
>  #include <linux/devfs_fs_kernel.h>
>  
> +#define JOYDEV_MINOR_BASE	0
> +#define JOYDEV_MINORS		16
> +#define JOYDEV_BUFFER_SIZE	64
> +#define JOYDEV_HANDLER_ID   0   /* JOYDEV_MINOR_BASE >> 5 */
> +
>  MODULE_AUTHOR("Vojtech Pavlik <vojtech@ucw.cz>");
>  MODULE_DESCRIPTION("Joystick device interfaces");
>  MODULE_SUPPORTED_DEVICE("input/js");
>  MODULE_LICENSE("GPL");
> -
> -#define JOYDEV_MINOR_BASE	0
> -#define JOYDEV_MINORS		16
> -#define JOYDEV_BUFFER_SIZE	64
> +MODULE_ALIAS_INPUT(JOYDEV_HANDLER_ID);
>  
>  #define MSECS(t)	(1000 * ((t) / HZ) + 1000 * ((t) % HZ) / HZ)
>  
> diff -ur linux-2.6.11-rc2-mm1.orig/drivers/input/mousedev.c linux-2.6.11-rc2-mm1/drivers/input/mousedev.c
> --- linux-2.6.11-rc2-mm1.orig/drivers/input/mousedev.c	2005-01-28 13:00:30.000000000 +1100
> +++ linux-2.6.11-rc2-mm1/drivers/input/mousedev.c	2005-02-02 16:21:03.000000000 +1100
> @@ -12,6 +12,7 @@
>  #define MOUSEDEV_MINOR_BASE 	32
>  #define MOUSEDEV_MINORS		32
>  #define MOUSEDEV_MIX		31
> +#define MOUSEDEV_HANDLER_ID 1       /* MOUSEDEV_MINOR_BASE >> 5 */
>  
>  #include <linux/slab.h>
>  #include <linux/poll.h>
> @@ -32,6 +33,7 @@
>  MODULE_AUTHOR("Vojtech Pavlik <vojtech@ucw.cz>");
>  MODULE_DESCRIPTION("Mouse (ExplorerPS/2) device interfaces");
>  MODULE_LICENSE("GPL");
> +MODULE_ALIAS_INPUT(MOUSEDEV_HANDLER_ID);
>  
>  #ifndef CONFIG_INPUT_MOUSEDEV_SCREEN_X
>  #define CONFIG_INPUT_MOUSEDEV_SCREEN_X	1024
> diff -ur linux-2.6.11-rc2-mm1.orig/drivers/input/tsdev.c linux-2.6.11-rc2-mm1/drivers/input/tsdev.c
> --- linux-2.6.11-rc2-mm1.orig/drivers/input/tsdev.c	2004-12-25 08:35:39.000000000 +1100
> +++ linux-2.6.11-rc2-mm1/drivers/input/tsdev.c	2005-02-02 16:28:50.000000000 +1100
> @@ -40,6 +40,7 @@
>  /* First 16 devices are h3600_ts compatible; second 16 are h3600_tsraw */
>  #define TSDEV_MINOR_MASK	15
>  #define TSDEV_BUFFER_SIZE	64
> +#define TSDEV_HANDLER_ID    4   /* TSDEV_MINOR_BASE >> 5 */
>  
>  #include <linux/slab.h>
>  #include <linux/poll.h>
> @@ -82,6 +83,7 @@
>  MODULE_AUTHOR("James Simmons <jsimmons@transvirtual.com>");
>  MODULE_DESCRIPTION("Input driver to touchscreen converter");
>  MODULE_LICENSE("GPL");
> +MODULE_ALIAS_INPUT(TSDEV_HANDLER_ID);
>  
>  static int xres = CONFIG_INPUT_TSDEV_SCREEN_X;
>  module_param(xres, uint, 0);


-- 
Vojtech Pavlik
SuSE Labs, SuSE CR

--===============02627602844580279==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============02627602844580279==--
