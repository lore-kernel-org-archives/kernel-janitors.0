From: Jon Smirl <jonsmirl@gmail.com>
Date: Mon, 25 Oct 2004 16:48:43 +0000
Subject: [KJ] Re: [PATCH 2.6] hw_random.c: replace pci_find_device
Message-Id: <9e473391041025094812aa9923@mail.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============0088626851895761138=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <268450000.1098383924@w-hlinder.beaverton.ibm.com>
	 <41783CDA.8010901@pobox.com>
In-Reply-To: <41783CDA.8010901@pobox.com>
To: Jeff Garzik <jgarzik@pobox.com>
Cc: Hanna Linder <hannal@us.ibm.com>, lkml <linux-kernel@vger.kernel.org>, kernel-janitors <kernel-janitors@lists.osdl.org>, greg@kroah.com

--===============0088626851895761138==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

On Thu, 21 Oct 2004 18:48:58 -0400, Jeff Garzik <jgarzik@pobox.com> wrote:
> applied

I just pulled from Linus bk, for_each_pci_dev isn't defined anywhere.
I get compile errors in hw_random.c.

[jonsmirl@smirl linux-2.5]$ grep -rI for_each_pci_dev *
drivers/char/hw_random.c:       for_each_pci_dev(pdev) {
SCCS/s.ChangeSet:c for_each_pci_dev is a macro wrapper around pci_get_device.
[jonsmirl@smirl linux-2.5]$

-- 
Jon Smirl
jonsmirl@gmail.com


--===============0088626851895761138==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============0088626851895761138==--
