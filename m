From: Martin Schwidefsky <schwidefsky@de.ibm.com>
Date: Fri, 01 Oct 2004 13:17:26 +0000
Subject: [Kernel-janitors] Re: [PATCH 2.6.9-rc2] s390/ctctty: replace
Message-Id: <OFF66D1D23.9AD4119B-ON42256F20.004862D2-42256F20.00490237@de.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org





Nishanth Aravamudan <nacc@us.ibm.com> wrote on 27/09/2004 06:57:52 PM:

> Any comments would be appreciated.
>
> Description: Use msleep_interruptible() instead of
> schedule_timeout() to guarantee the task delays as expected.

Looks good, it's equivalent.

blue skies,
   Martin

Linux/390 Design & Development, IBM Deutschland Entwicklung GmbH
Sch=F6naicherstr. 220, D-71032 B=F6blingen, Telefon: 49 - (0)7031 - 16-2247
E-Mail: schwidefsky@de.ibm.com


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
