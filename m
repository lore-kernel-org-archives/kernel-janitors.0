From: Julia Lawall <Julia.Lawall@inria.fr>
Date: Sun, 27 Sep 2020 19:12:18 +0000
Subject: [PATCH 08/18] agp: use semicolons rather than commas to separate statements
Message-Id: <1601233948-11629-9-git-send-email-Julia.Lawall@inria.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1601233948-11629-1-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1601233948-11629-1-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: =?UTF-8?q?Valdis=20Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>, Joe Perches <joe@perches.com>, Thomas Gleixner <tglx@linutronix.de>, kernel-janitors@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org

Replace commas with semicolons.  What is done is essentially described by
the following Coccinelle semantic patch (http://coccinelle.lip6.fr/):

// <smpl>
@@ expression e1,e2; @@
e1
-,
+;
e2
... when any
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/char/agp/amd-k7-agp.c |    2 +-
 drivers/char/agp/nvidia-agp.c |    2 +-
 drivers/char/agp/sworks-agp.c |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/char/agp/amd-k7-agp.c b/drivers/char/agp/amd-k7-agp.c
index 6914e4f0ce98..2b2095542816 100644
--- a/drivers/char/agp/amd-k7-agp.c
+++ b/drivers/char/agp/amd-k7-agp.c
@@ -425,7 +425,7 @@ static int agp_amdk7_probe(struct pci_dev *pdev,
 		return -ENOMEM;
 
 	bridge->driver = &amd_irongate_driver;
-	bridge->dev_private_data = &amd_irongate_private,
+	bridge->dev_private_data = &amd_irongate_private;
 	bridge->dev = pdev;
 	bridge->capndx = cap_ptr;
 
diff --git a/drivers/char/agp/nvidia-agp.c b/drivers/char/agp/nvidia-agp.c
index 623205bcd04a..f78e756157db 100644
--- a/drivers/char/agp/nvidia-agp.c
+++ b/drivers/char/agp/nvidia-agp.c
@@ -382,7 +382,7 @@ static int agp_nvidia_probe(struct pci_dev *pdev,
 		return -ENOMEM;
 
 	bridge->driver = &nvidia_driver;
-	bridge->dev_private_data = &nvidia_private,
+	bridge->dev_private_data = &nvidia_private;
 	bridge->dev = pdev;
 	bridge->capndx = cap_ptr;
 
diff --git a/drivers/char/agp/sworks-agp.c b/drivers/char/agp/sworks-agp.c
index 7729414100ff..f875970bda65 100644
--- a/drivers/char/agp/sworks-agp.c
+++ b/drivers/char/agp/sworks-agp.c
@@ -513,7 +513,7 @@ static int agp_serverworks_probe(struct pci_dev *pdev,
 		return -ENOMEM;
 
 	bridge->driver = &sworks_driver;
-	bridge->dev_private_data = &serverworks_private,
+	bridge->dev_private_data = &serverworks_private;
 	bridge->dev = pci_dev_get(pdev);
 
 	pci_set_drvdata(pdev, bridge);
