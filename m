From: Domen Puncer <domen@coderock.org>
Date: Mon, 04 Apr 2005 11:37:46 +0000
Subject: Re: [KJ] [PATCH] char* : drivers/char/agp/intel-agp.c
Message-Id: <20050404113746.GD7891@nd47.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============53416431728619163=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050401122030.GM5445@rhum.iomeda.fr>
In-Reply-To: <20050401122030.GM5445@rhum.iomeda.fr>
To: kernel-janitors@vger.kernel.org

--===============53416431728619163==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 01/04/05 14:20 +0200, Christophe Lucas wrote:
> Description:
> String form : char foo[] = "blah" is better than char *foo = "blah"
> 
> Signed-off-by: Christophe Lucas <clucas@rotomalug.org>

> diff -urpN -X dontdiff a/drivers/char/agp/intel-agp.c b/drivers/char/agp/intel-agp.c
> --- a/drivers/char/agp/intel-agp.c	2005-03-18 02:34:12.000000000 +0100
> +++ b/drivers/char/agp/intel-agp.c	2005-04-01 12:08:36.751735144 +0200
> @@ -1532,7 +1532,7 @@ static int __devinit agp_intel_probe(str
>  				     const struct pci_device_id *ent)
>  {
>  	struct agp_bridge_data *bridge;
> -	char *name = "(unknown)";
> +	char name[] = "(unknown)";

A few lines below there's a
	name = "440LX";
... so i don't think this will even compile.
Same goes for next, acpi patch.


	Domen

--===============53416431728619163==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============53416431728619163==--
