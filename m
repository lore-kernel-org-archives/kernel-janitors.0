From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 01 Dec 2014 15:30:44 +0000
Subject: Re: [PATCH v2] fs-fat: Less function calls in fat_fill_super() after error detection
Message-Id: <547C89A4.40002@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net> <5467B12C.4010602@users.sourceforge.net>
 <alpine.DEB.2.02.1411152117540.2225@localhost6.localdomain6>
 <54796B5E.5040707@users.sourceforge.net> <87sih22sn8.fsf@devron.myhome.or.jp>
 <alpine.DEB.2.10.1411291338530.2378@hadrien>
 <87lhmu2jl8.fsf@devron.myhome.or.jp> <20141201065221.GA4994@mwanda>
In-Reply-To: <20141201065221.GA4994@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cocci@systeme.lip6.fr

> Mixing the error paths together it always creates confusion.
> I fix so many of these bugs...  We get a few new ones every week.

Would you like to get help here from any other automatic semantic
patch approaches?


> Meanwhile Markus's error labels are absolutely useless.  They give no
> indication of what going to the label does.

Which names would be better acceptable for you?

Regards,
Markus
