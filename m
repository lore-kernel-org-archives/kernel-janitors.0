From: Christophe Lucas <clucas@rotomalug.org>
Date: Wed, 22 Jun 2005 07:04:32 +0000
Subject: Re: [KJ] [PATCH] Audit return code : drivers/char/applicom.c
Message-Id: <20050622070432.GA5054@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============98904058848538667=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050621101313.GE4880@rhum.iomeda.fr>
In-Reply-To: <20050621101313.GE4880@rhum.iomeda.fr>
To: kernel-janitors@vger.kernel.org

--===============98904058848538667==
Content-Disposition: inline
Content-Type: text/plain; charset=us-ascii

randy_dunlap (rdunlap@xenotime.net) wrote:
> On Tue, 21 Jun 2005 23:42:47 +0400 Alexey Dobriyan wrote:
> 
> | On Tuesday 21 June 2005 23:30, randy_dunlap wrote:
> | > On Tue, 21 Jun 2005 12:13:13 +0200 Christophe Lucas wrote:
> | > --- 2.6.12-orig/drivers/char/applicom.c
> | > +++ 2.6.12/drivers/char/applicom.c
> | 
> | >  void cleanup_module(void)
> | >  {
> | > -	int i;
> | > +	unsigned int i;
> | > 
> | > what is the purpose of this change?  no description for it.
> | 
> | IIRC, gcc 4 sez something about comparing signed and unsigned blah blah, despite
> | 
> | 	int i;
> | 	for (i = 0; i < N; i++)
> | 
> | being standard C idiom.
> 
> I suspected that was the case (problem), but the patch description
> should say something about that...

Hi,

Sorry, s/int i/unsigned int i/ is as said by Alexey one entry in kj
TODO. I will resend patch with correct description, put retval
assignment out if if() statement.

Thanks for all your good advise.
 
						- Christophe

--===============98904058848538667==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============98904058848538667==--
