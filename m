From: "Ju, Seokmann" <sju@lsil.com>
Date: Tue, 22 Feb 2005 13:46:49 +0000
Subject: [KJ] RE: [PATCH 15/19] drivers/scsi/megaraid: Use the DMA_{64,
Message-Id: <0E3FA95632D6D047BA649F95DAB60E57036626CE@exa-atlanta>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============51097694161871643=="
List-Id: <kernel-janitors.vger.kernel.org>
To: 'Tobias Klauser' <tklauser@nuerscht.ch>, kernel-janitors@lists.osdl.org
Cc: linux-scsi@vger.kernel.org, "Ju, Seokmann" <sju@lsil.com>

--===============51097694161871643==
Content-Type: text/plain

On Sunday, February 20, 2005 12:10 PM, Tobias wrote:
> Hello,
> 
> Description: Use the DMA_{64,32}BIT_MASK constants from dma-mapping.h
> when calling pci_set_dma_mask() or pci_set_consistent_dma_mask()
> See http://marc.theaimsgroup.com/?t=108001993000001&r=1&w=2 for details

Thanks for your input.

Next release driver will have this change included.

Thanks again.

Seokmann
LSI Logic Corporation.


--===============51097694161871643==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============51097694161871643==--
