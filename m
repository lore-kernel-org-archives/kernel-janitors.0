From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 22 Sep 2004 16:10:34 +0000
Subject: [Kernel-janitors] Re: [PATCH 2.6.9-rc2 8/17] media/ovcamchip_core:
Message-Id: <20040922161034.GA1924@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============95502558464666509=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <41517248.3030707@alpha.dyndns.org>
In-Reply-To: <41517248.3030707@alpha.dyndns.org>
To: kernel-janitors@vger.kernel.org

--===============95502558464666509==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 22, 2004 at 05:38:32AM -0700, Mark McClelland wrote:
> Nishanth Aravamudan wrote:
> 
> >Any comments would be appreciated.
> >
> >Description: Use msleep() instead of schedule_timeout() to
> >guarantee the task delays as expected.
> > 
> >
> 
> Looks good to me. Thank you for doing this.
> 
> Should I send this on to Andrew/Linus, or were you (or some automated 
> janitor-patch-bot) planning to do that?

If you don't send it to Andrew/Linus, then Max (the kernel-janitors
maintainer) will take care of it, from what I understand.

-Nish

--===============95502558464666509==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============95502558464666509==--
