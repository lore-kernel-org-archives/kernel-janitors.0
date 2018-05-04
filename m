From: Colin King <colin.king@canonical.com>
Date: Fri, 04 May 2018 11:38:04 +0000
Subject: [PATCH] EDAC: fix spelling mistake: "redundacy" -> "redundancy"
Message-Id: <20180504113804.17103-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Borislav Petkov <bp@alien8.de>, linux-edac@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in err string

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/edac/i7core_edac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/edac/i7core_edac.c b/drivers/edac/i7core_edac.c
index 8c5540160a23..4d0ea3563d47 100644
--- a/drivers/edac/i7core_edac.c
+++ b/drivers/edac/i7core_edac.c
@@ -1743,7 +1743,7 @@ static void i7core_mce_output_error(struct mem_ctl_info *mci,
 		err = "write parity error";
 		break;
 	case 19:
-		err = "redundacy loss";
+		err = "redundancy loss";
 		break;
 	case 20:
 		err = "reserved";
-- 
2.17.0

