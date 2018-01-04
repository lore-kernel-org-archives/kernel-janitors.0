From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 04 Jan 2018 09:43:59 +0000
Subject: Re: Coccinelle: Rename the script for a transformation of memory allocations
Message-Id: <6e685bda-6f8f-4adf-4b0c-bf93b59981c2@users.sourceforge.net>
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
 <7490d0cb-4246-8e10-05cd-6219b58c4f14@users.sourceforge.net>
 <alpine.DEB.2.20.1801040954020.3077@hadrien>
In-Reply-To: <alpine.DEB.2.20.1801040954020.3077@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Julia Lawall <julia.lawall@lip6.fr>, cocci@systeme.lip6.fr
Cc: Gilles Muller <Gilles.Muller@lip6.fr>, Himanshu Jha <himanshujha199640@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>, Amitoj Kaur Chawla <amitoj1606@gmail.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

>> Would you find the file name selection “zalloc-extra_changes1.cocci” acceptable?
> 
> No.

Next try then …


> I do't know what the extra changes are

This script for the semantic patch language was designed in the way
that more source code would be adjusted (or just reformatted)
than I see as an essential transformation for the replacement
of function calls in the shown case.

Example:
…
(
- x = kmalloc(E1,E2);
+ x = kzalloc(E1,E2);
|
…


We are discussing consequences from the specification of a different
change granularity for a while.
I hope that another SmPL script variant could be integrated
which will work with a higher precision then so that involved
software developers can choose the preferred transformation approach
also on their own.


> and I don't know what the number 1 means.

How do you think about to start with numbering for subsequent
SmPL scripts?

Regards,
Markus
