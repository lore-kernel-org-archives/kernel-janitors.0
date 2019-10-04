From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 04 Oct 2019 08:23:11 +0000
Subject: Re: [Cocci] [RFC] scripts: Fix coccicheck failed
Message-Id: <3a4c8245-9e7b-8287-90f6-b49a658fd204@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAK7LNATAqM9QHRqotFQsmh64rww_AxNm4gdV2t5TuYxHA++zSg@mail.gmail.com>
 <9e15321d-5b95-c03c-e6eb-1d3d4a62478a@web.de>
 <alpine.DEB.2.21.1910032135140.3451@hadrien>
In-Reply-To: <alpine.DEB.2.21.1910032135140.3451@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Julia Lawall <julia.lawall@lip6.fr>, Masahiro Yamada <yamada.masahiro@socionext.com>, =?UTF-8?Q?Matthias_M=c3=a4nnich?= <maennich@google.com>, Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>, YueHaibing <yuehaibing@huawei.com>, Jessica Yu <jeyu@kernel.org>, Coccinelle <cocci@systeme.lip6.fr>, kernel-janitors@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org

>> How do you think about to avoid the addition of the SmPL variable
>> “virtual report” to the script “add_namespace.cocci” if you would dare
>> to integrate my change proposal for an adjusted directory hierarchy?
>
> Perhaps I'm lazy, but i seems simpler to add 20 characters than to move
> all of the files around...

I got concerned that you would interpret the difference statistics
of the published patches in this direction.

I propose to achieve a clear separation for SmPL scripts.
* Files which can be directly used (on their own).
* Coccicheck scripts which have got additional design requirements
  for this call interface.


Which storage locations are you going to select for these variants?

Regards,
Markus
