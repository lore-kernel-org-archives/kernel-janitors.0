From: maximilian attems <janitor@sternwelten.at>
Date: Sat, 14 Aug 2004 19:46:54 +0000
Subject: Re: [Kernel-janitors] gcc compilation warning fix
Message-Id: <20040814194654.GN1756@stro.at>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============73772886172906471=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============73772886172906471==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, 25 Jul 2004, Alexander Nyberg wrote:

> The actual prototype is:
> typedef	void (*acpi_gpe_handler) (void *context);
> 
> (noone was even using the return value)
 
already patched in 2.6.8!


--===============73772886172906471==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============73772886172906471==--
