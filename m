From: Hanna Linder <hannal@us.ibm.com>
Date: Tue, 12 Oct 2004 16:38:52 +0000
Subject: [KJ] Re: [Kernel-janitors] [PATCH 2.6][9/12] pplus.c
Message-Id: <136400000.1097599132@w-hlinder.beaverton.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============45236338512655871=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <33930000.1097191565@w-hlinder.beaverton.ibm.com> <1097341320.3903.3.camel@sfeldma-mobl2.dsl-verizon.net>
In-Reply-To: <1097341320.3903.3.camel@sfeldma-mobl2.dsl-verizon.net>
To: sfeldma@pobox.com
Cc: Hanna Linder <hannal@us.ibm.com>, lkml <linux-kernel@vger.kernel.org>, kernel-janitors <kernel-janitors@lists.osdl.org>, benh@kernel.crashing.org, paulus@samba.org, greg@kroah.com

--===============45236338512655871==
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--On Saturday, October 09, 2004 10:02:01 AM -0700 Scott Feldman <sfeldma@pobox.com> wrote:

> On Thu, 2004-10-07 at 16:26, Hanna Linder wrote:
>> -	if ((dev = pci_find_device(PCI_VENDOR_ID_WINBOND,
>> +	if ((dev = pci_get_device(PCI_VENDOR_ID_WINBOND,
>>  				   PCI_DEVICE_ID_WINBOND_82C105, dev))) {
>>  		/*
>>  		 * Disable LEGIRQ mode so PCI INTS are routed
> 
> Missing cleanup at the bottom of func?
> 
> 	if(dev)
> 		pci_dev_put(dev);
> 
> -scott

Hi Scott,

It doesnt need an explicit dev_put because the pci_dev * is used as the *from pointer
in the pci_get_device call which will do the dev_put automaticaly.

Hanna


--===============45236338512655871==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============45236338512655871==--
