From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 06 Nov 2019 18:55:00 +0000
Subject: Re: s390/pkey: Use memdup_user() rather than duplicating its implementation
Message-Id: <cba4068c-0d63-fc0a-44bb-2664b690f126@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <08422b7e-2071-ee52-049e-c3ac55bc67a9@web.de>
 <6137855bb4170c438c7436cbdb7dfd21639a8855.camel@perches.com>
 <0f90b278-7b3e-6509-1633-301d16513c5d@web.de>
 <47c55ab899aafe10898e6581582363aa446b2091.camel@perches.com>
In-Reply-To: <47c55ab899aafe10898e6581582363aa446b2091.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>, linux-s390@vger.kernel.org, kernel-janitors@vger.kernel.org
Cc: =?UTF-8?Q?Christian_Borntr=c3=a4ger?= <borntraeger@de.ibm.com>, Harald Freudenberger <freude@linux.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, Ingo Franzki <ifranzki@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, LKML <linux-kernel@vger.kernel.org>

> There is no bug here.

Do you find duplicated source code questionable?

Is this also an error item?

Regards,
Markus
