From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 03 Jan 2018 12:45:20 +0000
Subject: Re: Coccinelle: Rename the script for a transformation of memory allocations
Message-Id: <4d726540-5433-9b53-8ae7-bc381ba11e84@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAK7LNAR27r4j4c1FCh_ObpMpBKXgSP6Vq3P=reA-JKoTji6Q1A@mail.gmail.com>
 <ae67a02e-7257-c7e0-f4a1-bdf35a3bb2d0@users.sourceforge.net>
 <alpine.DEB.2.20.1801021528160.24055@hadrien>
 <6423882b-20df-61fd-d7c6-ac1bb4ec891d@users.sourceforge.net>
 <alpine.DEB.2.20.1801031301470.3229@hadrien>
 <d576069f-2786-d1fe-e015-9d7ed63e5d94@users.sourceforge.net>
 <alpine.DEB.2.20.1801031315230.23130@hadrien>
 <2ca7ce82-3223-9733-9aa5-6061c79ff804@users.sourceforge.net>
 <alpine.DEB.2.20.1801031339410.23130@hadrien>
In-Reply-To: <alpine.DEB.2.20.1801031339410.23130@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Julia Lawall <julia.lawall@lip6.fr>, cocci@systeme.lip6.fr
Cc: Gilles Muller <Gilles.Muller@lip6.fr>, Himanshu Jha <himanshujha199640@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>, Amitoj Kaur Chawla <amitoj1606@gmail.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

>> Would you insist to replace such “special characters” by dashes or underscores?
> 
> Yes.  But I will also nack any very long name.

Will any other artificial identifier become appropriate if it would be too hard
to achieve consensus on a more meaningful description in the file name?

Regards,
Markus
