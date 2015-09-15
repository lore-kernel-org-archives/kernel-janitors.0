From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 15 Sep 2015 14:53:40 +0000
Subject: Re: [Cocci] [PATCH] coccinelle: tests: unsigned value cannot be lesser than zero
Message-Id: <55F830F4.5010003@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1442309232-5902-1-git-send-email-a.hajda@samsung.com>
 <55F816BC.5050407@users.sourceforge.net> <55F8204D.3080606@samsung.com>
 <55F82D02.5010004@users.sourceforge.net>
 <alpine.DEB.2.10.1509151642200.2537@hadrien>
In-Reply-To: <alpine.DEB.2.10.1509151642200.2537@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cocci@systeme.lip6.fr

> --recursive-includes is already a parameter.

I am unsure if its effect on source code analysis speed will matter here.


> size_t is also unsigned.

Will such a specification work also without an explicit SmPL typedef?

Regards,
Markus
