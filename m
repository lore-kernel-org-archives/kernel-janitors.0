From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 20 Jul 2004 16:17:43 +0000
Subject: Re: [Kernel-janitors] Re: [PATCH] nbd: replace schedule_timeout()
Message-Id: <20040720161743.GA1936@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============12963827068854838=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040720130244.GE27492@atrey.karlin.mff.cuni.cz>
In-Reply-To: <20040720130244.GE27492@atrey.karlin.mff.cuni.cz>
To: kernel-janitors@vger.kernel.org

--===============12963827068854838==
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

Well, msleep() is in terms of milliseconds while schedule_timeout() is in terms
of jiffies. Thus, you would use HZ if you called schedule_timeout() [and
it would always sleep (at most) one second, because HZ counts the number
of jiffies in one second] and you would use 1000 if you called msleep()
[and it would always sleep (at least) one second, because there are 1000
milliseconds in 1 second].

-Nish

--===============12963827068854838==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============12963827068854838==--
