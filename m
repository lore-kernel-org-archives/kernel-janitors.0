From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 29 Sep 2016 11:45:41 +0000
Subject: Re: dm snapshot: Use kmalloc_array() in init_origin_hash()
Message-Id: <80feaa7d-7845-976a-a038-15da80283df8@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <080668d9-1e1e-e208-f9ea-ff718e8070e5@users.sourceforge.net>
 <3861d349-48fd-162b-a749-83e007f70b41@users.sourceforge.net>
 <1475142864.31297.5.camel@tiscali.nl>
In-Reply-To: <1475142864.31297.5.camel@tiscali.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paul Bolle <pebolle@tiscali.nl>
Cc: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, dm-devel@redhat.com, linux-raid@vger.kernel.org, Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>, Shaohua Li <shli@kernel.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, Paolo Bonzini <pbonzini@redhat.com>

> We have no hope of fixing Markus' homegrown coccinelle script.

I have got an other impression. I see further possibilities
to clarify involved communication and software development challenges
for a few source code search patterns.

How do you think about to discuss the corresponding collateral evolution
a bit more?

Are there any more constraints to consider?

Regards,
Markus
