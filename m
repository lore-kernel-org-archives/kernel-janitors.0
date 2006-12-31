From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Sun, 31 Dec 2006 11:12:02 +0000
Subject: Re: [KJ] ok to replace with memcmp?
Message-Id: <Pine.LNX.4.64.0612310611070.3132@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323328-1006380960-1167563522=:3132"
List-Id: <kernel-janitors.vger.kernel.org>
References: <80ec54e90612300907k234d70bbsf36764dc87c43b9@mail.gmail.com>
In-Reply-To: <80ec54e90612300907k234d70bbsf36764dc87c43b9@mail.gmail.com>
To: kernel-janitors@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1006380960-1167563522=:3132
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Sun, 31 Dec 2006, Daniel Marjam=E4ki wrote:

> Hello!
>
> I didn't know about the ARRAY_SIZE. But it doesn't seem to be usable
> in this situation, does it?
>
> flowi is a struct (defined in include/net/flow.h), not an array.
>
> Best regards,
> Daniel

whoops, sorry, i didn't realize that.  normally, whenever i see
someone doing a sizeof/sizeof calculation to determine a "number of
elements," i automatically assume they're trying to calculate an
array size.

rday
--8323328-1006380960-1167563522=:3132
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--8323328-1006380960-1167563522=:3132--
