From: Christophe Lucas <clucas@rotomalug.org>
Date: Mon, 21 Nov 2005 21:30:48 +0000
Subject: Re: [KJ] Re: [PATCH] drivers/char: Use ARRAY_SIZE macro
Message-Id: <20051121213048.GA31916@rotomalug.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============52214048705660931=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20051117151243.08b30e29.akpm@osdl.org>
In-Reply-To: <20051117151243.08b30e29.akpm@osdl.org>
To: kernel-janitors@vger.kernel.org

--===============52214048705660931==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Andrew Morton (akpm@osdl.org) wrote:
> Tobias Klauser <tklauser@nuerscht.ch> wrote:
> >
> > @@ -913,15 +913,10 @@ static int stl_parsebrd(stlconf_t *confp
> >  	for (sp = argp[0], i = 0; ((*sp != 0) && (i < 25)); sp++, i++)
> >  		*sp = TOLOWER(*sp);
> >  
> > -	nrbrdnames = sizeof(stl_brdstr) / sizeof(stlbrdtype_t);
> > -	for (i = 0; (i < nrbrdnames); i++) {
> > +	for (i = 0; i < ARRAY_SIZE(stl_brdstr); i++) {
> >  		if (strcmp(stl_brdstr[i].name, argp[0]) == 0)
> >  			break;
> >  	}
> > -	if (i >= nrbrdnames) {
> > -		printk("STALLION: unknown board name, %s?\n", argp[0]);
> > -		return(0);
> > -	}
> >  
> >  	confp->brdtype = stl_brdstr[i].type;
> 
> The second change here in stallion.c seems wrong.
> 
> I replaced it with
> 
> 	if (i == ARRAY_SIZE(stl_brdstr)) {
> 		printk("STALLION: unknown board name, %s?\n", argp[0]);
> 		return 0;
> 	}
 
Should correct KERN_* constant be used here in printk(); ? 

				- Christophe (clucas@rotomalug.org)


--===============52214048705660931==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============52214048705660931==--
