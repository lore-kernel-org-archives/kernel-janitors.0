From: Domen Puncer <domen@coderock.org>
Date: Mon, 20 Dec 2004 12:35:41 +0000
Subject: [KJ] Re: drivers/atm/he.c remove dead code
Message-Id: <20041220123541.GA29520@nd47.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============87378688971622109=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============87378688971622109==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 19/12/04 21:38 +0100, Marcel Sebek wrote:
> @@ -147,13 +120,13 @@ static u8 read_prom_byte(struct he_dev *
>  
>  /* globals */
>  
> -struct he_dev *he_devs = NULL;
> -static int disable64 = 0;
> +struct he_dev *he_devs;

This is not static, so it won't be initialized.


	Domen

--===============87378688971622109==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============87378688971622109==--
