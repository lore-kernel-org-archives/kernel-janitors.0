From: Pavel Machek <pavel@ucw.cz>
Date: Tue, 20 Jul 2004 13:08:34 +0000
Subject: Re: [Kernel-janitors] Re: [PATCH] nbd: replace schedule_timeout()
Message-Id: <20040720130834.GG27492@atrey.karlin.mff.cuni.cz>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============059389220294596923=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040720130244.GE27492@atrey.karlin.mff.cuni.cz>
In-Reply-To: <20040720130244.GE27492@atrey.karlin.mff.cuni.cz>
To: kernel-janitors@vger.kernel.org

--===============059389220294596923==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi!

> >I'm not sure it makes sense.... so it will just spin once more? Exact
> >timeout does not seem too critical here.
> 
> 	So why not use HZ instead of 1000?

Hm, using constant like 1000 probably is not good idea.

						Pavel
-- 
Horseback riding is like software...
...vgf orggre jura vgf serr.

--===============059389220294596923==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============059389220294596923==--
