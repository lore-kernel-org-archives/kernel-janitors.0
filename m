From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 22 Aug 2016 20:50:15 +0000
Subject: Re: [PATCH] checkpatch: See if modified files are marked obsolete in MAINTAINERS
Message-Id: <30522d64-8303-cf13-d967-a5759aeb2278@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <87shtwvm63.fsf@kamboji.qca.qualcomm.com>
 <7ceaa510dc9d2df05ec4b456baed7bb1415550b3.1471889575.git.joe@perches.com>
In-Reply-To: <7ceaa510dc9d2df05ec4b456baed7bb1415550b3.1471889575.git.joe@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Joe Perches <joe@perches.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Kalle Valo <kvalo@codeaurora.org>, Arend van Spriel <arend.vanspriel@broadcom.com>, Andy Whitcroft <apw@canonical.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, Jouni Malinen <j@w1.fi>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, linux-kernel@vger.kernel.org

> @@ -2289,6 +2299,10 @@ sub process {
>  		}
> =20
>  		if ($found_file) {
> +			if (is_maintained_obsolete($realfile)) {
> +				WARN("OBSOLETE",
> +				     "$realfile is marked as 'obsolete' in the MAINTAINERS hierarchy=
.  No unnecessary modifications please.\n");
> +			}

How do you think about to avoid a double negation in such a warning message?

Would a wording like "=E2=80=A6 Only really necessary modifications please.=
\n"
be more useful here?

Regards,
Markus
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
