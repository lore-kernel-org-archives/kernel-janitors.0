From: Christoph Hellwig <hch@infradead.org>
Date: Tue, 05 Oct 2004 09:44:43 +0000
Subject: Re: [Kernel-janitors] [PATCH 2.6][1/12] arch/ppc/kernel/pci.c replace
Message-Id: <20041005104443.A16871@infradead.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============44288745260568696=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <298570000.1096930681@w-hlinder.beaverton.ibm.com>
In-Reply-To: <298570000.1096930681@w-hlinder.beaverton.ibm.com>; from hannal@us.ibm.com on Mon, Oct 04, 2004 at 03:58:01PM -0700
To: Hanna Linder <hannal@us.ibm.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@lists.osdl.org, benh@kernel.crashing.org, paulus@samba.org, greg@kroah.com

--===============44288745260568696==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 04, 2004 at 03:58:01PM -0700, Hanna Linder wrote:
> 
> As pci_find_device is going away I have replaced this call with pci_get_device.
> If someone with a PPC system could verify it I would appreciate it. This is the only
> one in ppc/kernel all the others are under ppc/platform. There will be 12 total.

what about adding a for_each_pci_dev macro that nicely hides these AND_ID
iterations?

--===============44288745260568696==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============44288745260568696==--
