From: Ohad Ben-Cohen <ohad@wizery.com>
Date: Sat, 06 Oct 2012 09:57:18 +0000
Subject: Re: [remoteproc:for-next 7/12] ERROR: "vring_del_virtqueue" [drivers/remoteproc/remoteproc.ko] undef
Message-Id: <CAK=WgbaBxyxzqxb6S98BdPTovS-SKueJBY+7JRqkX+GoQj=w9g@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121006080758.GB29618@localhost>
In-Reply-To: <20121006080758.GB29618@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fengguang Wu <fengguang.wu@intel.com>
Cc: =?ISO-8859-1?Q?Sjur_Br=E6ndeland?= <sjur.brandeland@stericsson.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, Oct 6, 2012 at 10:07 AM, Fengguang Wu <fengguang.wu@intel.com> wrote:
> Hi Sjur,
>
> FYI, kernel build failed on
>
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ohad/remoteproc.git for-next
> head:   d09f53a735bae43806a77754312a45d3f1198342
> commit: ec4d02d9180f407c41f8310a13b34e473c671fbb [7/12] remoteproc: Add STE modem driver
> config: x86_64-randconfig-s058 (attached as .config)
>
> All error/warnings:
>
> ERROR: "vring_del_virtqueue" [drivers/remoteproc/remoteproc.ko] undefined!
> ERROR: "register_virtio_device" [drivers/remoteproc/remoteproc.ko] undefined!
> ERROR: "unregister_virtio_device" [drivers/remoteproc/remoteproc.ko] undefined!
> ERROR: "vring_new_virtqueue" [drivers/remoteproc/remoteproc.ko] undefined!
> ERROR: "vring_interrupt" [drivers/remoteproc/remoteproc.ko] undefined!
> ERROR: "vring_transport_features" [drivers/remoteproc/remoteproc.ko] undefined!

Thanks, Fengguang, I've pushed this patch to fix this:

commit ed26d190a3e7718a6b8a4f844e963b408f54ce32
Author: Ohad Ben-Cohen <ohad@wizery.com>
Date:   Sat Oct 6 11:35:57 2012 +0200

    remoteproc: fix (again) the virtio-related build breakage

    Another virtio dependency was overlooked, so add it to fix
    the below build breakage. This time for real.

    ERROR: "vring_del_virtqueue" [drivers/remoteproc/remoteproc.ko] undefined!
    ERROR: "register_virtio_device" [drivers/remoteproc/remoteproc.ko] undefined
    ERROR: "unregister_virtio_device" [drivers/remoteproc/remoteproc.ko] undefin
    ERROR: "vring_new_virtqueue" [drivers/remoteproc/remoteproc.ko] undefined!
    ERROR: "vring_interrupt" [drivers/remoteproc/remoteproc.ko] undefined!
    ERROR: "vring_transport_features" [drivers/remoteproc/remoteproc.ko] undefin

    Cc: stable@vger.kernel.org
    Reported-by: Fengguang Wu <fengguang.wu@intel.com>
    Signed-off-by: Ohad Ben-Cohen <ohad@wizery.com>

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index 96ce101..209a4a2 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -7,6 +7,7 @@ config REMOTEPROC
        depends on HAS_DMA
        select FW_CONFIG
        select VIRTIO
+       select VIRTIO_RING

 config OMAP_REMOTEPROC
        tristate "OMAP remoteproc support"
