From: Joe Perches <joe@perches.com>
Date: Sun, 04 Sep 2016 19:23:42 +0000
Subject: Re: [PATCH] x86/amd_nb: Use kmalloc_array() in amd_cache_gart()
Message-Id: <1473017022.5018.58.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <3b30d96b-9280-623d-2bcb-c24e2c94e425@users.sourceforge.net>
In-Reply-To: <3b30d96b-9280-623d-2bcb-c24e2c94e425@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: SF Markus Elfring <elfring@users.sourceforge.net>, x86@kernel.org, Borislav Petkov <bp@suse.de>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, Paolo Bonzini <pbonzini@redhat.com>

On Sun, 2016-09-04 at 21:08 +0200, SF Markus Elfring wrote:

> * A multiplication for the size determination of a memory allocation
> =A0 indicated that an array data structure should be processed.
> =A0 Thus use the corresponding function "kmalloc_array".
>=20
> =A0 This issue was detected by using the Coccinelle software.
>=20
> * Replace the specification of a data type by a pointer dereference
> =A0 to make the corresponding size determination a bit safer according to
> =A0 the Linux coding style convention.
[]
> diff --git a/arch/x86/kernel/amd_nb.c b/arch/x86/kernel/amd_nb.c
[]
> @@ -226,7 +226,9 @@ static void amd_cache_gart(void)
> =A0	if (!amd_nb_has_feature(AMD_NB_GART))
> =A0		return;
> =A0
> -	flush_words =3D kmalloc(amd_nb_num() * sizeof(u32), GFP_KERNEL);
> +	flush_words =3D kmalloc_array(amd_nb_num(),
> +				=A0=A0=A0=A0sizeof(*flush_words),
> +				=A0=A0=A0=A0GFP_KERNEL);

Markus, this sort of change really isn't very useful.

amd_nb_num is a u16 and is really just a count of
northbridges in the system.

It'll never be a particular high number that could
possibly overflow a size_t of num * sizeof(u32).

Detecting an inconsistency is different than an issue
that has any real significance.

Please stop blindly converting these from one form to
another. =A0Please inspect these potential changes
first and find instances where this conversion could
actually matter before sending auto-generated patches.

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
