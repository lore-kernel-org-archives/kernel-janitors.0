From: Colin King <colin.king@canonical.com>
Date: Tue, 15 Aug 2017 10:09:58 +0000
Subject: [PATCH] char: ipmi: make function ipmi_get_info_from_resources static
Message-Id: <20170815100958.21542-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The function ipmi_get_info_from_resources is local to the source and
does not need to be in global scope, so make it static.  Add in
newline to function declaration to make it checkpatch warning clean.

Cleans up sparse warnings:
symbol 'ipmi_get_info_from_resources' was not declared. Should it
be static?

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/char/ipmi/ipmi_si_intf.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/char/ipmi/ipmi_si_intf.c b/drivers/char/ipmi/ipmi_si_intf.c
index c8632d537a59..1c2ff8e7daeb 100644
--- a/drivers/char/ipmi/ipmi_si_intf.c
+++ b/drivers/char/ipmi/ipmi_si_intf.c
@@ -2275,8 +2275,9 @@ static void spmi_find_bmc(void)
 #endif
 
 #if defined(CONFIG_DMI) || defined(CONFIG_ACPI)
-struct resource *ipmi_get_info_from_resources(struct platform_device *pdev,
-					      struct smi_info *info)
+static struct resource *
+ipmi_get_info_from_resources(struct platform_device *pdev,
+			     struct smi_info *info)
 {
 	struct resource *res, *res_second;
 
-- 
2.11.0

