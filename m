From: Julia Lawall <julia.lawall@lip6.fr>
Date: Fri, 19 Jan 2018 16:18:54 +0000
Subject: Re: Coccinelle: zalloc-simple: Checking consequences from the usage of at signs in Python strings
Message-Id: <alpine.DEB.2.20.1801191717510.3668@hadrien>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323329-914161247-1516378735=:3668"
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAK7LNAR27r4j4c1FCh_ObpMpBKXgSP6Vq3P=reA-JKoTji6Q1A@mail.gmail.com>
 <ff8a1313-90a3-d009-dbc4-034fdbae82af@users.sourceforge.net>
In-Reply-To: <ff8a1313-90a3-d009-dbc4-034fdbae82af@users.sourceforge.net>
To: cocci@systeme.lip6.fr

--8323329-914161247-1516378735=:3668
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit



On Fri, 19 Jan 2018, SF Markus Elfring wrote:

> > I removed the blank line at EOF,
> > then applied to linux-kbuild/misc.
>
> This script for the semantic patch language is using the at sign within string
> literals for Python code.
>
> It is nice when this character seems to work also with the current software.

So it works, but you are complaining anyway?

> How does its usage fit to the following information in the SmPL manual?
>
> https://github.com/coccinelle/coccinelle/blob/bf1c6a5869dd324f5faeeaa3a12d57270e478b21/docs/manual/cocci_syntax.tex#L50
>
> “…
> Furthermore, @ should not be used in this code.
> Spatch scans the script code for the next @ and considers that to be the
> beginning of the next rule, even if @ occurs within e.g., a comment.
> …”

I guess the conclusion is that it woks in strings (which are pretty
universal) and not in comments (which are language specific).

julia

>
> See also:
> Configuration or escaping of @ characters for embedded programming language scripts
> https://github.com/coccinelle/coccinelle/issues/36
>
> Regards,
> Markus
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
--8323329-914161247-1516378735=:3668--
