From: =?ISO-8859-1?Q?H=E5kon_L=F8vdal?= <hlovdal@gmail.com>
Date: Thu, 09 Feb 2006 15:35:04 +0000
Subject: Re: [KJ] Correct imprecise >= comparisons
Message-Id: <a01a16b50602090735y10f557c6ued26598025a2d463@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060208185312.GA26914@rhlx01.fht-esslingen.de>
In-Reply-To: <20060208185312.GA26914@rhlx01.fht-esslingen.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On 2/9/06, Matthew Wilcox <matthew@wil.cx> wrote:
> I wonder if we want a macro similar to min()/max().  Maybe we could
> write it as:
>
> limit(val, max);
>
> which could be defined as:
>
> #define limit(val, max)  { \
>         typeof(val) _val =3D (val); typeof(max) _max =3D (max); \
>         if (_val > _max) _val =3D _max; }
>
> Thoughts?

I also though of making a macro based on the min/max macros, but I did
not come up with a name other than set_max and I did not think that was
good enough. Using "limit" instead of "set" on the other hand I think
will be good.

In order to just use existing macros and not introducing any new a
test like
	...
	if (var > max)
		var =3D max;
	...
could be written as
	...
	var =3D min(var, max);
	...
however this approach would have two drawbacks,
  1: it always executes an assignment which is negative for performance
  2: it is a bit mentally confusing because you are using the /min/
     macro to set a /max/ value.
so this is not an option.

I support creating two "limit_max(val, max)" and "limit_min(val, min)"
macros with bodies like above.

BR H=E5kon L=F8vdal

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
