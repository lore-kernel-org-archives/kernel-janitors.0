From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Date: Tue, 24 Jan 2012 20:22:03 +0000
Subject: Re: [PATCH 1/15] sound/soc/mxs/mxs-saif.c: add missing iounmap
Message-Id: <20120124202203.GD1135@opensource.wolfsonmicro.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="ZmUaFz6apKcXQszQ"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1326362117-29371-1-git-send-email-Julia.Lawall@lip6.fr>
	<7FE21149F4667147B645348EC605788508FBDB@039-SN2MPN1-013.039d.mgd.msft.net>
	<alpine.DEB.2.02.1201241828480.1779@localhost6.localdomain6>
In-Reply-To: <alpine.DEB.2.02.1201241828480.1779@localhost6.localdomain6>
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, Takashi Iwai <tiwai@suse.de>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Dong Aisheng-B29396 <B29396@freescale.com>, Liam Girdwood <lrg@ti.com>


--ZmUaFz6apKcXQszQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 24, 2012 at 06:29:13PM +0100, Julia Lawall wrote:

>  	if (IS_ERR(saif->clk)) {
> -		ret = PTR_ERR(saif->clk);
>  		dev_err(&pdev->dev, "Cannot get the clock: %d\n",
>  			ret);
> -		goto failed_clk;
> +		return PTR_ERR(saif->clk);

Looks like the transformation is overly enthusiastic here - the
assignment to ret is removed but ret is used in the log message.

--ZmUaFz6apKcXQszQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPHxLlAAoJEBus8iNuMP3dRcoP/31i6xIi74++d1GCCQJhMXvL
y/Exm6Y/12dxFb+6okcsctWSlbd+thsRQHhYQduHQ2O1v2h8yH0PtVYhHA+tQ+r2
OjBG/yOkQocRLFZvpVJH3I0oLP+oZrLRi7xwt+LLlw2fgQs8FLny595koFklzuoE
tfuQ+B1as7YvByE2CLGbrRIZjDDl9tOaU0Hwjl7hC6Lnlg842IqQBTiYCSTozOjJ
ao0jygFQvaeogVVH3lXb90CLSZsZ2oeI+/VozkqA+LcxQ5qv5Q+T09xD+4YbviQ1
VYMMc/SeQeglxADZejiRYM67Ouy5Rj4PgEYn2BiFcXDad7Rf2xiUW4VNBsC9OL71
X6G55nOhspzLxhqB4JCLX+bb2jNrYLTXUylVMcPdGjTGUkW0MyITK2DCp9MfhY+S
+zYUY8CvF6vBFEVFL2hUF3LTzAiv7SFEbkgIISyPVYUZonQ5oKiKiD4Dvn45RNCM
YrW36zfawWEzXhBGGSg8FPECBJQJG9ELV7EbtcY5pQ88q3jiA30Va8N4EIyqmiyg
3qX42KaCXN1kiSfGw0wDzinx+NULAXU8novUHBC9uxv5EJukyWw9kEC0wglK/oXS
BMJ6QrdQ/J58LyU7dzrLHIw3IkJFPJlF2PfPjauy1/gfABpIpBOkZ7eve3up2+T1
Fb1xUFskg2+dYnINkZKJ
=NUn1
-----END PGP SIGNATURE-----

--ZmUaFz6apKcXQszQ--
