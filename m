From: Jan Kiszka <jan.kiszka@web.de>
Date: Sat, 30 Oct 2010 15:46:10 +0000
Subject: Re: [PATCH v2] x86: kvm: fix information leak to userland
Message-Id: <4CCC3DC2.6090505@web.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------enig6C14A3F8D8FA9A6FABCF3241"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1288447871-7715-1-git-send-email-segooon@gmail.com> <4CCC2D11.7090109@web.de> <20101030153147.GA14169@albatros>
In-Reply-To: <20101030153147.GA14169@albatros>
To: Vasiliy Kulikov <segooon@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Avi Kivity <avi@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, kvm@vger.kernel.org, linux-kernel@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig6C14A3F8D8FA9A6FABCF3241
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Am 30.10.2010 17:31, Vasiliy Kulikov wrote:
> On Sat, Oct 30, 2010 at 16:34 +0200, Jan Kiszka wrote:
>> Am 30.10.2010 16:11, Vasiliy Kulikov wrote:
>>> Structure kvm_ppc_pvinfo is copied to userland with pad field
>>> unitialized.  Structure kvm_clock_data is copied to userland with
>>> flags and pad fields unitialized.  It leads to leaking of contents
>>> of kernel stack memory.
>>
>> This description only partially matches your patch, please fix.
>=20
> What do you mean?  Two structures are copied with some fields with old
> stack values.  Smth valuable else?

I mean you aren't touching ppc code in this patch, but you are fixing
more than just the kvm_clock interface.

Jan


--------------enig6C14A3F8D8FA9A6FABCF3241
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.15 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org/

iEYEARECAAYFAkzMPcUACgkQitSsb3rl5xQ8JgCfZqJQnjleqkRU2Zn/6GL8X12C
InAAn2okk5zxAEp1qFMw6wOEL8o2oCy/
=lQYE
-----END PGP SIGNATURE-----

--------------enig6C14A3F8D8FA9A6FABCF3241--
