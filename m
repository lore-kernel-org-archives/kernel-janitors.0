From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 25 Aug 2016 16:45:44 +0000
Subject: Re: KVM: s390: Improve determination of sizes in kvm_s390_import_bp_data()
Message-Id: <46da0bba-a04c-f47d-9587-2f2b3c5e9f4f@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <82b84c9c-38a4-4d17-910f-312668dbae01@users.sourceforge.net>
 <bb710b21-d8c4-e172-63d4-b46c80645cb3@users.sourceforge.net>
 <ddb2bbd9-757b-fc62-8642-ce827a7a666d@de.ibm.com>
 <e72e9854-443b-7033-d674-8a2d237600ca@users.sourceforge.net>
 <c3323f6b-4af2-0bfb-9399-e529952e378e@users.sourceforge.net>
 <20160825181009.381411d9.cornelia.huck@de.ibm.com>
In-Reply-To: <20160825181009.381411d9.cornelia.huck@de.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Cornelia Huck <cornelia.huck@de.ibm.com>
Cc: kvm@vger.kernel.org, linux-s390@vger.kernel.org, =?UTF-8?Q?Christian_Borntr=c3=a4ger?= <borntraeger@de.ibm.com>, David Hildenbrand <dahi@linux.vnet.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, Walter Harms <wharms@bfs.de>

>>   This issue was detected also by using the Coccinelle software.
> 
> Do you have the scripts you use published somewhere?

Not yet.

I hope that I can clarify a few more implementation details around
my evolving scripts for the semantic patch language.
I guess that this approach can be published with a higher confidence
in the near future.

Regards,
Markus
