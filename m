From: Hanna Linder <hannal@us.ibm.com>
Date: Wed, 29 Sep 2004 18:15:33 +0000
Subject: Re: [Kernel-janitors] Status of pci_find_device fixes
Message-Id: <78330000.1096481733@w-hlinder.beaverton.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============55518510799143206=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <415AB420.9050406@nuerscht.ch>
In-Reply-To: <415AB420.9050406@nuerscht.ch>
To: kernel-janitors@vger.kernel.org

--===============55518510799143206==
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--On Wednesday, September 29, 2004 03:09:52 PM +0200 Tobias Klauser <tklauser@nuerscht.ch> wrote:
> 
> Since I'm interested in the PCI section in the kernel (and Greg pointed me to that when I was bugging him ;), I thought this would be a good point to start helping. While crawling through the
> kernel-janitor archives I noticed, that there's already work ongoing on that issue.
> 
> What's the status of this and are there drivers which still need to be fixed?

Hi Tobias,

Thanks for your interest. There are a couple of us working in this area already but if we all
coordinate it should help get the work done quickly. Scott is doing everything under drivers/net
to start with. Greg and I finished everything under arch/i386. Right now I am working on
all the drivers that can be converted to the new pci_dev_present function. That leaves over
100 drivers that need to be converted (cscope and grep are your friend).

If this sounds like something you are interested in feel free to jump in and make sure to
send you patches back to the list. If you want to make sure no one else is working on the 
same driver before you start that would be good. Use this list, that is what it is for. 

Hanna



--===============55518510799143206==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============55518510799143206==--
