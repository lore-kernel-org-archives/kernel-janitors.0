From: Matthew Wilcox <matthew@wil.cx>
Date: Thu, 18 May 2006 11:59:36 +0000
Subject: Re: [KJ] question about pci_dev_put
Message-Id: <20060518115936.GI1604@parisc-linux.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============91425631096639304=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <446BAEC6.9080907@yahoo.fr>
In-Reply-To: <446BAEC6.9080907@yahoo.fr>
To: kernel-janitors@vger.kernel.org

--===============91425631096639304==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 17, 2006 at 08:39:32PM -0700, Nishanth Aravamudan wrote:
> Ah, I see what you're saying, sorry. So, yes, take the pci_dev_put() out
> of the previous if-clause (the IRQ 10 case) and let pci_get_device()
> unconditionally do it?

Yes.

--===============91425631096639304==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============91425631096639304==--
