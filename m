From: ebiederman@lnxi.com (Eric W. Biederman)
Date: Mon, 14 Feb 2005 18:41:22 +0000
Subject: [KJ] Re: [PATCH 8/18] drivers/mtd/ remove pci_find_{device, subsys}
Message-Id: <m3fyzzx9v1.fsf@maxwell.lnxi.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050214175251.GA28755@wohnheim.fh-wedel.de>
In-Reply-To: <20050214175251.GA28755@wohnheim.fh-wedel.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: =?iso-8859-1?q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
Cc: joern@wh.fh-wedel.de, Amit Gud <amitg@calsoftinc.com>, gud@eth.net, linux-mtd@lists.infradead.org, kernel-janitors@lists.osdl.org, David Woodhouse <dwmw2@infradead.org>

J=F6rn Engel <joern@wohnheim.fh-wedel.de> writes:

> Looks fairly simple, but I've never dealt with pci_find_device(), so
> my voice doesn't count.

When switching from pci_find_device to pci_get_device
the corresponding call to pci_dev_put() needs to be added.

In addition we need an entry in compat.h

Beyond that ich2rom.c should just be deleted.  It was renamed
ichxrom.c a while ago.

Eric

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
