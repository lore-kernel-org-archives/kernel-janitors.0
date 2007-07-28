From: Markus Gothe <markus.gothe@27m.se>
Date: Sat, 28 Jul 2007 12:43:49 +0000
Subject: Re: [PATCH 10/68] 0 -> NULL, for arch/mips
Message-Id: <CF450A74-EB6C-41EC-AB9B-AD618E10FFBB@27m.se>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Apple-Mail-1--986484589"
List-Id: <kernel-janitors.vger.kernel.org>
References: <200707270945.LAA17237@ifs.emn.fr>
In-Reply-To: <200707270945.LAA17237@ifs.emn.fr>
To: Yoann Padioleau <padator@wanadoo.fr>
Cc: kernel-janitors@vger.kernel.org, ralf@linux-mips.org, linux-mips@linux-mips.org, akpm@linux-foundation.org, linux-kernel@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--Apple-Mail-1--986484589
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=ISO-8859-1; delsp=yes; format=flowed

Usually it's not only cleaner, it's what you want to do... AFAIK =20
'NULL' is implemented/defined by the compiler, so if you've got a =20
compiler which defines NULL otherwise than( a pointer to) zero you're =20=

screwed. ;)

//Markus

On 27 Jul, 2007, at 11:45 , Yoann Padioleau wrote:

>
> When comparing a pointer, it's clearer to compare it to NULL than =20
> to 0.
>
> Here is an excerpt of the semantic patch:
>
> @@
> expression *E;
> @@
>
>   E =3D=3D
> - 0
> + NULL
>
> @@
> expression *E;
> @@
>
>   E !=3D
> - 0
> + NULL
>
> Signed-off-by: Yoann Padioleau <padator@wanadoo.fr>
> Cc: ralf@linux-mips.org
> Cc: linux-mips@linux-mips.org
> Cc: akpm@linux-foundation.org
> ---
>
>  ops-emma2rh.c |    2 +-
>  ops-pnx8550.c |   12 ++++++------
>  2 files changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/arch/mips/pci/ops-emma2rh.c b/arch/mips/pci/ops-emma2rh.c
> index 38f1816..d31bfc6 100644
> --- a/arch/mips/pci/ops-emma2rh.c
> +++ b/arch/mips/pci/ops-emma2rh.c
> @@ -45,7 +45,7 @@ static int check_args(struct pci_bus *bu
>  	/* check if the bus is top-level */
>  	if (bus->parent !=3D NULL) {
>  		*bus_num =3D bus->number;
> -		db_assert(bus_num !=3D 0);
> +		db_assert(bus_num !=3D NULL);
>  	} else
>  		*bus_num =3D 0;
>
> diff --git a/arch/mips/pci/ops-pnx8550.c b/arch/mips/pci/ops-pnx8550.c
> index f556b7a..d610646 100644
> --- a/arch/mips/pci/ops-pnx8550.c
> +++ b/arch/mips/pci/ops-pnx8550.c
> @@ -117,7 +117,7 @@ read_config_byte(struct pci_bus *bus, un
>  	unsigned int data =3D 0;
>  	int err;
>
> -	if (bus =3D=3D 0)
> +	if (bus =3D=3D NULL)
>  		return -1;
>
>  	err =3D config_access(PCI_CMD_CONFIG_READ, bus, devfn, where, =
~(1 =20
> << (where & 3)), &data);
> @@ -145,7 +145,7 @@ read_config_word(struct pci_bus *bus, un
>  	unsigned int data =3D 0;
>  	int err;
>
> -	if (bus =3D=3D 0)
> +	if (bus =3D=3D NULL)
>  		return -1;
>
>  	if (where & 0x01)
> @@ -168,7 +168,7 @@ static int
>  read_config_dword(struct pci_bus *bus, unsigned int devfn, int =20
> where, u32 * val)
>  {
>  	int err;
> -	if (bus =3D=3D 0)
> +	if (bus =3D=3D NULL)
>  		return -1;
>
>  	if (where & 0x03)
> @@ -185,7 +185,7 @@ write_config_byte(struct pci_bus *bus, u
>  	unsigned int data =3D (unsigned int)val;
>  	int err;
>
> -	if (bus =3D=3D 0)
> +	if (bus =3D=3D NULL)
>  		return -1;
>
>  	switch (where & 0x03) {
> @@ -213,7 +213,7 @@ write_config_word(struct pci_bus *bus, u
>  	unsigned int data =3D (unsigned int)val;
>  	int err;
>
> -	if (bus =3D=3D 0)
> +	if (bus =3D=3D NULL)
>  		return -1;
>
>  	if (where & 0x01)
> @@ -235,7 +235,7 @@ static int
>  write_config_dword(struct pci_bus *bus, unsigned int devfn, int =20
> where, u32 val)
>  {
>  	int err;
> -	if (bus =3D=3D 0)
> +	if (bus =3D=3D NULL)
>  		return -1;
>
>  	if (where & 0x03)
>
>

_______________________________________

Mr Markus Gothe
Software Engineer

Phone: +46 (0)13 21 81 20 (ext. 1046)
Fax: +46 (0)13 21 21 15
Mobile: +46 (0)73 718 72 80
Diskettgatan 11, SE-583 35 Link=F6ping, Sweden
www.27m.com



--Apple-Mail-1--986484589
content-type: application/pgp-signature; x-mac-type=70674453;
	name=PGP.sig
content-description: This is a digitally signed message part
content-disposition: inline; filename=PGP.sig
content-transfer-encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (Darwin)

iD8DBQFGqzoF6I0XmJx2NrwRArLyAJ9DvrSQ783776HhKqV6qQ6TFoljdwCfejWJ
dLC8Ljd1xstD3ThVPdCmwJM=
=as6o
-----END PGP SIGNATURE-----

--Apple-Mail-1--986484589--
