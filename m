From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 22 Oct 2015 19:52:59 +0000
Subject: [patch] ACPI/CPPC: signedness bug in register_pcc_channel()
Message-Id: <20151022195259.GC24439@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Ashwin Chaugule <ashwin.chaugule@linaro.org>
Cc: Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, kernel-janitors@vger.kernel.org

The "pcc_subspace_idx" is -1 if it hasn't been initialized yet.  We need
it to be signed.

Fixes: 337aadff8e45 ('ACPI: Introduce CPU performance controls using CPPC')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/acpi/cppc_acpi.c b/drivers/acpi/cppc_acpi.c
index 0bbf84b..2ed5516 100644
--- a/drivers/acpi/cppc_acpi.c
+++ b/drivers/acpi/cppc_acpi.c
@@ -302,7 +302,7 @@ err_ret:
 }
 EXPORT_SYMBOL_GPL(acpi_get_psd_map);
 
-static int register_pcc_channel(unsigned pcc_subspace_idx)
+static int register_pcc_channel(int pcc_subspace_idx)
 {
 	struct acpi_pcct_subspace *cppc_ss;
 	unsigned int len;
