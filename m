From: "Randy.Dunlap" <rdunlap@xenotime.net>
Date: Wed, 28 Sep 2005 18:42:23 +0000
Subject: Re: [KJ] Need to get some very basic things sorted out
Message-Id: <Pine.LNX.4.58.0509281140570.14803@shark.he.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============18417003576560287=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <433AB34E.90509@users.sourceforge.net>
In-Reply-To: <433AB34E.90509@users.sourceforge.net>
To: kernel-janitors@vger.kernel.org

--===============18417003576560287==
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Wed, 28 Sep 2005, Ricardo Nabinger Sanchez wrote:

> Quoting  Alexey Dobriyan <adobriyan@gmail.com>
> Sent on  Wed, 28 Sep 2005 21:56:14 +0400
>
> Hello,
>
> > 	buf = kmalloc(256, GFP_KERNEL);
> > 	if (!buf)
> > 		return -ENOMEM;
> > 	buf[0] = 'L';
>
> *please* correct me if I'm wrong, but I remember reading somewhere a Linus'
> message stating that one should not use "if (!pointer)" for pointers when
> it is intended to do "if (pointer == NULL)".  in short, what I remember is
> that one should not assume that NULL == 0, thus the explicit NULL checking.
>
> a quick search revealed these:
>
> 	http://lwn.net/Articles/93574/
> 	http://lwn.net/Articles/93577/

These say:
	don't use 0 for a (null) pointer and
	don't use NULL for an integer value.

> are these still valid?  (I presume yes, but...)

Sure, those are valid, but they aren't the same as the
first example above.  I don't see anything wrong with what
Alexey wrote.

-- 
~Randy

--===============18417003576560287==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============18417003576560287==--
