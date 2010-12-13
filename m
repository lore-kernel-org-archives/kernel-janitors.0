From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 13 Dec 2010 18:49:43 +0000
Subject: Re: [PATCH] checkpatch.pl: ERROR: spaces required
Message-Id: <AANLkTi=oHyk3AF3eKP3Vm2Ywfb9WcgrurNrkYVKfc588@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1292263974-15363-1-git-send-email-toralf.foerster@gmx.de>
In-Reply-To: <1292263974-15363-1-git-send-email-toralf.foerster@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: =?ISO-8859-1?Q?Toralf_F=F6rster?= <toralf.foerster@gmx.de>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

2010/12/13 Toralf F=F6rster <toralf.foerster@gmx.de>:
>
> Signed-off-by: Toralf F=F6rster <toralf.foerster@gmx.de>
> ---
> =A0kernel/acct.c | =A0 20 ++++++++++----------
> =A01 files changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/kernel/acct.c b/kernel/acct.c
> index fa7eb3d..9ca7be8 100644
> --- a/kernel/acct.c
> +++ b/kernel/acct.c
> @@ -144,7 +144,7 @@ static int check_free_space(struct bsd_acct_struct *a=
cct, struct file *file)
> =A0 =A0 =A0 =A0spin_lock(&acct_lock);
> =A0 =A0 =A0 =A0if (file !=3D acct->file) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (act)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 res =3D act>0;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 res =3D act > 0;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto out;
> =A0 =A0 =A0 =A0}
>
> @@ -396,7 +396,7 @@ static comp_t encode_comp_t(unsigned long value)
> =A0 =A0 =A0 =A0return exp;
> =A0}
>
> -#if ACCT_VERSION=3D1 || ACCT_VERSION=3D2
> +#if ACCT_VERSION =3D 1 || ACCT_VERSION =3D 2
> =A0/*
> =A0* encode an u64 into a comp2_t (24 bits)
> =A0*
> @@ -440,7 +440,7 @@ static comp2_t encode_comp2_t(u64 value)
> =A0}
> =A0#endif
>
> -#if ACCT_VERSION=3D3
> +#if ACCT_VERSION =3D 3
> =A0/*
> =A0* encode an u64 into a 32 bit IEEE float
> =A0*/
> @@ -449,8 +449,8 @@ static u32 encode_float(u64 value)
> =A0 =A0 =A0 =A0unsigned exp =3D 190;
> =A0 =A0 =A0 =A0unsigned u;
>
> - =A0 =A0 =A0 if (value=3D0) return 0;
> - =A0 =A0 =A0 while ((s64)value > 0){
> + =A0 =A0 =A0 if (value =3D 0) return 0;

Newline here. Doesn't checkpatch.pl complain? It is an old rule:

http://lxr.linux.no/linux+v2.6.36/Documentation/CodingStyle#L60

> + =A0 =A0 =A0 while ((s64)value > 0) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0value <<=3D 1;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0exp--;
> =A0 =A0 =A0 =A0}
> @@ -510,13 +510,13 @@ static void do_acct_process(struct bsd_acct_struct =
*acct,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 + current->group_leader->star=
t_time.tv_nsec;
> =A0 =A0 =A0 =A0/* convert nsec -> AHZ */
> =A0 =A0 =A0 =A0elapsed =3D nsec_to_AHZ(run_time);
> -#if ACCT_VERSION=3D3
> +#if ACCT_VERSION =3D 3
> =A0 =A0 =A0 =A0ac.ac_etime =3D encode_float(elapsed);
> =A0#else
> =A0 =A0 =A0 =A0ac.ac_etime =3D encode_comp_t(elapsed < (unsigned long) -1=
l ?
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (unsigned lon=
g) elapsed : (unsigned long) -1l);
> =A0#endif
> -#if ACCT_VERSION=3D1 || ACCT_VERSION=3D2
> +#if ACCT_VERSION =3D 1 || ACCT_VERSION =3D 2
> =A0 =A0 =A0 =A0{
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* new enlarged etime field */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0comp2_t etime =3D encode_comp2_t(elapsed);
> @@ -529,15 +529,15 @@ static void do_acct_process(struct bsd_acct_struct =
*acct,
> =A0 =A0 =A0 =A0/* we really need to bite the bullet and change layout */
> =A0 =A0 =A0 =A0ac.ac_uid =3D orig_cred->uid;
> =A0 =A0 =A0 =A0ac.ac_gid =3D orig_cred->gid;
> -#if ACCT_VERSION=3D2
> +#if ACCT_VERSION =3D 2
> =A0 =A0 =A0 =A0ac.ac_ahz =3D AHZ;
> =A0#endif
> -#if ACCT_VERSION=3D1 || ACCT_VERSION=3D2
> +#if ACCT_VERSION =3D 1 || ACCT_VERSION =3D 2
> =A0 =A0 =A0 =A0/* backward-compatible 16 bit fields */
> =A0 =A0 =A0 =A0ac.ac_uid16 =3D ac.ac_uid;
> =A0 =A0 =A0 =A0ac.ac_gid16 =3D ac.ac_gid;
> =A0#endif
> -#if ACCT_VERSION=3D3
> +#if ACCT_VERSION =3D 3
> =A0 =A0 =A0 =A0ac.ac_pid =3D task_tgid_nr_ns(current, ns);
> =A0 =A0 =A0 =A0rcu_read_lock();
> =A0 =A0 =A0 =A0ac.ac_ppid =3D task_tgid_nr_ns(rcu_dereference(current->re=
al_parent), ns);
> --
> 1.7.2.2
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at =A0http://www.tux.org/lkml/
>
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
