From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 22 Sep 2015 15:27:48 +0000
Subject: Re: [PATCH v3] coccinelle: tests: unsigned value cannot be lesser than zero
Message-Id: <56017374.3080402@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.02.1509180734350.2064@localhost6.localdomain6>
 <1442831864-25759-1-git-send-email-a.hajda@samsung.com>
 <55FFFFF4.4000007@users.sourceforge.net> <56000777.6060208@samsung.com>
In-Reply-To: <56000777.6060208@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cocci@systeme.lip6.fr

> If you mean adding int to 'unsigned long [long]' types, it does not work.
> For some reason it works only without adding int after long.

Do you get any error message for this SmPL approach?
With which source files do you try the extended SmPL script out?

Regards,
Markus
