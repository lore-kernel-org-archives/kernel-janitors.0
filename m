From: Hanna Linder <hannal@us.ibm.com>
Date: Tue, 12 Oct 2004 16:39:13 +0000
Subject: [KJ] Re: [Kernel-janitors] [PATCH 2.6][10/12] prep_pci.c
Message-Id: <136720000.1097599153@w-hlinder.beaverton.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============77252896327618314=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <35460000.1097192417@w-hlinder.beaverton.ibm.com> <1097341535.3903.6.camel@sfeldma-mobl2.dsl-verizon.net>
In-Reply-To: <1097341535.3903.6.camel@sfeldma-mobl2.dsl-verizon.net>
To: sfeldma@pobox.com
Cc: Hanna Linder <hannal@us.ibm.com>, lkml <linux-kernel@vger.kernel.org>, kernel-janitors <kernel-janitors@lists.osdl.org>, benh@kernel.crashing.org, paulus@samba.org, greg@kroah.com

--===============77252896327618314==
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--On Saturday, October 09, 2004 10:05:35 AM -0700 Scott Feldman <sfeldma@pobox.com> wrote:

> On Thu, 2004-10-07 at 16:40, Hanna Linder wrote:
>> @@ -1102,7 +1102,7 @@ prep_pib_init(void)
>>  		}
>>  	}
>>  
>> -	if ((dev = pci_find_device(PCI_VENDOR_ID_WINBOND,
>> +	if ((dev = pci_get_device(PCI_VENDOR_ID_WINBOND,
>>  				   PCI_DEVICE_ID_WINBOND_82C105, dev))){
>>  		if (OpenPIC_Addr){
>>  			/*
> 
> Missing pci_dev_put(dev) cleanup?
> 
> -scott
> 
> 

Hi Scott,

It doesnt need an explicit dev_put because the pci_dev * is used as the *from pointer
in the pci_get_device call which will do the dev_put automaticaly.

Hanna


--===============77252896327618314==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============77252896327618314==--
