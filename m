From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 06 Mar 2019 11:18:10 +0000
Subject: Re: [v6] coccinelle: semantic code search for missing put_device()
Message-Id: <26dfa462-296c-6daf-5f22-30c20593c9cd@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <201902191014156680299@zte.com.cn>
In-Reply-To: <201902191014156680299@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wen Yang <wen.yang99@zte.com.cn>, Julia Lawall <julia.lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>, Wen Yang <yellowriver2010@hotmail.com>, Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org, Cheng Shengyu <cheng.shengyu@zte.com.cn>, cocci@systeme.lip6.fr

> Do you have any other questions?

I would like to point another aspect out for further development considerations.

The initial assignment targets are (id)expressions in the discussed analysis
approach so far.
Would you like to care also for value (or pointer) initialisations by resource
allocation calls at the following source code places?

* Variable definition

* Designated initialiser


Will possible software extensions trigger interesting challenges?

Regards,
Markus
