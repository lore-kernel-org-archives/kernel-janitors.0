From: Grant Likely <grant.likely@secretlab.ca>
Date: Tue, 03 Aug 2010 22:00:25 +0000
Subject: Re: [PATCH 8/9] arch/powerpc/kernel: Drop unnecessary null test
Message-Id: <AANLkTi=yOJ0Zfsn_h_xWai5O=OPkccMb-hDwKK+dWZwf@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1008032334420.20393@ask.diku.dk>
	<20100803215137.GU26313@bicker>
In-Reply-To: <20100803215137.GU26313@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <error27@gmail.com>, Julia Lawall <julia@diku.dk>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Grant Likely <grant.likely@secretlab.ca>, linuxppc-dev@ozlabs.org, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kernel-janitors@vger.kernel.org

On Tue, Aug 3, 2010 at 3:51 PM, Dan Carpenter <error27@gmail.com> wrote:
> On Tue, Aug 03, 2010 at 11:35:17PM +0200, Julia Lawall wrote:
>> diff --git a/arch/powerpc/kernel/pci_of_scan.c b/arch/powerpc/kernel/pci=
_of_scan.c
>> index 6ddb795..62dd363 100644
>> --- a/arch/powerpc/kernel/pci_of_scan.c
>> +++ b/arch/powerpc/kernel/pci_of_scan.c
>> @@ -336,8 +336,7 @@ static void __devinit __of_scan_bus(struct device_no=
de *node,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (dev->hdr_type =3D PCI_HEADER_TYPE_BRIDGE=
 ||
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev->hdr_type =3D PCI_HEADER_TYPE_CA=
RDBUS) {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct device_node *child =
=3D pci_device_to_OF_node(dev);
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (dev)
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 of_scan_pci_br=
idge(child, dev);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 of_scan_pci_bridge(child, dev);
>
> The intention was probably to check "child" instead of "dev".
> pci_device_to_OF_node() can return NULL. =A0On the other hand the code
> has been this way for a year and no one has complained...

Still, it should be fixed.  It is likely that I'll be generalizing
this code for other architectures in the near future.  I'll spin a
patch.

g.
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
