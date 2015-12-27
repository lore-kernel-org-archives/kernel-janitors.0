From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 27 Dec 2015 07:58:33 +0000
Subject: Re: [Cocci] [PATCH v2] coccinelle: api: check for propagation of error from platform_get_irq
Message-Id: <567F9A29.50202@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1451157891-24881-1-git-send-email-Julia.Lawall@lip6.fr>
 <567EF188.7020203@cogentembedded.com>
 <alpine.DEB.2.02.1512262107340.2070@localhost6.localdomain6>
 <alpine.DEB.2.02.1512262123500.2070@localhost6.localdomain6>
 <567EF895.6080702@cogentembedded.com>
 <alpine.DEB.2.02.1512262156580.2070@localhost6.localdomain6>
In-Reply-To: <alpine.DEB.2.02.1512262156580.2070@localhost6.localdomain6>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: cocci@systeme.lip6.fr

> The error return value of platform_get_irq seems to often get dropped.

How do you think about any more fine-tuning here?

Commit message:
* =85 of the platform_get_irq() function seems to get dropped too often.

* Why do you concentrate on a single function name?
  Do you plan to extend this source code analysis approach?


> +@script:python r_report depends on report@
> +j0 << r.j0;
> +j1 << r.j1;
> +@@
> +
> +msg =3D "Propagate return value of platform_get_irq around line %s." % (=
j1[0].line)

Are there more unchecked return values which are interesting
for further considerations?
https://cwe.mitre.org/data/definitions/252.html

Regards,
Markus
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
