From: Colin King <colin.king@canonical.com>
Date: Fri, 09 Nov 2018 13:37:57 +0000
Subject: [PATCH] EDAC: clean an indentation issues, replace spaces for tabs
Message-Id: <20181109133757.21471-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Gross <mark.gross@intel.com>, Borislav Petkov <bp@alien8.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, Ranganathan Desikan <ravi@jetztechnologies.com>, "Arvind R ." <arvino55@gmail.com>, linux-edac@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to clean up an indentation issues, replacing 7 space chars
for a tab and also inserting a missing indentation

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/edac/e752x_edac.c   | 4 ++--
 drivers/edac/i3000_edac.c   | 4 ++--
 drivers/edac/i5000_edac.c   | 4 ++--
 drivers/edac/i7core_edac.c  | 2 +-
 drivers/edac/i82975x_edac.c | 4 ++--
 5 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/edac/e752x_edac.c b/drivers/edac/e752x_edac.c
index b5de9a13ea3f..de732dc2ef33 100644
--- a/drivers/edac/e752x_edac.c
+++ b/drivers/edac/e752x_edac.c
@@ -1446,8 +1446,8 @@ static int __init e752x_init(void)
 
 	edac_dbg(3, "\n");
 
-       /* Ensure that the OPSTATE is set correctly for POLL or NMI */
-       opstate_init();
+	/* Ensure that the OPSTATE is set correctly for POLL or NMI */
+	opstate_init();
 
 	pci_rc = pci_register_driver(&e752x_driver);
 	return (pci_rc < 0) ? pci_rc : 0;
diff --git a/drivers/edac/i3000_edac.c b/drivers/edac/i3000_edac.c
index 8085a32ec3bd..f564a4a8a4ae 100644
--- a/drivers/edac/i3000_edac.c
+++ b/drivers/edac/i3000_edac.c
@@ -508,8 +508,8 @@ static int __init i3000_init(void)
 
 	edac_dbg(3, "MC:\n");
 
-       /* Ensure that the OPSTATE is set correctly for POLL or NMI */
-       opstate_init();
+	/* Ensure that the OPSTATE is set correctly for POLL or NMI */
+	opstate_init();
 
 	pci_rc = pci_register_driver(&i3000_driver);
 	if (pci_rc < 0)
diff --git a/drivers/edac/i5000_edac.c b/drivers/edac/i5000_edac.c
index 53f24b18cd61..98bef13e3134 100644
--- a/drivers/edac/i5000_edac.c
+++ b/drivers/edac/i5000_edac.c
@@ -1559,8 +1559,8 @@ static int __init i5000_init(void)
 
 	edac_dbg(2, "MC:\n");
 
-       /* Ensure that the OPSTATE is set correctly for POLL or NMI */
-       opstate_init();
+	/* Ensure that the OPSTATE is set correctly for POLL or NMI */
+	opstate_init();
 
 	pci_rc = pci_register_driver(&i5000_driver);
 
diff --git a/drivers/edac/i7core_edac.c b/drivers/edac/i7core_edac.c
index 9ef448fef12f..40297550313a 100644
--- a/drivers/edac/i7core_edac.c
+++ b/drivers/edac/i7core_edac.c
@@ -724,7 +724,7 @@ static ssize_t i7core_inject_type_store(struct device *dev,
 					const char *data, size_t count)
 {
 	struct mem_ctl_info *mci = to_mci(dev);
-struct i7core_pvt *pvt = mci->pvt_info;
+	struct i7core_pvt *pvt = mci->pvt_info;
 	unsigned long value;
 	int rc;
 
diff --git a/drivers/edac/i82975x_edac.c b/drivers/edac/i82975x_edac.c
index d514e7a8fa4d..ce1d6abfc6af 100644
--- a/drivers/edac/i82975x_edac.c
+++ b/drivers/edac/i82975x_edac.c
@@ -648,8 +648,8 @@ static int __init i82975x_init(void)
 
 	edac_dbg(3, "\n");
 
-       /* Ensure that the OPSTATE is set correctly for POLL or NMI */
-       opstate_init();
+	/* Ensure that the OPSTATE is set correctly for POLL or NMI */
+	opstate_init();
 
 	pci_rc = pci_register_driver(&i82975x_driver);
 	if (pci_rc < 0)
-- 
2.19.1
