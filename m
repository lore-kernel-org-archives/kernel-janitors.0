From: maximilian attems <janitor@sternwelten.at>
Date: Wed, 01 Sep 2004 21:40:03 +0000
Subject: [Kernel-janitors] Re: [patch 1/8] irda/act200l-sir: replace
Message-Id: <20040901214003.GC7467@stro.at>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============7419660174509124=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <E1C2cIF-0007yy-Lb@sputnik>
	<20040901210929.GA11442@bougret.hpl.hp.com>
In-Reply-To: <20040901210929.GA11442@bougret.hpl.hp.com>
To: jt@hpl.hp.com
Cc: kj <kernel-janitors@osdl.org>, netdev@oss.sgi.com, jgarzik@pobox.com

--===============7419660174509124==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, 01 Sep 2004, Jean Tourrilhes wrote:

> On Wed, Sep 01, 2004 at 11:05:23PM +0200, janitor@sternwelten.at wrote:
> > I would appreciate any comments from the janitor@sternweltens list. 
uups mangled some text there sorry for this silly email.
> 
> 	I already commented that I don't like the confusing msleep()
> API and I prefer the more explicit schedule_timeout().
> 	But that's only me...
> 
> 	Jean

hmm we have still archs were HZ < 100.
i find msleep use msecs units a lot more readable than
	schedule_timeout((HZ + 99) / 100);

the schedule_timeout(HZ/100) gets safely converted with msleep.

--
maks
kernel janitor  	http://janitor.kernelnewbies.org/


--===============7419660174509124==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============7419660174509124==--
