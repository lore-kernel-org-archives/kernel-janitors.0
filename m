From: Paul Bolle <pebolle@tiscali.nl>
Date: Thu, 29 Sep 2016 11:45:03 +0000
Subject: Re: [PATCH 01/10] dm snapshot: Use kmalloc_array() in init_origin_hash()
Message-Id: <1475149503.31297.14.camel@tiscali.nl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
         <080668d9-1e1e-e208-f9ea-ff718e8070e5@users.sourceforge.net>
         <3861d349-48fd-162b-a749-83e007f70b41@users.sourceforge.net>
         <1475142864.31297.5.camel@tiscali.nl> <1475143376.1946.2.camel@perches.com>
         <1475147577.31297.11.camel@tiscali.nl>
In-Reply-To: <1475147577.31297.11.camel@tiscali.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Joe Perches <joe@perches.com>, Andy Whitcroft <apw@canonical.com>
Cc: SF Markus Elfring <elfring@users.sourceforge.net>, dm-devel@redhat.com, linux-raid@vger.kernel.org, Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>, Shaohua Li <shli@kernel.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

On Thu, 2016-09-29 at 13:12 +0200, Paul Bolle wrote:
> Or did I misread that test?

I finally did some digging: commit=C2=A0e367455a9f25 ("checkpatch: emit
fewer kmalloc_array/kcalloc conversion warnings") shows I didn't.


Paul Bolle
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
