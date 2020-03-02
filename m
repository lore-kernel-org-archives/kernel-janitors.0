From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 02 Mar 2020 09:05:47 +0000
Subject: Re: [PATCH] MAINTAINERS: adjust EFI entry to removing eboot.c
Message-Id: <CAKv+Gu_gCqMO89wQ8RTwveBMDu-vdwhS5anPiZzQHdViygEouQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200301155748.4788-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20200301155748.4788-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: linux-efi <linux-efi@vger.kernel.org>, Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Sun, 1 Mar 2020 at 16:58, Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> Commit c2d0b470154c ("efi/libstub/x86: Incorporate eboot.c into libstub")
> removed arch/x86/boot/compressed/eboot.[ch], but missed to adjust the
> MAINTAINERS entry.
>
> Since then, ./scripts/get_maintainer.pl --self-test complains:
>
>   warning: no file matches F: arch/x86/boot/compressed/eboot.[ch]
>
> Rectify EXTENSIBLE FIRMWARE INTERFACE (EFI) entry in MAINTAINERS.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> Ard, please pick this patch for your linux-next branch.
> applies cleanly on next-20200228, do not apply on current master
>
>  MAINTAINERS | 1 -
>  1 file changed, 1 deletion(-)
>

Thanks Lukas, I'll queue this up.

> diff --git a/MAINTAINERS b/MAINTAINERS
> index 09b04505e7c3..4ce510b8467a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6383,7 +6383,6 @@ T:        git git://git.kernel.org/pub/scm/linux/kernel/git/efi/efi.git
>  S:     Maintained
>  F:     Documentation/admin-guide/efi-stub.rst
>  F:     arch/*/kernel/efi.c
> -F:     arch/x86/boot/compressed/eboot.[ch]
>  F:     arch/*/include/asm/efi.h
>  F:     arch/x86/platform/efi/
>  F:     drivers/firmware/efi/
> --
> 2.17.1
>
