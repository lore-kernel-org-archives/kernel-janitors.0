From: Julia Lawall <julia@diku.dk>
Date: Sun, 19 Jul 2009 15:26:58 +0000
Subject: [PATCH 5/10] drivers/pci: Move a dereference below a NULL test
Message-Id: <Pine.LNX.4.64.0907191726360.16542@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kristen.c.accardi@intel.com, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

If the NULL test is necessary, then the dereference should be moved below
the NULL test.

The semantic patch that finds this problem is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@@
type T;
expression E,E1;
identifier i,fld;
statement S;
@@

- T i =3D E->fld;
+ T i;
  ... when !=3D E=E1
      when !=3D i
  if (E =3D NULL||...) S
+ i =3D E->fld;
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/pci/pcie/aspm.c             |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/pcie/aspm.c b/drivers/pci/pcie/aspm.c
index 3d27c97..fc8311b 100644
--- a/drivers/pci/pcie/aspm.c
+++ b/drivers/pci/pcie/aspm.c
@@ -668,10 +668,11 @@ out:
 void pcie_aspm_exit_link_state(struct pci_dev *pdev)
 {
 	struct pci_dev *parent =3D pdev->bus->self;
-	struct pcie_link_state *link_state =3D parent->link_state;
+	struct pcie_link_state *link_state;
=20
-	if (aspm_disabled || !pdev->is_pcie || !parent || !link_state)
+	if (aspm_disabled || !pdev->is_pcie || !parent || !parent->link_state)
 		return;
+	link_state =3D parent->link_state;
 	if (parent->pcie_type !=3D PCI_EXP_TYPE_ROOT_PORT &&
 		parent->pcie_type !=3D PCI_EXP_TYPE_DOWNSTREAM)
 		return;
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
