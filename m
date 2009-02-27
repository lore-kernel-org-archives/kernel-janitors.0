From: Hannes Eder <hannes@hanneseder.net>
Date: Fri, 27 Feb 2009 01:13:53 +0000
Subject: Re: [PATCH 13/16] kprobes: fix sparse warnings: Using plain integer
Message-Id: <154e089b0902261713w52323573j8283b697562a58e9@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090221235706.17557.97714.stgit@vmbox.hanneseder.net>
	 <20090222000521.17557.93357.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090222000521.17557.93357.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: trivial@kernel.org, Ingo Molnar <mingo@elte.hu>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

[Added To]

On Sun, Feb 22, 2009 at 1:05 AM, Hannes Eder <hannes@hanneseder.net> wrote:
> Fix this sparse warnings:
> =A0kernel/test_kprobes.c:118:19: warning: Using plain integer as NULL poi=
nter
> =A0kernel/test_kprobes.c:213:22: warning: Using plain integer as NULL poi=
nter
> =A0kernel/test_kprobes.c:326:22: warning: Using plain integer as NULL poi=
nter
>
> Signed-off-by: Hannes Eder <hannes@hanneseder.net>
> ---
> =A0kernel/test_kprobes.c | =A0 =A06 +++---
> =A01 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/kernel/test_kprobes.c b/kernel/test_kprobes.c
> index 4f10451..9a43351 100644
> --- a/kernel/test_kprobes.c
> +++ b/kernel/test_kprobes.c
> @@ -115,7 +115,7 @@ static int test_kprobes(void)
> =A0 =A0 =A0 =A0int ret;
> =A0 =A0 =A0 =A0struct kprobe *kps[2] =3D {&kp, &kp2};
>
> - =A0 =A0 =A0 kp.addr =3D 0; /* addr should be cleard for reusing kprobe.=
 */
> + =A0 =A0 =A0 kp.addr =3D NULL; /* addr should be cleard for reusing kpro=
be. */
> =A0 =A0 =A0 =A0ret =3D register_kprobes(kps, 2);
> =A0 =A0 =A0 =A0if (ret < 0) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0printk(KERN_ERR "Kprobe smoke test failed:=
 "
> @@ -210,7 +210,7 @@ static int test_jprobes(void)
> =A0 =A0 =A0 =A0int ret;
> =A0 =A0 =A0 =A0struct jprobe *jps[2] =3D {&jp, &jp2};
>
> - =A0 =A0 =A0 jp.kp.addr =3D 0; /* addr should be cleard for reusing kpro=
be. */
> + =A0 =A0 =A0 jp.kp.addr =3D NULL; /* addr should be cleard for reusing k=
probe. */
> =A0 =A0 =A0 =A0ret =3D register_jprobes(jps, 2);
> =A0 =A0 =A0 =A0if (ret < 0) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0printk(KERN_ERR "Kprobe smoke test failed:=
 "
> @@ -323,7 +323,7 @@ static int test_kretprobes(void)
> =A0 =A0 =A0 =A0int ret;
> =A0 =A0 =A0 =A0struct kretprobe *rps[2] =3D {&rp, &rp2};
>
> - =A0 =A0 =A0 rp.kp.addr =3D 0; /* addr should be cleard for reusing kpro=
be. */
> + =A0 =A0 =A0 rp.kp.addr =3D NULL; /* addr should be cleard for reusing k=
probe. */
> =A0 =A0 =A0 =A0ret =3D register_kretprobes(rps, 2);
> =A0 =A0 =A0 =A0if (ret < 0) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0printk(KERN_ERR "Kprobe smoke test failed:=
 "
>
>
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
