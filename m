From: Hannes Eder <hannes@hanneseder.net>
Date: Fri, 27 Feb 2009 00:48:19 +0000
Subject: Re: [PATCH 01/16] kexec/i386: fix sparse warnings: Using plain
Message-Id: <154e089b0902261648s614be164hf4d4340543f9f0d5@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090221235706.17557.97714.stgit@vmbox.hanneseder.net>
	 <20090222000051.17557.85888.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090222000051.17557.85888.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Ingo Molnar <mingo@elte.hu>, trivial@kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Added To: Ingo Molnar <mingo@elte.hu>

On Sun, Feb 22, 2009 at 1:00 AM, Hannes Eder <hannes@hanneseder.net> wrote:
> Fix this sparse warnings:
> =A0arch/x86/kernel/machine_kexec_32.c:124:22: warning: Using plain intege=
r as NULL pointer
> =A0arch/x86/kernel/traps.c:950:24: warning: Using plain integer as NULL p=
ointer
>
> Signed-off-by: Hannes Eder <hannes@hanneseder.net>
> ---
> =A0arch/x86/kernel/machine_kexec_32.c | =A0 =A02 +-
> =A0arch/x86/kernel/traps.c =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A02 +-
> =A02 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/x86/kernel/machine_kexec_32.c b/arch/x86/kernel/machine=
_kexec_32.c
> index 37f4200..f5fc8c7 100644
> --- a/arch/x86/kernel/machine_kexec_32.c
> +++ b/arch/x86/kernel/machine_kexec_32.c
> @@ -121,7 +121,7 @@ static void machine_kexec_page_table_set_one(
> =A0static void machine_kexec_prepare_page_tables(struct kimage *image)
> =A0{
> =A0 =A0 =A0 =A0void *control_page;
> - =A0 =A0 =A0 pmd_t *pmd =3D 0;
> + =A0 =A0 =A0 pmd_t *pmd =3D NULL;
>
> =A0 =A0 =A0 =A0control_page =3D page_address(image->control_code_page);
> =A0#ifdef CONFIG_X86_PAE
> diff --git a/arch/x86/kernel/traps.c b/arch/x86/kernel/traps.c
> index ba90406..6882089 100644
> --- a/arch/x86/kernel/traps.c
> +++ b/arch/x86/kernel/traps.c
> @@ -947,7 +947,7 @@ dotraplinkage void do_iret_error(struct pt_regs *regs=
, long error_code)
> =A0 =A0 =A0 =A0info.si_signo =3D SIGILL;
> =A0 =A0 =A0 =A0info.si_errno =3D 0;
> =A0 =A0 =A0 =A0info.si_code =3D ILL_BADSTK;
> - =A0 =A0 =A0 info.si_addr =3D 0;
> + =A0 =A0 =A0 info.si_addr =3D NULL;
> =A0 =A0 =A0 =A0if (notify_die(DIE_TRAP, "iret exception",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0regs, error_code, 32, SIGI=
LL) =3D NOTIFY_STOP)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return;
>
>
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
