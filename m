From: Joe Perches <joe@perches.com>
Date: Mon, 16 Nov 2020 03:58:33 +0000
Subject: Re: [PATCH] MAINTAINERS: rectify file patterns for NETFILTER
Message-Id: <d03c87f9fcc4bb68c148cfad12cafef5f2385eef.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201109091942.32280-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20201109091942.32280-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Pablo Neira Ayuso <pablo@netfilter.org>, Jozsef Kadlecsik <kadlec@netfilter.org>, Florian Westphal <fw@strlen.de>, netfilter-devel@vger.kernel.org, coreteam@netfilter.org
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Pia Eichinger <pia.eichinger@st.oth-regensburg.de>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 2020-11-09 at 10:19 +0100, Lukas Bulwahn wrote:
> The two file patterns in the NETFILTER section:
>=20
> =A0=A0F:      include/linux/netfilter*
> =A0=A0F:      include/uapi/linux/netfilter*
>=20
> intended to match the directories:
>=20
> =A0=A0./include{/uapi}/linux/netfilter_{arp,bridge,ipv4,ipv6}
>=20
> A quick check with ./scripts/get_maintainer.pl --letters -f will show that
> they are not matched, though, because this pattern only matches files, but
> not directories.
>=20
> Rectify the patterns to match the intended directories.
[]
diff --git a/MAINTAINERS b/MAINTAINERS
[]
> @@ -12139,10 +12139,10 @@ W:	http://www.nftables.org/
> =A0Q:	http://patchwork.ozlabs.org/project/netfilter-devel/list/
> =A0T:	git git://git.kernel.org/pub/scm/linux/kernel/git/pablo/nf.git
> =A0T:	git git://git.kernel.org/pub/scm/linux/kernel/git/pablo/nf-next.git
> -F:	include/linux/netfilter*
> +F:	include/linux/netfilter*/
> =A0F:	include/linux/netfilter/

This line could be deleted or perhaps moved up one line above

F:	include/linux/netfilter/
F:	include/linux/netfilter*/

(as the second line already matches the first line's files too)

> =A0F:	include/net/netfilter/
> -F:	include/uapi/linux/netfilter*
> +F:	include/uapi/linux/netfilter*/
> =A0F:	include/uapi/linux/netfilter/

same here.

> =A0F:	net/*/netfilter.c
> =A0F:	net/*/netfilter/
