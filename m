From: Stefan Sperling <stefan@binarchy.net>
Date: Tue, 09 Nov 2004 22:58:15 +0000
Subject: Re: [KJ] [PATCH] convert airo wireless driver to module_param
Message-Id: <20041109225815.GB11279@dice.seeling33.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============81315868878158903=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20041109212957.GA9496@dice.seeling33.de>
In-Reply-To: <20041109212957.GA9496@dice.seeling33.de>
To: kernel-janitors@vger.kernel.org

--===============81315868878158903==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 09, 2004 at 02:29:01PM -0800, Greg KH wrote:
> > Can someone please clarify the "official guidelines" for
> > module parameter permissions in sysfs?
> 
> "When it makes sense to have it exposed to userspace"
> 
> Yeah, it's vague, sorry, but it all depends.
> 
> For things that can be changed on the fly, expose it.
> For things that don't really matter, and no one will ever look them up,
> don't.  I think the irq stuff is in the "don't" category, as almost no
> one messes with them anymore.
> 
> Does this help?

It does.

> thanks,
> 
> greg k-h

thanks
stefan
-- 
Give me a fish and I will eat today.
Teach me to fish and I will eat forever.

--===============81315868878158903==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============81315868878158903==--
