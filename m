From: Martin Schwidefsky <schwidefsky@de.ibm.com>
Date: Mon, 02 Aug 2004 13:09:36 +0000
Subject: [Kernel-janitors] Re: [PATCH] s390/zfcp_fsf: replace
Message-Id: <OF71094837.AF6EDCA9-ON42256EE4.00460B55-42256EE4.00484A58@de.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org





Nishanth Aravamudan <nacc@us.ibm.com> wrote on 28/07/2004 12:18:11 AM:

> I would appreciate any comments from the janitors list.
>
> Applys-to: 2.6.7
>
> Description: Use msleep() instead of schedule_timeout() to
> guarantee the task delays for the desired time.
>
> Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

I added this and the other s390 related msleep patches to our repository.
They will be included in the next update.

blue skies,
   Martin

Linux/390 Design & Development, IBM Deutschland Entwicklung GmbH
Sch=F6naicherstr. 220, D-71032 B=F6blingen, Telefon: 49 - (0)7031 - 16-2247
E-Mail: schwidefsky@de.ibm.com


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
