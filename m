From: Chris Wright <chrisw@osdl.org>
Date: Mon, 25 Oct 2004 16:59:11 +0000
Subject: [KJ] Re: [PATCH 2.6] hw_random.c: replace pci_find_device
Message-Id: <20041025095911.Q2441@build.pdx.osdl.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============55927769956875428=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <268450000.1098383924@w-hlinder.beaverton.ibm.com> <41783CDA.8010901@pobox.com>
In-Reply-To: <41783CDA.8010901@pobox.com>; from jgarzik@pobox.com on Thu, Oct 21, 2004 at 06:48:58PM -0400
To: Jeff Garzik <jgarzik@pobox.com>
Cc: Hanna Linder <hannal@us.ibm.com>, lkml <linux-kernel@vger.kernel.org>, kernel-janitors <kernel-janitors@lists.osdl.org>, greg@kroah.com

--===============55927769956875428==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Jeff Garzik (jgarzik@pobox.com) wrote:
> applied

  CC      drivers/char/hw_random.o
drivers/char/hw_random.c: In function `rng_init':
drivers/char/hw_random.c:584: warning: implicit declaration of function `for_each_pci_dev'
...

Woops, looks like this broke the build, I don't have for_each_pci_dev
anywhere in my tree but one use in hw_random.c and one comment in
SCCS/s.ChangeSet.

thanks,
-chris
-- 
Linux Security Modules     http://lsm.immunix.org     http://lsm.bkbits.net

--===============55927769956875428==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============55927769956875428==--
