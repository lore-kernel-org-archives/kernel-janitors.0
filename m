From: Bernd Petrovitsch <bernd@firmix.at>
Date: Fri, 13 Nov 2009 16:42:46 +0000
Subject: Re: sizeof vs strlen (was Re: [PATCH 4/4] fs/qnx4: decrement
Message-Id: <1258130566.27859.4.camel@tara.firmix.at>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0911120849260.16627@ask.diku.dk>
	 <1258021335.3689.41.camel@tara.firmix.at>
	 <Pine.LNX.4.64.0911121632540.19779@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0911121632540.19779@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: al@alarsen.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, 2009-11-12 at 16:33 +0100, Julia Lawall wrote: 
> On Thu, 12 Nov 2009, Bernd Petrovitsch wrote:
> 
> > On Thu, 2009-11-12 at 08:49 +0100, Julia Lawall wrote:
> > > From: Julia Lawall <julia@diku.dk>
> > > 
> > > As observed by Joe Perches, sizeof of a constant string includes the
> > > trailing 0.  If what is wanted is to check the initial characters of
> > > another string, this trailing 0 should not be taken into account.  If an
> > > exact match is wanted, strcmp should be used instead.
> > [...]
> > > strncmp(foo, abc, 
> > > - sizeof(abc)
> > > + sizeof(abc)-1
> > >  )
> > > // </smpl>
> > Am I the only one who find "strlen()" instead of "sizeof()-1" here much
> > more readable (and to the point).
> > 
> > As for run-time, it shouldn't make a difference for static/constant
> > strings as gcc should be able calculate the length at compile time. And
> > if the string is not constant, sizeof() is probably wrong anyways.
> 
> Does gcc have access to the definition of strlen?  It does not seem to be 
> an inlined function, eg in lib/string.c.
Since "strlen()" is defined in the C-Standard C-compilers could rely on
the defined behaviour (but I don't know exactly how gcc behaves with
-ffreestanding for all supported versions).
Then there is __builin_strlen() (see also
http://gcc.gnu.org/onlinedocs/gcc-4.4.2/gcc/Other-Builtins.html#Other-Builtins).

Stepping a quite small abstraction layer higher:
include/linux/string.h has at teh end:
----  snip  ----
static inline bool strstarts(const char *str, const char *prefix)
{
	return strncmp(str, prefix, strlen(prefix)) = 0;
}
---- snip  ----
seems to be what most uses of strnmcp() actually are: check if one
string is a prefix of another.

	Bernd
-- 
Firmix Software GmbH                   http://www.firmix.at/
mobil: +43 664 4416156                 fax: +43 1 7890849-55
          Embedded Linux Development and Services


