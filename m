From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Date: Wed, 29 Sep 2004 21:11:44 +0000
Subject: [Kernel-janitors] Re: [PATCH 2.6.9-rc2-mm4 alim15x3.c] [3/8]
Message-Id: <1096492303.16767.8.camel@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============31881021532819087=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <13230000.1096487909@w-hlinder.beaverton.ibm.com>
In-Reply-To: <13230000.1096487909@w-hlinder.beaverton.ibm.com>
To: Hanna Linder <hannal@us.ibm.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kernel-janitors@lists.osdl.org, greg@kroah.com, Bartlomiej Zolnierkiewicz <B.Zolnierkiewicz@elka.pw.edu.pl>, Andre Hedrick <andre@linux-ide.org>

--===============31881021532819087==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mer, 2004-09-29 at 20:58, Hanna Linder wrote:
> The dev returned from pci_find_device was not used so it can be replaced
> with pci_dev_present. Has been compile tested.

Maybe that test should just go. Its been getting tested since 2.4.20 or
so 8)


--===============31881021532819087==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============31881021532819087==--
