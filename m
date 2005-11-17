From: Andrew Morton <akpm@osdl.org>
Date: Thu, 17 Nov 2005 23:15:55 +0000
Subject: [KJ] Re: [PATCH] drivers/char: Use ARRAY_SIZE macro
Message-Id: <20051117151555.60630250.akpm@osdl.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============3302045241053122=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20051117151243.08b30e29.akpm@osdl.org>
In-Reply-To: <20051117151243.08b30e29.akpm@osdl.org>
To: kernel-janitors@vger.kernel.org

--===============3302045241053122==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Tobias Klauser <tklauser@nuerscht.ch> wrote:
>
> @@ -979,15 +977,10 @@ static int stli_parsebrd(stlconf_t *conf
>  	for (sp = argp[0], i = 0; ((*sp != 0) && (i < 25)); sp++, i++)
>  		*sp = TOLOWER(*sp);
>  
> -	nrbrdnames = sizeof(stli_brdstr) / sizeof(stlibrdtype_t);
> -	for (i = 0; (i < nrbrdnames); i++) {
> +	for (i = 0; i < ARRAY_SIZE(stli_brdstr); i++) {
>  		if (strcmp(stli_brdstr[i].name, argp[0]) == 0)
>  			break;
>  	}
> -	if (i >= nrbrdnames) {
> -		printk("STALLION: unknown board name, %s?\n", argp[0]);
> -		return(0);
> -	}
>  
>  	confp->brdtype = stli_brdstr[i].type;

Same problem here.

	if (i == ARRAY_SIZE(stli_brdstr)) {
		printk("STALLION: unknown board name, %s?\n", argp[0]);
		return 0;
	}


--===============3302045241053122==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============3302045241053122==--
