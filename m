From: Joe Perches <joe@perches.com>
Date: Fri, 10 Apr 2020 19:53:00 +0000
Subject: Re: [PATCH] checkpatch: check for missing \n at the end of logging message
Message-Id: <db2730700ab3eb7008413a1e7bba94ca7c49a031.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200407204908.10420-1-christophe.jaillet@wanadoo.fr>
         <8617a6b94c0644bce1fd4ca77309d67a612e6300.camel@perches.com>
         <6e52383e-100d-b016-32c2-6fb54938b6fe@wanadoo.fr>
         <c9fd4bc75812fed4799c2fb87b452b809a7e9a7a.camel@perches.com>
In-Reply-To: <c9fd4bc75812fed4799c2fb87b452b809a7e9a7a.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, apw@canonical.com, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, 2020-04-10 at 12:46 -0700, Joe Perches wrote:
> On Fri, 2020-04-10 at 19:35 +0200, Christophe JAILLET wrote:
> > Le 08/04/2020 =E0 04:14, Joe Perches a =E9crit :
> > > This works rather better:
> > > Perhaps you could test?
> []
> > I'm looking at some modification done in the last month that could have=
=20
> > been spotted by the above script.
> >=20
> >      ./scripts/checkpatch.pl -f drivers/usb/phy/phy-jz4770.c
> >=20
> > correctly spots the 3 first cases, but the 3 last (line 202, 210 and=20
> > 217) are missed.
> > I don't understand why.
>=20
> It has to do with checkpatch's single statement parsing.
>=20
> This case:
>=20
> 	if (foo)
> 		dev_warn(...);
>=20
> is parsed as a single statement but
>=20
> 	if (foo) {
> 		dev_warn(...);
> 	};
>=20
> is parsed as multiple statements so for the
> second case
>=20
> 		dev_warn(...);
>=20
> is analyzed as a separate statement.
>=20
> The regex match for this missing newline test expects
> that each printk is a separate statement so the first
> case doesn't match.
>=20
> Clearly the regex can be improved here.

So on top of the original patch:
---
 scripts/checkpatch.pl | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index f00a6c8..54eaa7 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -5675,8 +5675,8 @@ sub process {
=20
 # check for possible missing newlines at the end of common logging functio=
ns
 		if (defined($stat) &&
-		    $stat =3D~ /^\+\s*($logFunctions)\s*\((?:\s*$FuncArg\s*,\s*){0,3}\s*=
$String/ &&
-		    $1 !~ /_cont$/ && $1 =3D~ /^(?:pr|dev|netdev|netif|wiphy)_/) {
+		    $stat =3D~ /^\+\s*(?:if\s*$balanced_parens\s*)?($logFunctions)\s*\((=
?:\s*$FuncArg\s*,\s*){0,3}\s*$String/ &&
+		    $2 !~ /_cont$/ && $2 =3D~ /^(?:pr|dev|netdev|netif|wiphy)_/) {
 			my $cnt =3D statement_rawlines($stat);
 			my $extracted_string =3D "";
 			for (my $i =3D 0; $i < $cnt; $i++) {
