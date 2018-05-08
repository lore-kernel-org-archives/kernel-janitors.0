From: Colin King <colin.king@canonical.com>
Date: Tue, 08 May 2018 22:01:51 +0000
Subject: [PATCH] [ATM] firestream: fix spelling mistake: "reseverd" -> "reserved"
Message-Id: <20180508220151.20725-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chas Williams <3chas3@gmail.com>, linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in res_strings string array

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/atm/firestream.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/atm/firestream.c b/drivers/atm/firestream.c
index d97c05690faa..4e46dc9e41ad 100644
--- a/drivers/atm/firestream.c
+++ b/drivers/atm/firestream.c
@@ -191,7 +191,7 @@ static char *res_strings[] = {
 	"reserved 37",
 	"reserved 38",
 	"reserved 39",
-	"reseverd 40",
+	"reserved 40",
 	"reserved 41", 
 	"reserved 42", 
 	"reserved 43", 
-- 
2.17.0

