From: Domen Puncer <domen@coderock.org>
Date: Sun, 27 Jun 2004 22:33:56 +0000
Subject: [Kernel-janitors] Re: set_current_state
Message-Id: <20040627223356.GA1653@masina>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============68394051203849693=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============68394051203849693==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 27/06/04 14:24 -0500, Jay Bourque wrote:
> New guy here,
> 
> I've been following the discussion lately and with talk about the
> TODO list badly needing updating, I was wondering how up to
> date the kj.pl script is.  In particular, I ran it against the
> net/core/dev.c file and it showed that current->state needs to be
> changed to set_current_state. Is this still something that needs
> to be done?

Yes.
If you look at set_current_state, you see it's basically the same, with
a memory barrier.

> 
> Thanks,
> -Jay
> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.osdl.org
> http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============68394051203849693==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============68394051203849693==--
