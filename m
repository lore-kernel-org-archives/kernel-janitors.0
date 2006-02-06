From: Matthew Wilcox <matthew@wil.cx>
Date: Mon, 06 Feb 2006 16:40:08 +0000
Subject: Re: [KJ] pci_set_drvdata()
Message-Id: <20060206164008.GH16090@parisc-linux.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============63049780365092678=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1139234943.7477.7.camel@localhost.localdomain>
In-Reply-To: <1139234943.7477.7.camel@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============63049780365092678==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 06, 2006 at 05:22:41PM +0100, Tobias Klauser wrote:
> On 2006-02-06 at 15:09:03 +0100, Matthew Martin <lihnucks@gmail.com> wrote:
> > -	pci_eisa_root.dev->driver_data = &pci_eisa_root;
> > +        pci_set_drvdata(pdev,&pci_eisa_root);
> 
> You replace a tab with spaces here which is against CodingStyle.

And you should place a space after a comma.


--===============63049780365092678==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============63049780365092678==--
