From: Domen Puncer <domen@coderock.org>
Date: Mon, 20 Dec 2004 20:01:05 +0000
Subject: [KJ] Re: drivers/atm/he.c remove dead code
Message-Id: <20041220200105.GC29520@nd47.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============71311097688294556=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20041220123541.GA29520@nd47.coderock.org>
In-Reply-To: <20041220123541.GA29520@nd47.coderock.org>
To: kernel-janitors@vger.kernel.org

--===============71311097688294556==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 20/12/04 09:57 -0800, Greg KH wrote:
> On Mon, Dec 20, 2004 at 01:35:41PM +0100, Domen Puncer wrote:
> > On 19/12/04 21:38 +0100, Marcel Sebek wrote:
> > > @@ -147,13 +120,13 @@ static u8 read_prom_byte(struct he_dev *
> > >  
> > >  /* globals */
> > >  
> > > -struct he_dev *he_devs = NULL;
> > > -static int disable64 = 0;
> > > +struct he_dev *he_devs;
> > 
> > This is not static, so it won't be initialized.
> 
> Huh?  Since when is that a requirement?  No, that will be initialized to
> NULL.

Right, thank you for correcting me.


	Domen

--===============71311097688294556==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============71311097688294556==--
