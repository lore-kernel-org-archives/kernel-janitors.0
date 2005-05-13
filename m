From: Miles Bader <miles@lsi.nec.co.jp>
Date: Fri, 13 May 2005 08:00:14 +0000
Subject: [KJ] Re: [PATCH] typo patch on v850e_uart.c
Message-Id: <buois1n4ktt.fsf@mctpc71.ucom.lsi.nec.co.jp>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============46223057397910328=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <fc339e4a0505130050283b5291@mail.gmail.com>
In-Reply-To: <fc339e4a0505130050283b5291@mail.gmail.com>
To: kernel-janitors@vger.kernel.org

--===============46223057397910328==
Content-Type: text/plain; charset=us-ascii

Miles Bader <snogglethorpe@gmail.com> writes:
>> Description:
>> Little patch on typo problem.
>
> I'm confused -- your patch appears to simply remove a blank line.
>
> The blank line it removes is not a typo, it was put there intentionally.

Oh, I see it actually removes a blank line which contains a form-feed
character.  Same difference though:  it isn't a typo.

-Miles
-- 
`Cars give people wonderful freedom and increase their opportunities.
 But they also destroy the environment, to an extent so drastic that
 they kill all social life' (from _A Pattern Language_)

--===============46223057397910328==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============46223057397910328==--
