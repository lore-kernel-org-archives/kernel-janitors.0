From: Christian Borntraeger <borntraeger@de.ibm.com>
Date: Mon, 11 Nov 2019 08:27:46 +0000
Subject: Re: [v3] s390/pkey: Use memdup_user() rather than duplicating its implementation
Message-Id: <ad1c533d-8e7f-b17e-d9cb-54dd9a7ed012@de.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <08422b7e-2071-ee52-049e-c3ac55bc67a9@web.de>
 <6137855bb4170c438c7436cbdb7dfd21639a8855.camel@perches.com>
 <deb7893f-3cfe-18fc-3feb-b26b290bf3c6@web.de>
 <833d7d5e-6ede-6bdd-a2cc-2da7f0b03908@de.ibm.com>
 <1b65bc81-f47a-eefa-f1f4-d5af6a1809c0@web.de>
 <733b29df-207e-a165-ee80-46be8720c0c4@de.ibm.com>
 <8f98f9fc-57df-5993-44b5-5ea4c0de7ef9@web.de>
 <c0df9cc8-c41a-1e5d-811c-1ff045c13fcc@de.ibm.com>
 <61244676-8ac1-20af-ed94-99e19c1f95d5@web.de>
 <040f3e18-d97a-fc32-b237-20e7553e1733@de.ibm.com>
 <c701adc9-dab2-46af-003f-d8a2c47bc0af@web.de>
In-Reply-To: <c701adc9-dab2-46af-003f-d8a2c47bc0af@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Markus Elfring <Markus.Elfring@web.de>, linux-s390@vger.kernel.org, Harald Freudenberger <freude@linux.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, Ingo Franzki <ifranzki@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Joe Perches <joe@perches.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Kangjie Lu <kjlu@umn.edu>, Navid Emamdoost <emamd001@umn.edu>, Stephen McCamant <smccaman@umn.edu>



On 11.11.19 09:11, Markus Elfring wrote:
>>> From: Markus Elfring <elfring@users.sourceforge.net>
>>> Date: Fri, 8 Nov 2019 17:50:22 +0100
> =E2=80=A6
>>> Fixes: f2bbc96e7cfad3891b7bf9bd3e566b9b7ab4553d ("s390/pkey: add CCA AE=
S cipher key support")
>>> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
>>
>> You were sending this from a different email address.
>=20
> Yes.
>=20
>=20
>> Can you use the same for the sender and the signoff?
>=20
> I would prefer to use the other email address (for a while).

The signoff is there to track the patch flow so I prefer that both
addresses match.

>> Can you also change the subject to indicate the "fix". e.g. something li=
ke
>>
>> s390/pkey: fix memory leak in error case by using memdup_user() rather t=
han open coding
>=20
> Does this change request indicate also a need to split the software update
> between the discussed two function implementations?

No, I just want to have the word "fix" in the subject.

If you are OK with changing the sign-off to your web.de address
I can do both changes when applying.


You can answer with=20
Signed-off-by: <your web.de address>

as approval.
