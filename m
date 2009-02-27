From: Hannes Eder <hannes@hanneseder.net>
Date: Fri, 27 Feb 2009 00:50:48 +0000
Subject: Re: [PATCH 02/16] x86, numa_32.c: fix sparse warning: Using plain
Message-Id: <154e089b0902261650y30e12d62u759acd9c711af2e7@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090221235706.17557.97714.stgit@vmbox.hanneseder.net>
	 <20090222000105.17557.49889.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090222000105.17557.49889.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Ingo Molnar <mingo@elte.hu>, trivial@kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Added To: Ingo Molnar <mingo@elte.hu>

On Sun, Feb 22, 2009 at 1:01 AM, Hannes Eder <hannes@hanneseder.net> wrote:
> Fix this sparse warning:
> =A0arch/x86/mm/numa_32.c:197:24: warning: Using plain integer as NULL poi=
nter
>
> Signed-off-by: Hannes Eder <hannes@hanneseder.net>
> ---
> =A0arch/x86/mm/numa_32.c | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/arch/x86/mm/numa_32.c b/arch/x86/mm/numa_32.c
> index d1f7439..3957cd6 100644
> --- a/arch/x86/mm/numa_32.c
> +++ b/arch/x86/mm/numa_32.c
> @@ -194,7 +194,7 @@ void *alloc_remap(int nid, unsigned long size)
> =A0 =A0 =A0 =A0size =3D ALIGN(size, L1_CACHE_BYTES);
>
> =A0 =A0 =A0 =A0if (!allocation || (allocation + size) >=3D node_remap_end=
_vaddr[nid])
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return NULL;
>
> =A0 =A0 =A0 =A0node_remap_alloc_vaddr[nid] +=3D size;
> =A0 =A0 =A0 =A0memset(allocation, 0, size);
>
>
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
