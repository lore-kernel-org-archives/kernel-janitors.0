From: Matthew Wilcox <matthew@wil.cx>
Date: Fri, 31 Mar 2006 13:55:57 +0000
Subject: Re: [KJ][Patch] fix kbuild warning in sisfb.o
Message-Id: <20060331135557.GO13590@parisc-linux.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============13431485726432513=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1143810678.7834.13.camel@localhost.localdomain> <20060331132929.GE3893@stusta.de>
In-Reply-To: <20060331132929.GE3893@stusta.de>
To: Adrian Bunk <bunk@stusta.de>
Cc: Darren Jenkins <darrenrjenkins@gmail.com>, kernel Janitors <kernel-janitors@lists.osdl.org>, thomas@winischhofer.net, linux-kernel@vger.kernel.org

--===============13431485726432513==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 31, 2006 at 03:29:29PM +0200, Adrian Bunk wrote:
> > This is caused by the 'pci_driver struct' in sis_main.c having a pointer
> > to a 'pci_device_id struct' in 'sis_main.h' that is marked as
> > __devinitdata.
> > 
> > The patch below just removes the __devinitdata annotation from the
> > 'pci_device_id struct', which seems like the best solution here.
> 
> ACK, this is a bug that should be fixed.

If it is, then Documentation/pci.txt needs to be updated:

        The struct pci_driver shouldn't be marked with any of these tags.
        The ID table array should be marked __devinitdata.


--===============13431485726432513==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============13431485726432513==--
