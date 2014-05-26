From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=  <u.kleine-koenig@pengutronix.de>
Date: Mon, 26 May 2014 18:14:24 +0000
Subject: Re: [PATCH 1/3] driver core/platform: don't leak memory allocated for dma_mask
Message-Id: <20140526181424.GN20155@pengutronix.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1401122483-31603-1-git-send-email-emilgoode@gmail.com>
In-Reply-To: <1401122483-31603-1-git-send-email-emilgoode@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-arm-kernel@lists.infradead.org

On Mon, May 26, 2014 at 06:41:21PM +0200, Emil Goode wrote:
> From: Yann Droneaud <ydroneaud@opteya.com>
>=20
> Since commit 01dcc60a7cb8, platform_device_register_full() is
> available to allocate and register a platform device.
>=20
> If a dma_mask is provided as part of platform_device_info,
> platform_device_register_full() allocate memory for a u64 using
> kmalloc().
>=20
> A comment in the code state that "[t]his memory isn't freed when the
> device is put".
>=20
> It's never a good thing to leak memory, but there's only very few
> users of platform_device_info's dma_mask, and those are mostly
> "static" devices that are not going to be plugged/unplugged often.
>=20
> So memory leak is not really an issue, but allocating 8 bytes through
> kmalloc() seems overkill.
>=20
> To address this issue, this patch adds dma_mask to struct platform_object
> and when using platform_device_alloc() or platform_device_register_full()
> the .dma_mask pointer of struct device is assigned the address of this new
> dma_mask member of struct platform_object.  And since it's within struct
> platform_object, dma_mask won't be leaked anymore when struct platform_de=
vice
> get released.
>=20
> No more memory leak, no small allocation and a slight reduction in code
> size.
>=20
> Built on Debian jessie, using GCC 4.8, for ARM and x86_64 architectures,
> the size of the object file and the data structure layout are updated
> as follows, produced with commands:
>=20
> $ size drivers/base/platform.o
> $ pahole drivers/base/platform.o \
> 	--recursive		 \
> 	--class_name device,pdev_archdata,platform_device,platform_object
>=20
> -- size+pahole_3.15-rc6_ARM
> ++ size+pahole_3.15-rc6_ARM+
> @@ -2,7 +2,7 @@
>     text	   data	    bss	    dec	    hex	filename
> -   6530	   1008	      8	   7546	   1d7a	drivers/base/platform.o
> +   6482	   1008	      8	   7498	   1d4a	drivers/base/platform.o
>=20
> @@ -93,8 +93,13 @@ struct platform_object {
>  	/* --- cacheline 12 boundary (768 bytes) was 40 bytes ago --- */
>  	char                       name[1];            /*   808     1 */
>=20
> -	/* size: 816, cachelines: 13, members: 2 */
> -	/* padding: 7 */
> +	/* XXX 7 bytes hole, try to pack */
>=20
> +	u64                        dma_mask;           /*   816     8 */
>=20
> +	/* size: 824, cachelines: 13, members: 3 */
> +	/* sum members: 817, holes: 1, sum holes: 7 */
>  	/* paddings: 1, sum paddings: 4 */
> -	/* last cacheline: 48 bytes */
> +	/* last cacheline: 56 bytes */
>  };
>=20
> -- size+pahole_3.15-rc6_x86_64
> ++ size+pahole_3.15-rc6_x86_64+
> @@ -2,7 +2,7 @@
>     text	   data	    bss	    dec	    hex	filename
> -   8570	   5032	   3424	  17026	   4282	drivers/base/platform.o
> +   8509	   5032	   3408	  16949	   4235	drivers/base/platform.o
>=20
> @@ -95,7 +95,11 @@ struct platform_object {
>  	/* --- cacheline 22 boundary (1408 bytes) was 32 bytes ago --- */
>  	char                       name[1];             /*  1440     1 */
>=20
> -	/* size: 1448, cachelines: 23, members: 2 */
> -	/* padding: 7 */
> -	/* last cacheline: 40 bytes */
> +	/* XXX 7 bytes hole, try to pack */
>=20
> +	u64                        dma_mask;            /*  1448     8 */
>=20
> +	/* size: 1456, cachelines: 23, members: 3 */
> +	/* sum members: 1449, holes: 1, sum holes: 7 */
> +	/* last cacheline: 48 bytes */
>  };
>=20
> Changes from v4 [1]:
> - Split v4 of the patch into two separate patches.
> - Generated new object file size and data structure layout info.
> - Updated the changelog message.
>=20
> Changes from v3 [2]:
> - fixed commit message so that git am doesn't fail.
>=20
> Changes from v2 [3]:
> - move 'dma_mask' to platform_object so that it's always
>   allocated and won't leak on release; remove all previously
>   added support functions.
> - use C99 flexible array member for 'name' to remove padding
>   at the end of platform_object.
>=20
> Changes from v1 [4]:
> - remove unneeded kfree() from error path
> - add reference to author/commit adding allocation of dmamask
>=20
> Changes from v0 [5]:
> - small rewrite to squeeze the patch to a bare minimal
>=20
> [1] http://lkml.kernel.org/r/1390817152-30898-1-git-send-email-ydroneaud@=
opteya.com
>     https://patchwork.kernel.org/patch/3541871/
>=20
> [2] http://lkml.kernel.org/r/1390771138-28348-1-git-send-email-ydroneaud@=
opteya.com
>     https://patchwork.kernel.org/patch/3540081/
>=20
> [3] http://lkml.kernel.org/r/1389683909-17495-1-git-send-email-ydroneaud@=
opteya.com
>     https://patchwork.kernel.org/patch/3484411/
>=20
> [4] http://lkml.kernel.org/r/1389649085-7365-1-git-send-email-ydroneaud@o=
pteya.com
>     https://patchwork.kernel.org/patch/3480961/
>=20
> [5] http://lkml.kernel.org/r/1386886207-2735-1-git-send-email-ydroneaud@o=
pteya.com
>=20
> Cc: Yann Droneaud <ydroneaud@opteya.com>
> Cc: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Yann Droneaud <ydroneaud@opteya.com>
> [Emil: split v4 of the patch in two and updated changelog]
> Signed-off-by: Emil Goode <emilgoode@gmail.com>
> ---
> Hello Greg,
>=20
> The first two patches in the series are created from v4 of the
> original patch, since I have not changed how the code works I think
> it is correct to keep the original author and Signed-off-by line.
>=20
> Best regards,
>=20
> Emil Goode
>=20
>  drivers/base/platform.c |   13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/base/platform.c b/drivers/base/platform.c
> index 9e9227e..dd1fa07 100644
> --- a/drivers/base/platform.c
> +++ b/drivers/base/platform.c
> @@ -166,6 +166,7 @@ EXPORT_SYMBOL_GPL(platform_add_devices);
>  struct platform_object {
>  	struct platform_device pdev;
>  	char name[1];
> +	u64 dma_mask;
This is broken. .name is used as flexible array, so .name and dma_mask
overlap.

Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
