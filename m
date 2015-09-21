From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 21 Sep 2015 13:02:44 +0000
Subject: Re: [PATCH v3] coccinelle: tests: unsigned value cannot be lesser than zero
Message-Id: <55FFFFF4.4000007@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.02.1509180734350.2064@localhost6.localdomain6>
 <1442831864-25759-1-git-send-email-a.hajda@samsung.com>
In-Reply-To: <1442831864-25759-1-git-send-email-a.hajda@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cocci@systeme.lip6.fr

> v3: added bool type

I would appreciate a bit more feedback for my concerns around your
evolving approach.
* Reuse of "long int"?
* Splitting of the suggested SmPL rule so that each source code check
will be connected with appropriate warning messages.

Will any more fine-tuning be useful?

Regards,
Markus
