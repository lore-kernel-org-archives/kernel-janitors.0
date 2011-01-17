From: Matt Turner <mattst88@gmail.com>
Date: Mon, 17 Jan 2011 04:38:54 +0000
Subject: Re: [PATCH 03/20] alpha: change to new flag variables
Message-Id: <AANLkTim5VZ+8K3o-i6sQy=EHfgns-ZvLG_roaAsL-_j_@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1285224612-29529-1-git-send-email-mfm@muteddisk.com>
In-Reply-To: <1285224612-29529-1-git-send-email-mfm@muteddisk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: matt mooney <mfm@muteddisk.com>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Sep 23, 2010 at 6:50 AM, matt mooney <mfm@muteddisk.com> wrote:
> Replace EXTRA_CFLAGS with ccflags-y and EXTRA_AFLAGS with asflags-y.
>
> Signed-off-by: matt mooney <mfm@muteddisk.com>
> ---
> =A0arch/alpha/kernel/Makefile =A0 | =A0 =A04 ++--
> =A0arch/alpha/lib/Makefile =A0 =A0 =A0| =A0 =A04 ++--
> =A0arch/alpha/math-emu/Makefile | =A0 =A02 +-
> =A0arch/alpha/mm/Makefile =A0 =A0 =A0 | =A0 =A02 +-
> =A0arch/alpha/oprofile/Makefile | =A0 =A02 +-
> =A05 files changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/arch/alpha/kernel/Makefile b/arch/alpha/kernel/Makefile
> index 1ee9b5b..9bb7b85 100644
> --- a/arch/alpha/kernel/Makefile
> +++ b/arch/alpha/kernel/Makefile
> @@ -3,8 +3,8 @@
> =A0#
>
> =A0extra-y =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0:=3D head.o vmlinux.lds
> -EXTRA_AFLAGS =A0 :=3D $(KBUILD_CFLAGS)
> -EXTRA_CFLAGS =A0 :=3D -Werror -Wno-sign-compare
> +asflags-y =A0 =A0 =A0:=3D $(KBUILD_CFLAGS)
> +ccflags-y =A0 =A0 =A0:=3D -Werror -Wno-sign-compare
>
> =A0obj-y =A0 =A0:=3D entry.o traps.o process.o init_task.o osf_sys.o irq.=
o \
> =A0 =A0 =A0 =A0 =A0 =A0irq_alpha.o signal.o setup.o ptrace.o time.o \
> diff --git a/arch/alpha/lib/Makefile b/arch/alpha/lib/Makefile
> index 9b72c59..c0a83ab 100644
> --- a/arch/alpha/lib/Makefile
> +++ b/arch/alpha/lib/Makefile
> @@ -2,8 +2,8 @@
> =A0# Makefile for alpha-specific library files..
> =A0#
>
> -EXTRA_AFLAGS :=3D $(KBUILD_CFLAGS)
> -EXTRA_CFLAGS :=3D -Werror
> +asflags-y :=3D $(KBUILD_CFLAGS)
> +ccflags-y :=3D -Werror
>
> =A0# Many of these routines have implementations tuned for ev6.
> =A0# Choose them iff we're targeting ev6 specifically.
> diff --git a/arch/alpha/math-emu/Makefile b/arch/alpha/math-emu/Makefile
> index 359ef08..7f46719 100644
> --- a/arch/alpha/math-emu/Makefile
> +++ b/arch/alpha/math-emu/Makefile
> @@ -2,7 +2,7 @@
> =A0# Makefile for the FPU instruction emulation.
> =A0#
>
> -EXTRA_CFLAGS :=3D -w
> +ccflags-y :=3D -w
>
> =A0obj-$(CONFIG_MATHEMU) +=3D math-emu.o
>
> diff --git a/arch/alpha/mm/Makefile b/arch/alpha/mm/Makefile
> index 09399c5..c993d3f 100644
> --- a/arch/alpha/mm/Makefile
> +++ b/arch/alpha/mm/Makefile
> @@ -2,7 +2,7 @@
> =A0# Makefile for the linux alpha-specific parts of the memory manager.
> =A0#
>
> -EXTRA_CFLAGS :=3D -Werror
> +ccflags-y :=3D -Werror
>
> =A0obj-y =A0:=3D init.o fault.o extable.o
>
> diff --git a/arch/alpha/oprofile/Makefile b/arch/alpha/oprofile/Makefile
> index 4aa5624..3473de7 100644
> --- a/arch/alpha/oprofile/Makefile
> +++ b/arch/alpha/oprofile/Makefile
> @@ -1,4 +1,4 @@
> -EXTRA_CFLAGS :=3D -Werror -Wno-sign-compare
> +ccflags-y :=3D -Werror -Wno-sign-compare
>
> =A0obj-$(CONFIG_OPROFILE) +=3D oprofile.o
>
> --
> 1.7.2.1

Thanks for the patch. This has been applied and will be sent to Linus for .=
38.

Matt
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
