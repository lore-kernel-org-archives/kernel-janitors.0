From: "Feldman, Scott" <scott.feldman@intel.com>
Date: Mon, 20 Sep 2004 18:16:47 +0000
Subject: RE: [Kernel-janitors] pci_find_* to pci_get_*
Message-Id: <C6F5CF431189FA4CBAEC9E7DD5441E0103AF632D@orsmsx402.amr.corp.intel.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============81516794560231998=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1095662774.4052.10.camel@sfeldma-mobl2.dsl-verizon.net>
In-Reply-To: <1095662774.4052.10.camel@sfeldma-mobl2.dsl-verizon.net>
To: kernel-janitors@vger.kernel.org

--===============81516794560231998==
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 8bit

> No you do not, please read the documentation for pci_get_device().
> Actually this patch is incorrect for a different reason, that
> pci_dev_put() is not needed at all, as pci_get_device() 
> handles the put on the device for you properly.

Ahh, perfect!
 
> So, Scott, care to fix the patch?

Yup, tonight.

-scott


--===============81516794560231998==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============81516794560231998==--
