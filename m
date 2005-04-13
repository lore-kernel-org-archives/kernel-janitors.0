From: Christoph Hellwig <hch@infradead.org>
Date: Wed, 13 Apr 2005 14:51:00 +0000
Subject: [KJ] Re: [PATCH] scsi/a100u2w: Remove custom msecs_to_jiffies and
Message-Id: <20050413145100.GA9958@infradead.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============84801370375592233=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050413121104.GA9419@argon.tklauser.home>
	<20050413144308.GA9616@infradead.org>
In-Reply-To: <20050413144308.GA9616@infradead.org>
To: Tobias Klauser <tklauser@nuerscht.ch>
Cc: kernel-janitors@lists.osdl.org, linux-scsi@vger.kernel.org

--===============84801370375592233==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 13, 2005 at 03:43:08PM +0100, Christoph Hellwig wrote:
> >  static void waitForPause(unsigned amount)
> >  {
> > -	ULONG the_time = jiffies + MS_TO_JIFFIES(amount);
> > +	ULONG the_time = jiffies + msecs_to_jiffies(amount);
> >  	while (time_before_eq(jiffies, the_time))
> >  		cpu_relax();
> 
> You should probably replace this function with msleep completely.

I actually meant mdelay, but as mentioned in the other followup that might
need some more research.


--===============84801370375592233==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============84801370375592233==--
