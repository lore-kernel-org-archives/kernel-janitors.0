From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Wed, 29 Sep 2004 13:09:52 +0000
Subject: [Kernel-janitors] Status of pci_find_device fixes
Message-Id: <415AB420.9050406@nuerscht.ch>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============49191194472313393=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============49191194472313393==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Hi

I saw this entry in the TODO list:

------------------------------------------------------------------------
From: Greg KH

- delete all pci_find_* functions from the kernel tree.
   Instead of pci_find_device use pci_get_device()..

 > Looking at pci.txt, it appears that if I use pci_get_device(), I will
 > also need to use pci_dev_put().
------------------------------------------------------------------------

Since I'm interested in the PCI section in the kernel (and Greg pointed 
me to that when I was bugging him ;), I thought this would be a good 
point to start helping. While crawling through the kernel-janitor 
archives I noticed, that there's already work ongoing on that issue.

What's the status of this and are there drivers which still need to be 
fixed?

Thanks, Tobias

--===============49191194472313393==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============49191194472313393==--
