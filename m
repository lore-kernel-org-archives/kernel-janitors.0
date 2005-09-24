From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Sat, 24 Sep 2005 18:39:52 +0000
Subject: Re: [KJ] hint, hint...
Message-Id: <20050924183952.GA32094@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============081263807773739538=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050924155552.GA31609@mipter.zuzino.mipt.ru>
In-Reply-To: <20050924155552.GA31609@mipter.zuzino.mipt.ru>
To: kernel-janitors@vger.kernel.org

--===============081263807773739538==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Sep 24, 2005 at 10:10:21AM -0700, Randy.Dunlap wrote:
> On Sat, 24 Sep 2005 19:55:52 +0400 Alexey Dobriyan wrote:
> > -	/*  0 */ DECLARE_PIIX_DEV("PIIXa"),
> > -	/*  1 */ DECLARE_PIIX_DEV("PIIXb"),
> > -
> > -	{	/* 2 */
> > +	[ 0] = DECLARE_PIIX_DEV("PIIXa"),
> > +	[ 1] = DECLARE_PIIX_DEV("PIIXb"),
> > +	[ 2] = {

> Even in cases where the order/location/index doesn't matter?
> (I hope not.)

You mean cases where author doesn't care about particular order, but put
comments just to make counting easier? I can't recall a single place,
can you?


--===============081263807773739538==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============081263807773739538==--
