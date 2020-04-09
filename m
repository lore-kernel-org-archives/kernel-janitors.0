From: Joe Perches <joe@perches.com>
Date: Thu, 09 Apr 2020 03:10:23 +0000
Subject: Re: [PATCH] checkpatch: check for missing \n at the end of logging message
Message-Id: <efb5a518fdc47f0120b94a7e8a95d275c0f4ad43.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200407204908.10420-1-christophe.jaillet@wanadoo.fr>
         <8617a6b94c0644bce1fd4ca77309d67a612e6300.camel@perches.com>
         <4b7e1cf3-6fa7-60af-a1d3-2457339dbe8a@wanadoo.fr>
In-Reply-To: <4b7e1cf3-6fa7-60af-a1d3-2457339dbe8a@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Marion & Christophe JAILLET <christophe.jaillet@wanadoo.fr>, apw@canonical.com, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, 2020-04-08 at 22:23 +0200, Marion & Christophe JAILLET wrote:
> Le 08/04/2020 =E0 04:14, Joe Perches a =E9crit :
> > This works rather better:
> >=20
> > Perhaps you could test?
> > ---
> >=20
> > v2:
> >=20
> > o Avoid pr_cont
> > o Use only last format line if split across multiple lines
> >=20
> >   scripts/checkpatch.pl | 22 ++++++++++++++++++++++
> >   1 file changed, 22 insertions(+)
> >=20
> > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> > index d64c67..f00a6c8 100755
> > --- a/scripts/checkpatch.pl
> > +++ b/scripts/checkpatch.pl
> > @@ -5673,6 +5673,28 @@ sub process {
> >   			}
> >   		}
> >  =20
> > +# check for possible missing newlines at the end of common logging fun=
ctions
> > +		if (defined($stat) &&
> > +		    $stat =3D~ /^\+\s*($logFunctions)\s*\((?:\s*$FuncArg\s*,\s*){0,3=
}\s*$String/ &&
> > +		    $1 !~ /_cont$/ && $1 =3D~ /^(?:pr|dev|netdev|netif|wiphy)_/) {
> > +			my $cnt =3D statement_rawlines($stat);
> > +			my $extracted_string =3D "";
> > +			for (my $i =3D 0; $i < $cnt; $i++) {
> > +				next if ($lines[$linenr + $i - 1] !~ /$String\s*[,\)]/);
> > +				$extracted_string =3D get_quoted_string($lines[$linenr + $i - 1],
> > +								      $rawlines[$linenr + $i - 1]);
> > +				last if ($extracted_string ne "");
> > +			}
> > +			if ($extracted_string ne "" && $extracted_string !~ /\\n"$/) {
> > +				my $herectx =3D $here . "\n";
> > +				for (my $n =3D 0; $n < $cnt; $n++) {
> > +					$herectx .=3D  raw_line($linenr, $n) . "\n";
> > +				}
> > +				WARN("MISSING_FORMAT_NEWLINE",
> > +				     "Possible missing '\\n' at the end of a logging message forma=
t string\n" . $herectx);
> > +			}
> > +		}
> > +
> >   # check for logging functions with KERN_<LEVEL>
> >   		if ($line !~ /printk(?:_ratelimited|_once)?\s*\(/ &&
> >   		    $line =3D~ /\b$logFunctions\s*\(.*\b(KERN_[A-Z]+)\b/) {
> >=20
> For what I wanted to check and according to the few tests I've made, it=20
> looks fine.
>=20
> Thank you very much for sharing this much more robust (and working)=20
> alternative.
>=20
> For what it worth: (i.e. much more tests should be done)
> Tested-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Then I think you really haven't tested it very thoroughly.

For instance:

$ git ls-files -- 'drivers/*.[ch]' | \
  xargs ./scripts/checkpatch.pl -f --quiet --no-summary --types=3DMISSING_F=
ORMAT_NEWLINE

emits many false positives.

Some types of false positives:

o Many of the formats seem to end in a ':' or a ' '
  maybe those should be excluded
   #86: FILE: drivers/android/binder_alloc_selftest.c:86:
   +	pr_err("free seq: ");

   o Split string formats should be excluded better
     as only the first string fragment is checked:
   #1001: FILE: drivers/ata/pata_octeon_cf.c:1001:
   +	dev_info(&pdev->dev, "version " DRV_VERSION" %d bit%s.\n",
   +		 is_16bit ? 16 : 8,
   +		 cf_port->is_true_ide ? ", True IDE" : "");

   probably a few others, including a desire to check
   if a pr_cont is below the use within a few lines.

   > Maybe, at least a Suggested-By: would be appreciated.

No worries, when it's cooked, it'll have that.

cheers, Joe
