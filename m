From: santosh prasad nayak <santoshprasadnayak@gmail.com>
Date: Sat, 03 Mar 2012 07:56:00 +0000
Subject: Re: [PATCH] arch: x86: kernel: kprobes: functions with definition should not be declared extern
Message-Id: <CAOD=uF4=1D_V2Up7n7eCxptzf+JaFTORwDBCmtOiWUegOhPrNw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1330725391-9439-1-git-send-email-emilgoode@gmail.com>
In-Reply-To: <1330725391-9439-1-git-send-email-emilgoode@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

[santosh@localhost linux-next]$ ./scripts/get_maintainer.pl --file
arch/x86/kernel/kprobes.c
Thomas Gleixner <tglx@linutronix.de> (maintainer:X86 ARCHITECTURE...)
Ingo Molnar <mingo@redhat.com> (maintainer:X86
ARCHITECTURE...,commit_signer:3/4u%)
"H. Peter Anvin" <hpa@zytor.com> (maintainer:X86 ARCHITECTURE...)
x86@kernel.org (maintainer:X86 ARCHITECTURE...)
Masami Hiramatsu <masami.hiramatsu.pt@hitachi.com> (commit_signer:3/4u%)
Jiri Olsa <jolsa@redhat.com> (commit_signer:2/4P%)
Josh Stone <jistone@redhat.com> (commit_signer:2/4P%)
linux-kernel@vger.kernel.org (open list)
[santosh@localhost linux-next]$


Please send the patch to above mantainers and cc to "kernel-janitors"

Watch the video tutorial of Greg provided in the following link. Its very u=
seful

http://www.cnx-software.com/2011/08/19/how-to-write-and-submit-a-linux-kern=
el-patch/


Regards
Santosh



On Sat, Mar 3, 2012 at 1:14 PM, Dan Carpenter <dan.carpenter@oracle.com> wr=
ote:
>
> Looks good.
>
> Change the subject prefix to: kprobes/x86:
> get this by typing:
> =A0 =A0 =A0 =A0git log --pretty=3Doneline arch/x86/kernel/kprobes.c
>
>
> Maybe choose a shorter subject. =A0Such as "remove extern from
> function definition."
>
> Perhaps line wrap the commit log at 72 characters.
> sparse warns:
> arch/x86/kernel/kprobes.c:1489:13: warning:
> =A0 =A0 =A0 =A0function 'arch_unoptimize_kprobes' with external linkage
> =A0 =A0 =A0 =A0has definition
>
> Resend to the people from ./scripts/get_maintainer.pl
>
> regargs,
> dan carpenter
>
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
