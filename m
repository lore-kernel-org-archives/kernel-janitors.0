From: Joe Perches <joe@perches.com>
Date: Fri, 10 Apr 2020 19:46:49 +0000
Subject: Re: [PATCH] checkpatch: check for missing \n at the end of logging message
Message-Id: <c9fd4bc75812fed4799c2fb87b452b809a7e9a7a.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200407204908.10420-1-christophe.jaillet@wanadoo.fr>
         <8617a6b94c0644bce1fd4ca77309d67a612e6300.camel@perches.com>
         <6e52383e-100d-b016-32c2-6fb54938b6fe@wanadoo.fr>
In-Reply-To: <6e52383e-100d-b016-32c2-6fb54938b6fe@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, apw@canonical.com, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, 2020-04-10 at 19:35 +0200, Christophe JAILLET wrote:
> Le 08/04/2020 =E0 04:14, Joe Perches a =E9crit :
> > This works rather better:
> > Perhaps you could test?
[]
> I'm looking at some modification done in the last month that could have=20
> been spotted by the above script.
>=20
>      ./scripts/checkpatch.pl -f drivers/usb/phy/phy-jz4770.c
>=20
> correctly spots the 3 first cases, but the 3 last (line 202, 210 and=20
> 217) are missed.
> I don't understand why.

It has to do with checkpatch's single statement parsing.

This case:

	if (foo)
		dev_warn(...);

is parsed as a single statement but

	if (foo) {
		dev_warn(...);
	};

is parsed as multiple statements so for the
second case

		dev_warn(...);

is analyzed as a separate statement.

The regex match for this missing newline test expects
that each printk is a separate statement so the first
case doesn't match.

Clearly the regex can be improved here.

cheers, Joe
