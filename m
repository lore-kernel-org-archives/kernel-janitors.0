From: Andy Lutomirski <luto@amacapital.net>
Date: Sun, 01 Apr 2012 19:29:36 +0000
Subject: Re: [PATCH v2] x86, vsyscall: Fix sparse warning: Using plain integer as NULL
Message-Id: <CALCETrXWvLb2NEnBVus7HjET53M-Ryz68jhP0UQOcWsjZcbjvQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1333306084-3776-1-git-send-email-emilgoode@gmail.com>
In-Reply-To: <1333306084-3776-1-git-send-email-emilgoode@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Sun, Apr 1, 2012 at 11:48 AM, Emil Goode <emilgoode@gmail.com> wrote:
> Decided to change the comment instead as well.
>
> This patch silences the following sparse warning:
> arch/x86/kernel/vsyscall_64.c:250:34:
> =A0 =A0 =A0 warning: Using plain integer as NULL pointer
>
> Signed-off-by: Emil Goode <emilgoode@gmail.com>
> ---
> v2: Changed comment to "NULL" instead of "0"
>
> =A0arch/x86/kernel/vsyscall_64.c | =A0 =A06 +++---
> =A01 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/x86/kernel/vsyscall_64.c b/arch/x86/kernel/vsyscall_64.c
> index f386dc4..7515cf0 100644
> --- a/arch/x86/kernel/vsyscall_64.c
> +++ b/arch/x86/kernel/vsyscall_64.c
> @@ -216,9 +216,9 @@ bool emulate_vsyscall(struct pt_regs *regs, unsigned =
long address)
> =A0 =A0 =A0 =A0current_thread_info()->sig_on_uaccess_error =3D 1;
>
> =A0 =A0 =A0 =A0/*
> - =A0 =A0 =A0 =A0* 0 is a valid user pointer (in the access_ok sense) on =
32-bit and
> + =A0 =A0 =A0 =A0* NULL is a valid user pointer (in the access_ok sense) =
on 32-bit and
> =A0 =A0 =A0 =A0 * 64-bit, so we don't need to special-case it here. =A0Fo=
r all the
> - =A0 =A0 =A0 =A0* vsyscalls, 0 means "don't write anything" not "write i=
t at
> + =A0 =A0 =A0 =A0* vsyscalls, NULL means "don't write anything" not "writ=
e it at
> =A0 =A0 =A0 =A0 * address 0".
> =A0 =A0 =A0 =A0 */
> =A0 =A0 =A0 =A0ret =3D -EFAULT;
> @@ -247,7 +247,7 @@ bool emulate_vsyscall(struct pt_regs *regs, unsigned =
long address)
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ret =3D sys_getcpu((unsigned __user *)regs=
->di,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (unsigned=
 __user *)regs->si,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A00);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0NULL);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;
> =A0 =A0 =A0 =A0}
>
> --
> 1.7.9.1
>

Acked-by: Andy Lutomirski <luto@amacapital.net>
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
