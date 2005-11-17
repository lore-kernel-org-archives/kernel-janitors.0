From: Andrew Morton <akpm@osdl.org>
Date: Thu, 17 Nov 2005 23:12:43 +0000
Subject: [KJ] Re: [PATCH] drivers/char: Use ARRAY_SIZE macro
Message-Id: <20051117151243.08b30e29.akpm@osdl.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============54257813932675591=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============54257813932675591==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Tobias Klauser <tklauser@nuerscht.ch> wrote:
>
> @@ -913,15 +913,10 @@ static int stl_parsebrd(stlconf_t *confp
>  	for (sp = argp[0], i = 0; ((*sp != 0) && (i < 25)); sp++, i++)
>  		*sp = TOLOWER(*sp);
>  
> -	nrbrdnames = sizeof(stl_brdstr) / sizeof(stlbrdtype_t);
> -	for (i = 0; (i < nrbrdnames); i++) {
> +	for (i = 0; i < ARRAY_SIZE(stl_brdstr); i++) {
>  		if (strcmp(stl_brdstr[i].name, argp[0]) == 0)
>  			break;
>  	}
> -	if (i >= nrbrdnames) {
> -		printk("STALLION: unknown board name, %s?\n", argp[0]);
> -		return(0);
> -	}
>  
>  	confp->brdtype = stl_brdstr[i].type;

The second change here in stallion.c seems wrong.

I replaced it with

	if (i == ARRAY_SIZE(stl_brdstr)) {
		printk("STALLION: unknown board name, %s?\n", argp[0]);
		return 0;
	}


--===============54257813932675591==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============54257813932675591==--
