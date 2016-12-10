From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 10 Dec 2016 20:51:23 +0000
Subject: [PATCH 3/4] [media] bt8xx: Delete unnecessary variable initialisations in ca_send_message()
Message-Id: <f0c92913-f55f-5415-64c3-237d940b645e@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d9a0777b-8ea7-3f7d-4fa2-b16468c4a1a4@users.sourceforge.net>
In-Reply-To: <d9a0777b-8ea7-3f7d-4fa2-b16468c4a1a4@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Alexey Khoroshilov <khoroshilov@ispras.ru>, Hans Verkuil <hans.verkuil@cisco.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 10 Dec 2016 20:56:04 +0100

Two local variables will be set to an appropriate value a bit later.
Thus omit the explicit initialisation at the beginning.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/pci/bt8xx/dst_ca.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/pci/bt8xx/dst_ca.c b/drivers/media/pci/bt8xx/dst_ca.c
index 54e656ddd588..04d06c564602 100644
--- a/drivers/media/pci/bt8xx/dst_ca.c
+++ b/drivers/media/pci/bt8xx/dst_ca.c
@@ -475,9 +475,8 @@ static int dst_check_ca_pmt(struct dst_state *state, struct ca_msg *p_ca_message
 
 static int ca_send_message(struct dst_state *state, struct ca_msg *p_ca_message, void __user *arg)
 {
-	int i = 0;
-
-	u32 command = 0;
+	int i;
+	u32 command;
 	struct ca_msg *hw_buffer;
 	int result = 0;
 
-- 
2.11.0

