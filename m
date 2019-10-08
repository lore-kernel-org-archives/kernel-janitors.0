From: Colin King <colin.king@canonical.com>
Date: Tue, 08 Oct 2019 10:01:53 +0000
Subject: [PATCH][next] efi/tpm: fix sanity check of unsigned tbl_size being less than zero
Message-Id: <20191008100153.8499-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>, Jerry Snitselaar <jsnitsel@redhat.com>, Ingo Molnar <mingo@kernel.org>, linux-efi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently the check for tbl_size being less than zero is always false
because tbl_size is unsigned. Fix this by making it a signed int.

Addresses-Coverity: ("Unsigned compared against 0")
Fixes: e658c82be556 ("efi/tpm: Only set 'efi_tpm_final_log_size' after successful event log parsing")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/firmware/efi/tpm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/efi/tpm.c b/drivers/firmware/efi/tpm.c
index 703469c1ab8e..ebd7977653a8 100644
--- a/drivers/firmware/efi/tpm.c
+++ b/drivers/firmware/efi/tpm.c
@@ -40,7 +40,7 @@ int __init efi_tpm_eventlog_init(void)
 {
 	struct linux_efi_tpm_eventlog *log_tbl;
 	struct efi_tcg2_final_events_table *final_tbl;
-	unsigned int tbl_size;
+	int tbl_size;
 	int ret = 0;
 
 	if (efi.tpm_log = EFI_INVALID_TABLE_ADDR) {
-- 
2.20.1
