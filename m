From: Martin Schwidefsky <schwidefsky@de.ibm.com>
Date: Wed, 14 Jul 2004 07:20:30 +0000
Subject: [Kernel-janitors] Re: no set_current_state() before
Message-Id: <OF1BC8FB63.0FC5B781-ON42256ED1.0027F167-42256ED1.0028543A@de.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <40F42291.5010202@us.ibm.com>
In-Reply-To: <40F42291.5010202@us.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org





Hi Nish,
in both cases TASK_UNINTERRUPTIBLE is the correct state and both calls
are indeed broken. Thanks for the hint, I'll fix this in our CVS right
away.

blue skies,
   Martin

Linux/390 Design & Development, IBM Deutschland Entwicklung GmbH
Sch=F6naicherstr. 220, D-71032 B=F6blingen, Telefon: 49 - (0)7031 - 16-2247
E-Mail: schwidefsky@de.ibm.com


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
