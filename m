From: Domen Puncer <domen@coderock.org>
Date: Fri, 20 Aug 2004 19:00:35 +0000
Subject: [Kernel-janitors] [patch 0/12] pci_dev_b to list_for_each_entry:
Message-Id: <20040820190038.021959@masina.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============1088571566277694=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============1088571566277694==

Hi.

Incremental patches to 2.6.8-kjt2 follow in reply.
list_for_each & pci_(dev|bus)_[bg] replaced by list_for_each_entry.
i386 patches compile tested.


Signed-off-by: Domen Puncer <domen@coderock.org>

 arch/alpha/kernel/pci.c                  |   16 +----
 arch/i386/pci/i386.c                     |    4 -
 arch/ia64/pci/pci.c                      |    6 -
 arch/ia64/sn/io/machvec/pci_bus_cvlink.c |    4 -
 arch/ppc/kernel/pci.c                    |   27 ++------
 arch/ppc64/kernel/pSeries_pci.c          |    5 -
 arch/ppc64/kernel/pci.c                  |   11 +--
 arch/ppc64/kernel/pci_dn.c               |    4 -
 arch/sparc/kernel/pcic.c                 |    5 -
 arch/sparc64/kernel/pci_common.c         |   97 +++++++++++++++----------------
 arch/sparc64/kernel/pci_sabre.c          |   11 +--
 drivers/pci/setup-bus.c                  |   12 +--
 12 files changed, 85 insertions(+), 117 deletions(-)

--===============1088571566277694==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============1088571566277694==--
