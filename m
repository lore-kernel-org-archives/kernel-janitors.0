From: Amit Gud <amitg@calsoftinc.com>
Date: Mon, 14 Feb 2005 05:42:27 +0000
Subject: [KJ] [PATCH 0/18] remove pci_find_{device, subsys}
Message-Id: <200502141100.27369.amitg@calsoftinc.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============23924764890137129=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============23924764890137129==
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi there,

	Following patch series converts pci_find_device to pci_get_device. Plus it removes deprecated functions pci_find_device and pci_find_subsys entirely from the tree, except for the Documentation/pci.txt

	The patch division is done at the drivers/ and arch/ level.


Best,
AG
--
May the source be with you.


--===============23924764890137129==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============23924764890137129==--
