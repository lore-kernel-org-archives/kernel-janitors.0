From: Christophe Lucas <c.lucas@ifrance.com>
Date: Sat, 19 Feb 2005 10:30:15 +0000
Subject: [KJ] Re: pci_find_device() in drivers/media/radio/
Message-Id: <20050219103015.GA23200@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============51096494598667275=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050218230521.GA3852@masina.coderock.org>
In-Reply-To: <20050218230521.GA3852@masina.coderock.org>
To: kernel-janitors@vger.kernel.org

--===============51096494598667275==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Domen Puncer (domen@coderock.org) wrote:
> Sorry for late reply.
> 
> On 02/02/05 17:22 +0100, Christophe Lucas wrote:
> > Hi,
> > 
> > Description:
> > >From : http://kerneljanitors.org/TODO
> > >- delete all pci_find_* functions from the kernel tree.
> > >  Instead of pci_find_device use pci_get_device()..
> > >-  convert from pci_module_init to pci_register_driver
> 
> Patch per concept would be nice.

Yeah, afterwards, I have released patches by concept as you advise me
here.

> Whitespace is nitpicking. :-)

I will pay attention on this. Thanks for all your comments.
I am here to help and learn a lot from all of you.

> About pci_dev_put... it should probably also be in _exit paths, so module
> can be reinserted?

You are right, I will soon released a patch that I hope correct.

> Comments?

Anymore comments, you are totally right.

	~Christophe


--===============51096494598667275==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============51096494598667275==--
