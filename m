From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 20 Jul 2004 16:36:53 +0000
Subject: Re: [Kernel-janitors] Re: [PATCH] nbd: replace schedule_timeout()
Message-Id: <20040720163653.GD1983@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============78958304425184878=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040720130244.GE27492@atrey.karlin.mff.cuni.cz>
In-Reply-To: <20040720130244.GE27492@atrey.karlin.mff.cuni.cz>
To: kernel-janitors@vger.kernel.org

--===============78958304425184878==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 20, 2004 at 10:10:31AM -0300, Felipe W Damasio wrote:
> 
> 
> Pavel Machek wrote:
> >I'm not sure it makes sense.... so it will just spin once more? Exact
> >timeout does not seem too critical here.
> 
> 	So why not use HZ instead of 1000?

Because msleep() is in terms of milliseconds, while schedule_timeout()
is in terms of jiffies. Thus, to sleep for a second, one would
schedule_timeout(HZ); (setting the state appropriately beforehand) or
(to guarantee the delay) msleep(1000);

Thanks,
Nish

--===============78958304425184878==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============78958304425184878==--
