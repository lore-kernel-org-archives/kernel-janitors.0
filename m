From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 01 Dec 2014 21:22:38 +0000
Subject: Re: [PATCH v2] fs-fat: Less function calls in fat_fill_super() after error detection
Message-Id: <547CDC1E.7020404@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net> <5467B12C.4010602@users.sourceforge.net>
 <alpine.DEB.2.02.1411152117540.2225@localhost6.localdomain6>
 <54796B5E.5040707@users.sourceforge.net> <87sih22sn8.fsf@devron.myhome.or.jp>
 <alpine.DEB.2.10.1411291338530.2378@hadrien>
 <87lhmu2jl8.fsf@devron.myhome.or.jp> <20141201065221.GA4994@mwanda>
 <547C89A4.40002@users.sourceforge.net> <20141201191723.GG4994@mwanda>
In-Reply-To: <20141201191723.GG4994@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cocci@systeme.lip6.fr

>> Which names would be better acceptable for you?
> 
> You named it after the goto location but the label name should be based
> on the label location to say what the goto does.

I find it easier occasionally to name a label similarly to the jump target.
It seems that there are a few variations used for the affected identifiers.


> Something like "err_put_fsinfo", "err_put_fat", and "err_unload" or like that.

How do you think about to provide a patch with your preferred names
if my chances are lower to suggest the pleasing ones directly in my
first tries?

Regards,
Markus
