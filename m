From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 06 Oct 2016 18:04:55 +0000
Subject: Re: md/raid10: Replace printk() calls by the usage of higher level interfaces
Message-Id: <21fb08b6-d5b7-0dd6-0cbd-0f0a4bf56a9e@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <786843ef-4b6f-eb04-7326-2f6f5b408826@users.sourceforge.net>
 <f9f16d1c-c50d-d4be-a6ba-2cb7081eb9b5@users.sourceforge.net>
 <1475771616.1914.9.camel@perches.com>
 <321cc4aa-679a-a2fe-be0b-96285b19e489@users.sourceforge.net>
 <1475775546.1914.15.camel@perches.com>
In-Reply-To: <1475775546.1914.15.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Joe Perches <joe@perches.com>
Cc: linux-raid@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Guoqing Jiang <gqjiang@suse.com>, Jens Axboe <axboe@fb.com>, Mike Christie <mchristi@redhat.com>, Neil Brown <neilb@suse.com>, Shaohua Li <shli@kernel.org>, Tomasz Majchrzak <tomasz.majchrzak@intel.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

>> How should a multiline log message be achieved as it was constructed
>> in the function "raid10_error" (for example)?
>> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/tree/dr=
ivers/md/raid10.c?id=C802e87fbe2d4dd58982d01b3c39bc5a781223aa#n1589
>=20
> As two individual calls to pr_alert

I know also such an approach.

Would it be nicer if a single call will be sufficient for such a log messag=
e?

Can an idea picked up which was discussed for the update suggestion
"[PATCH 4/4] Input-gameport: Replace some printk() calls by pr_info() in jo=
ydump_connect()"
for a moment (on 2016-09-24)?
https://lkml.kernel.org/r/<1474735656.23838.6.camel@perches.com>
https://lkml.org/lkml/2016/9/24/149

Regards,
Markus
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
