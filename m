From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Date: Wed, 29 Sep 2004 22:15:30 +0000
Subject: [Kernel-janitors] Re: [PATCH 2.6.9-rc2-mm4 zr36120.c][5/8] Convert
Message-Id: <1096496127.16721.10.camel@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============50618274914241734=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <19730000.1096496900@w-hlinder.beaverton.ibm.com>
In-Reply-To: <19730000.1096496900@w-hlinder.beaverton.ibm.com>
To: Hanna Linder <hannal@us.ibm.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kernel-janitors@lists.osdl.org, greg@kroah.com, kraxel@bytesex.org

--===============50618274914241734==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mer, 2004-09-29 at 23:28, Hanna Linder wrote:
> The dev was not used from pci_find_device so it was acceptable to replace
> with pci_dev_present. There was no need for it to be in a while loop originally.
> Compile tested.

That code should die I think. All the tests it does are done in
pci/quirks.c and set up pci_pci_flags


--===============50618274914241734==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============50618274914241734==--
