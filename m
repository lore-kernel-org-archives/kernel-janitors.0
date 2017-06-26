From: Frans Klaver <fransklaver@gmail.com>
Date: Mon, 26 Jun 2017 20:57:48 +0000
Subject: Re: endian bitshift defects [ was: staging: fusb302: don't bitshift __le16 type ]
Message-Id: <20170626205748.GA1899@bugger>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170616174556.2358-1-fransklaver@gmail.com>
 <1497653077.10546.23.camel@perches.com>
 <CAH6sp9NMnVzBXZcaU=q4oBV5tAoSqyO6GEfmSgtA0U+N+ibK=w@mail.gmail.com>
 <alpine.DEB.2.20.1706231936440.2989@hadrien>
In-Reply-To: <alpine.DEB.2.20.1706231936440.2989@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: Joe Perches <joe@perches.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors <kernel-janitors@vger.kernel.org>, Guenter Roeck <linux@roeck-us.net>, Yueyao Zhu <yueyao.zhu@gmail.com>, Rui Miguel Silva <rmfrfs@gmail.com>, Guru Das Srinagesh <gurooodas@gmail.com>, Javier Martinez Canillas <javier@dowhile0.org>, devel@driverdev.osuosl.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Jun 23, 2017 at 07:37:28PM -0400, Julia Lawall wrote:
> 
> 
> On Sat, 24 Jun 2017, Frans Klaver wrote:
> 
> > Hm. For some reason the great mail filtering scheme decided to push
> > this past my inbox :-/
> >
> > On Sat, Jun 17, 2017 at 12:44 AM, Joe Perches <joe@perches.com> wrote:
> > > On Fri, 2017-06-16 at 19:45 +0200, Frans Klaver wrote:
> > >> The header field in struct pd_message is declared as an __le16 type. The
> > >> data in the message is supposed to be little endian. This means we don't
> > >> have to go and shift the individual bytes into position when we're
> > >> filling the buffer, we can just copy the contents right away. As an
> > >> added benefit we don't get fishy results on big endian systems anymore.
> > >
> > > Thanks for pointing this out.
> > >
> > > There are several instances of this class of error.
> >
> > There are other smells around __(le|be) types that show up in staging
> > that might be worth checking in the rest of the kernel as well. e.g.
> > converting to cpu and storing it back into itself (possibly with its
> > bytes reversed), direct assignments without conversion and what else
> > you might have. sparse obviously already flags anything fishy going on
> > with these types, but cannot distinguish between the classes of
> > errors. I'll need to acquaint myself with spatch a bit more to be able
> > to track that down.
> 
> If you have concrete code examples, even fake ones, illustrating a class
> of problem, then that would be great.

Alright, I'll describe two fairly simple cases for starters.

One class of issue that I have on top of mind is simply

	__le16 val;

	val = le16_to_cpu(val);

The problem there obviously being that val is supposed to be guaranteed
little endian. Sparse will throw a warning at this. It may also appear
as (or be 'fixed' as)

	__le16 val;

	le16_to_cpus(val);

Sparse doesn't flag this second version as an issue, while it causes the
same problem. It is especially a potential problem when the value is
stored in driver data.

Another smell that is prevalent, at least in staging, is

	u16 in;
	u16 out;

	out = cpu_to_le16(in);

or in one instance (drivers/staging/fbtft/fbtft-io.c) I saw

	u64 tmp;

	*(u64*)dst = cpu_to_be64(tmp);

Now these aren't necessarily problematic. Usually this typo of code is
preparing the data to be sent out in a specific byte ordering, but again
issues may arise if this specifically ordered data is stored somewhere.

I'll leave it at that for now. 

Frans
