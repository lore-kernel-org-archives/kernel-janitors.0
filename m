From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Date: Thu, 09 Nov 2017 13:14:33 +0000
Subject: Re: bq2415x_charger: Use common error handling code in bq2415x_timer_work()
Message-Id: <20171109131433.x7xuh4bqvqm72wb5@pali>
List-Id: <kernel-janitors.vger.kernel.org>
References: <48b34d35-8c41-d25b-0cb7-6257b37c5a44@users.sourceforge.net>
 <20171109120842.GA28552@atrey.karlin.mff.cuni.cz>
 <d680ca7e-9806-1f39-80da-58fa7239a31c@users.sourceforge.net>
In-Reply-To: <d680ca7e-9806-1f39-80da-58fa7239a31c@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Pavel Machek <pavel@ucw.cz>, linux-pm@vger.kernel.org, Sebastian Reichel <sre@kernel.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Thursday 09 November 2017 14:04:19 SF Markus Elfring wrote:
> > Better fix would be to display separate messages; user is probably
> > interested in what failed...
>=20
> Which information (or wording) would you find more appropriate
> at these places?

Hi! Basically dropping your patch and instead of the "Unknown error"
return to user reason why BQ2415X_BOOST_MODE_STATUS or
BQ2415X_FAULT_STATUS commands failed. Or at least instead of the
"Unknown error" write "Unknown error during BQ2415X_FAULT_STATUS".

Basically I do not see any value in your patch. Current coding style
pattern in that function is:

do_something;
if failed:
  print error;
  return;

And your patch just changed some, but not *all* parts of code to:

do_something;
if failed:
  goto end_of_function

If you are changing coding style, I would really suggest to change it on
all places to let it consistent. Because your change introduces just
inconsistency.

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
