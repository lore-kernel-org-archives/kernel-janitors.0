From: Domen Puncer <domen@coderock.org>
Date: Fri, 20 Aug 2004 09:46:11 +0000
Subject: [Kernel-janitors] Re: list_for_each: arch-alpha-kernel-pci.c
Message-Id: <20040820094611.GA2592@masina.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============88255845083019668=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============88255845083019668==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 20/08/04 06:29 +0100, Christoph Hellwig wrote:
> On Thu, Aug 19, 2004 at 01:11:18PM +0200, Domen Puncer wrote:
> > Hi.
> > 
> > Change for loops with list_for_each().
> 
> Please go directly to list_for_each_entry in all your patches where possible.

Well, i did that on Jul 29. (these and those patches are forward ports
from an old patchset).


> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.osdl.org
> http://lists.osdl.org/mailman/listinfo/kernel-janitors


--===============88255845083019668==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============88255845083019668==--
