From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 15 Dec 2015 18:02:44 +0000
Subject: Re: staging: lustre: Delete unnecessary goto statements in six functions
Message-Id: <567055C4.8000806@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <566D7733.1030102@users.sourceforge.net>
 <566D7830.9060000@users.sourceforge.net>
 <1450189676.3551.1.camel@perches.com> <20151215144133.GC5284@mwanda>
 <1450191751.3551.14.camel@perches.com>
In-Reply-To: <1450191751.3551.14.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Joe Perches <joe@perches.com>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: Andreas Dilger <andreas.dilger@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Oleg Drokin <oleg.drokin@intel.com>, lustre-devel@lists.lustre.org, devel@driverdev.osuosl.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

> This is the original code:
Really =85?
> 	result =3D baz();
> 	if (result)
> 		goto label;
>
> label:
> 	go on...

I do not see such a source code structure
at the six places I propose to clean-up.


> I don't find the test->goto label; label: use offensive,
> but if he does, I think keeping a blank line in place of
> the test->goto might be better.

I find this an interesting view on source code layout.
Are there any more opinions around such implementation details?

Regards,
Markus
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
