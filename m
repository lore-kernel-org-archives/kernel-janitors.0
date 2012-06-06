From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Wed, 06 Jun 2012 21:41:35 +0000
Subject: [PATCH 1/7] drivers/ide/ide-cs.c: adjust suspicious bit operation
Message-Id: <1339018901-28439-2-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1339018901-28439-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1339018901-28439-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S. Miller" <davem@davemloft.net>
Cc: kernel-janitors@vger.kernel.org, linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org, joe@perches.com, Julia Lawall <julia@diku.dk>

From: Julia Lawall <Julia.Lawall@lip6.fr>

IO_DATA_PATH_WIDTH_8 is 0, so a bit-and with it is always false.  The
value IO_DATA_PATH_WIDTH covers the bits of the IO_DATA_PATH constants, so
first pick those bits and then make the test using !=.

This problem was found using Coccinelle (http://coccinelle.lip6.fr/).

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/ide/ide-cs.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/ide/ide-cs.c b/drivers/ide/ide-cs.c
index 28e344e..a5e57bf 100644
--- a/drivers/ide/ide-cs.c
+++ b/drivers/ide/ide-cs.c
@@ -167,7 +167,8 @@ static int pcmcia_check_one_config(struct pcmcia_device *pdev, void *priv_data)
 {
 	int *is_kme = priv_data;
 
-	if (!(pdev->resource[0]->flags & IO_DATA_PATH_WIDTH_8)) {
+	if ((p1dev->resource[0]->flags & IO_DATA_PATH_WIDTH)
+	    != IO_DATA_PATH_WIDTH_8) {
 		pdev->resource[0]->flags &= ~IO_DATA_PATH_WIDTH;
 		pdev->resource[0]->flags |= IO_DATA_PATH_WIDTH_AUTO;
 	}

