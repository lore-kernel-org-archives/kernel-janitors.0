From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 25 Aug 2016 17:54:49 +0000
Subject: Re: Software evolution around scripts for the semantic patch langugae
Message-Id: <01282dbb-40c6-e039-fa7b-33c28eda2e8a@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <82b84c9c-38a4-4d17-910f-312668dbae01@users.sourceforge.net>
 <bb710b21-d8c4-e172-63d4-b46c80645cb3@users.sourceforge.net>
 <ddb2bbd9-757b-fc62-8642-ce827a7a666d@de.ibm.com>
 <e72e9854-443b-7033-d674-8a2d237600ca@users.sourceforge.net>
 <c3323f6b-4af2-0bfb-9399-e529952e378e@users.sourceforge.net>
 <20160825181009.381411d9.cornelia.huck@de.ibm.com>
 <b35caa5e-35c7-d2d9-b1e0-bd8ca5379535@users.sourceforge.net>
 <20160825194039.218e795d.cornelia.huck@de.ibm.com>
In-Reply-To: <20160825194039.218e795d.cornelia.huck@de.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Cornelia Huck <cornelia.huck@de.ibm.com>
Cc: kvm@vger.kernel.org, linux-s390@vger.kernel.org, =?UTF-8?Q?Christian_Borntr=c3=a4ger?= <borntraeger@de.ibm.com>, David Hildenbrand <dahi@linux.vnet.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, Walter Harms <wharms@bfs.de>

> You obviously run some kind of semantic patching.

Yes. - I developed some software for search patterns I became interested in.


> It would really help ease review if you could publish the semantic patches
> that generate your patches

This is reasonable.


> - that is probably more helpful in review than just posting the generated=
 patches.

Which of the available scripts (or SmPL source files) would you like to dis=
cuss further?


> And it does not need to be "complete",

I would feel more comfortable with publishing further scripts here when I c=
an become
more confident about relevant safety checks in this software area.


> I'd think everyone on the cc: list here is able to handle a cocchinelle p=
atch,
> for example.

Interesting view =85

I did not expect this kind of expertise by default.

Regards,
Markus
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
