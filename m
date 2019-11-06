From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 06 Nov 2019 19:18:05 +0000
Subject: Re: s390/pkey: Use memdup_user() rather than duplicating its implementation
Message-Id: <298c5ecf-2fc7-b604-b97a-85c0717cafc9@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <08422b7e-2071-ee52-049e-c3ac55bc67a9@web.de>
 <6137855bb4170c438c7436cbdb7dfd21639a8855.camel@perches.com>
 <0f90b278-7b3e-6509-1633-301d16513c5d@web.de>
 <47c55ab899aafe10898e6581582363aa446b2091.camel@perches.com>
 <cba4068c-0d63-fc0a-44bb-2664b690f126@web.de>
 <7b6295e48dbb4b5b9c578516f40b61ad2afd115b.camel@perches.com>
In-Reply-To: <7b6295e48dbb4b5b9c578516f40b61ad2afd115b.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Joe Perches <joe@perches.com>, linux-s390@vger.kernel.org, kernel-janitors@vger.kernel.org
Cc: =?UTF-8?Q?Christian_Borntr=c3=a4ger?= <borntraeger@de.ibm.com>, Harald Freudenberger <freude@linux.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, Ingo Franzki <ifranzki@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, LKML <linux-kernel@vger.kernel.org>

>>> There is no bug here.
>>
>> Do you find duplicated source code questionable?
>
> No.

Do you disagree to the following information which can be provided by
a coccicheck run?

./drivers/s390/crypto/pkey_api.c:722:8-15: WARNING opportunity for memdup_user


> It is something that can be improved through
> code consolidation though.
>
>> Is this also an error item?
>
> Definitely not.

Your view seems to be very limited at the moment.


> It is _only_ an error if there is some logic defect.
> There is no logic defect here.

I suggest to consider additional software weaknesses besides logic errors.
Do we occasionally care any more for the development principle
“Don't repeat yourself”?

Regards,
Markus
