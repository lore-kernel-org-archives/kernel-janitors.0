From: Joe Perches <joe@perches.com>
Date: Sat, 11 Apr 2020 10:10:36 +0000
Subject: Andy? checkpatch $stat question (was: Re: [PATCH] checkpatch: check for missing \n at the end of log
Message-Id: <6403ebf6b928d94268e00d52371c6aec912c3335.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200407204908.10420-1-christophe.jaillet@wanadoo.fr>
         <8617a6b94c0644bce1fd4ca77309d67a612e6300.camel@perches.com>
         <6e52383e-100d-b016-32c2-6fb54938b6fe@wanadoo.fr>
         <c9fd4bc75812fed4799c2fb87b452b809a7e9a7a.camel@perches.com>
         <db2730700ab3eb7008413a1e7bba94ca7c49a031.camel@perches.com>
         <215f2a43-6677-04cd-f376-bd7cd051b626@wanadoo.fr>
In-Reply-To: <215f2a43-6677-04cd-f376-bd7cd051b626@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, apw@canonical.com, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Andy Whitcroft:  checkpatch internals question for you below:

On Sat, 2020-04-11 at 08:48 +0200, Christophe JAILLET wrote:
> Le 10/04/2020 =E0 21:53, Joe Perches a =E9crit :
> > On Fri, 2020-04-10 at 12:46 -0700, Joe Perches wrote:
> > > On Fri, 2020-04-10 at 19:35 +0200, Christophe JAILLET wrote:
> > > > Le 08/04/2020 =E0 04:14, Joe Perches a =E9crit :
> > > > > This works rather better:
> > > > > Perhaps you could test?
> > > []
> > > > I'm looking at some modification done in the last month that could =
have
> > > > been spotted by the above script.
> > > >=20
> > > >       ./scripts/checkpatch.pl -f drivers/usb/phy/phy-jz4770.c
> > > >=20
> > > > correctly spots the 3 first cases, but the 3 last (line 202, 210 and
> > > > 217) are missed.
> > > > I don't understand why.
> > > It has to do with checkpatch's single statement parsing.
> > >=20
> > > This case:
> > >=20
> > > 	if (foo)
> > > 		dev_warn(...);
> > >=20
> > > is parsed as a single statement but
> > >=20
> > > 	if (foo) {
> > > 		dev_warn(...);
> > > 	};
> > >=20
> > > is parsed as multiple statements so for the
> > > second case
> > >=20
> > > 		dev_warn(...);
> > >=20
> > > is analyzed as a separate statement.
> > >=20
> > > The regex match for this missing newline test expects
> > > that each printk is a separate statement so the first
> > > case doesn't match.
> > >=20
> > > Clearly the regex can be improved here.
> > So on top of the original patch:
> > ---
> >   scripts/checkpatch.pl | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> > index f00a6c8..54eaa7 100755
> > --- a/scripts/checkpatch.pl
> > +++ b/scripts/checkpatch.pl
> > @@ -5675,8 +5675,8 @@ sub process {
> >  =20
> >   # check for possible missing newlines at the end of common logging fu=
nctions
> >   		if (defined($stat) &&
> > -		    $stat =3D~ /^\+\s*($logFunctions)\s*\((?:\s*$FuncArg\s*,\s*){0,3=
}\s*$String/ &&
> > -		    $1 !~ /_cont$/ && $1 =3D~ /^(?:pr|dev|netdev|netif|wiphy)_/) {
> > +		    $stat =3D~ /^\+\s*(?:if\s*$balanced_parens\s*)?($logFunctions)\s=
*\((?:\s*$FuncArg\s*,\s*){0,3}\s*$String/ &&
> > +		    $2 !~ /_cont$/ && $2 =3D~ /^(?:pr|dev|netdev|netif|wiphy)_/) {
> >   			my $cnt =3D statement_rawlines($stat);
> >   			my $extracted_string =3D "";
> >   			for (my $i =3D 0; $i < $cnt; $i++) {
>=20
> Hi Joe,
>=20
> This fixes the use case for  drivers/usb/phy/phy-jz4770.c
>=20
>      ./scripts/checkpatch.pl -f drivers/usb/gadget/udc/tegra-xudc.c
>=20
> is missing line 691.

Turns out checkpatch also considers a close brace
followed by another statement block a single statement
so that test could be:

		    $stat =3D~ /^\+\s*\}?\s*(?:if\s*$balanced_parens\s*)?($logFunctions)\=
s*\((?:\s*$FuncArg\s*,\s*){0,3}\s*$String/ &&
		    $2 !~ /_cont$/ && $2 =3D~ /^(?:pr|dev|netdev|netif|wiphy)_/) {

But that seems odd and I wonder if Andy agrees
so I have a question for Andy about the use of
ctx_statement_block and its implementation.

It seems that $suppress_statement should be updated
when the cond return value does not start with { so
that code like

struct foo *
function(
	 int arg1,
	 long arg2,
	 struct bar *baz)
{
	[implementation...]
}

allows skipping the creation of a new $stat for each
line of the function arguments.  Instead there would
be just 2 $stat blocks created, one for the function
with its args and implementation, another for just
the implementation with braces.

Perhaps this is proper, but perhaps the $line_nr_next
return value should be updated in ctx_statement_block
instead.

Also a $stat that starts with a close brace is odd
and probably not good.

Thoughts?

---
diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 54eaa7..8ef95b 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3558,7 +3558,10 @@ sub process {
 			($stat, $cond, $line_nr_next, $remain_next, $off_next)  				ctx_stateme=
nt_block($linenr, $realcnt, 0);
 			$stat =3D~ s/\n./\n /g;
-			$cond =3D~ s/\n./\n /g;
+			my $condcnt =3D $cond =3D~ s/\n./\n /g;
+			if ($cond !~ /^.\s*\}/) {
+				$suppress_statement =3D $linenr + $condcnt;
+			}
=20
 #print "linenr<$linenr> <$stat>\n";
 			# If this statement has no statement boundaries within
