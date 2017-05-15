From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 15 May 2017 12:26:39 +0000
Subject: [PATCH 1/4] pcmcia: pd6729: Use kcalloc() in pd6729_pci_probe()
Message-Id: <efe4fbad-19da-55ba-678f-eb325e060dc9@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <07cd817c-3045-72d8-34e2-e81b73efc291@users.sourceforge.net>
In-Reply-To: <07cd817c-3045-72d8-34e2-e81b73efc291@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-pcmcia@lists.infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 15 May 2017 11:41:00 +0200

* A multiplication for the size determination of a memory allocation
  indicated that an array data structure should be processed.
  Thus reuse the corresponding function "kcalloc".

  This issue was detected by using the Coccinelle software.

* Replace the specification of a data structure by a pointer dereference
  to make the corresponding size determination a bit safer according to
  the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/pcmcia/pd6729.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/pcmcia/pd6729.c b/drivers/pcmcia/pd6729.c
index 0f70b4d58f9e..289a5e74e852 100644
--- a/drivers/pcmcia/pd6729.c
+++ b/drivers/pcmcia/pd6729.c
@@ -628,6 +628,5 @@ static int pd6729_pci_probe(struct pci_dev *dev,
 	char configbyte;
 	struct pd6729_socket *socket;
 
-	socket = kzalloc(sizeof(struct pd6729_socket) * MAX_SOCKETS,
-			 GFP_KERNEL);
+	socket = kcalloc(MAX_SOCKETS, sizeof(*socket), GFP_KERNEL);
 	if (!socket) {
-- 
2.13.0

