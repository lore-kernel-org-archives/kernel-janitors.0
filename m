From: Domen Puncer <domen@coderock.org>
Date: Fri, 20 Aug 2004 10:21:06 +0000
Subject: [Kernel-janitors] Re: list_for_each: arch-alpha-kernel-pci.c
Message-Id: <20040820102106.GB2592@masina.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============46964939860678356=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040820094611.GA2592@masina.coderock.org>
In-Reply-To: <20040820094611.GA2592@masina.coderock.org>
To: kernel-janitors@vger.kernel.org

--===============46964939860678356==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 20/08/04 06:29 +0100, Christoph Hellwig wrote:
> On Thu, Aug 19, 2004 at 01:11:18PM +0200, Domen Puncer wrote:
> > Hi.
> > 
> > Change for loops with list_for_each().
> 
> Please go directly to list_for_each_entry in all your patches where possible.

Or are you implying that code like:
        list_for_each(ln, &bus->devices) {
                struct pci_dev *dev = pci_dev_b(ln);

could be list_for_each_entry, since pci_dev_b is basically a list_entry?
If that is the case, what was the reason for pci_dev_b in first place?
More readability or maybe abstraction of pci code?


Thanks,

	Domen

> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.osdl.org
> http://lists.osdl.org/mailman/listinfo/kernel-janitors


--===============46964939860678356==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============46964939860678356==--
