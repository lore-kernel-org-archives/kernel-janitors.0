From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 20 Jul 2004 16:20:48 +0000
Subject: Re: [Kernel-janitors] Re: [PATCH] nbd: replace schedule_timeout()
Message-Id: <20040720162048.GA1983@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============80300063255507315=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040720130244.GE27492@atrey.karlin.mff.cuni.cz>
In-Reply-To: <20040720130244.GE27492@atrey.karlin.mff.cuni.cz>
To: kernel-janitors@vger.kernel.org

--===============80300063255507315==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 20, 2004 at 03:08:34PM +0200, Pavel Machek wrote:
> Hi!
> 
> > >I'm not sure it makes sense.... so it will just spin once more? Exact
> > >timeout does not seem too critical here.
> > 
> > 	So why not use HZ instead of 1000?
> 
> Hm, using constant like 1000 probably is not good idea.

Well, I thought it would be better than adding a #define for the number
of milliseconds in one second. Also, any rounding conditions or what-not
are taken care of within msleep() by the call to msecs_to_jiffies().

-Nish

--===============80300063255507315==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============80300063255507315==--
