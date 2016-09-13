From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 13 Sep 2016 17:30:27 +0000
Subject: Re: virtio_blk: Less function calls in init_vq() after error detection
Message-Id: <7da823eb-939c-9ee6-32bf-db296e6a96f6@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <02054675-8395-ac81-6863-e3a5cbfc9032@users.sourceforge.net>
 <f56845a8-03c6-d3f7-6091-99dba9835780@users.sourceforge.net>
 <e918e655-cd86-c3c8-d911-9dfc03b03e19@de.ibm.com>
In-Reply-To: <e918e655-cd86-c3c8-d911-9dfc03b03e19@de.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: =?UTF-8?Q?Christian_Borntr=c3=a4ger?= <borntraeger@de.ibm.com>, virtualization@lists.linux-foundation.org, "Michael S. Tsirkin" <mst@redhat.com>, Minfei Huang <minfei.hmf@alibaba-inc.com>, Cornelia Huck <cornelia.huck@de.ibm.com>, Stefan Hajnoczi <stefanha@redhat.com>
Cc: Julia Lawall <julia.lawall@lip6.fr>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Chao Fan <fanc.fnst@cn.fujitsu.com>

> In addition, please have a look at commit 347a529398e8e723338cca5d8a8ae2d=
9e7e93448
>     virtio_blk: Fix a slient kernel panic

I would like to add another view on the implementation details in this soft=
ware update.


> which did the opposite of your patch.

This update contained a different approach for error detection and correspo=
nding
exception handling.


> And in fact it fixed a bug.

This is great in principle according to an information in the commit descri=
ption.

"=85
To fix this bug, we should take care of allocation failure,
and return correct value to let caller know what happen.
=85"


> Quite obviously multiple labels are harder to read and harder to get righ=
t.
> For error handling with just kfree one label is just the right thing to.

Unfortunately, I get an other impression here after a closer look.

Can it be that the discussed commit from 2016-08-09 accepted (or tolerated)
two weaknesses at least?

1. Commit title:
   Is the word "slient" a typo?
   Would you like to read "silent" there instead?

2. Source code:
   Why would another memory allocation be attempted if it could be determin=
ed quicker
   that a previous one failed and this function implementation can not succ=
eed then?

   How much will it matter in general that two function calls are performed
   in this use case without checking their return values immediately?
   https://cwe.mitre.org/data/definitions/252.html

	if (!names || !callbacks || !vqs) { =85

   https://cwe.mitre.org/data/definitions/754.html


Was the software development attention a bit too low as it happens occasion=
ally?


I hope that my suggestions can improve the affected situation a bit more
also for this software module.

Regards,
Markus
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
