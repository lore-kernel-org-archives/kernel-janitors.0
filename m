From: "chas williams - CONTRACTOR" <chas@cmf.nrl.navy.mil>
Date: Tue, 15 Feb 2005 13:46:41 +0000
Subject: Re: [KJ] [PATCH 2/18] drivers/atm/ remove pci_find_{device, subsys}
Message-Id: <200502151346.j1FDkf47007112@ginger.cmf.nrl.navy.mil>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============83787197521328727=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200502141107.53021.amitg@calsoftinc.com>
In-Reply-To: <200502141107.53021.amitg@calsoftinc.com>
To: kernel-janitors@vger.kernel.org

--===============83787197521328727==

In message <20050214184902.GV7815@kroah.com>,Greg KH writes:
>> -	pci_dev = pci_find_device(PCI_VENDOR_ID_FORE, PCI_DEVICE_ID_FORE_PCA200
>E, pci_dev);
>> +	pci_dev = pci_get_device(PCI_VENDOR_ID_FORE, PCI_DEVICE_ID_FORE_PCA200E
>
>No, this is incorrect, please do not apply.

i have a patch that fixes this the right way.  i will submit it later
this week.

--===============83787197521328727==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============83787197521328727==--
