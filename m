From: "tip-bot2 for Colin Ian King" <tip-bot2@linutronix.de>
Date: Tue, 08 Oct 2019 11:05:19 +0000
Subject: [tip: efi/urgent] efi/tpm: Fix sanity check of unsigned tbl_size being less than zero
Message-Id: <157053271938.9978.4783819046234300891.tip-bot2@tip-bot2>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191008100153.8499-1-colin.king@canonical.com>
In-Reply-To: <20191008100153.8499-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-tip-commits@vger.kernel.org
Cc: Colin Ian King <colin.king@canonical.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Jerry Snitselaar <jsnitsel@redhat.com>, Linus Torvalds <torvalds@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, kernel-janitors@vger.kernel.org, linux-efi@vger.kernel.org, Ingo Molnar <mingo@kernel.org>, Borislav Petkov <bp@alien8.de>, linux-kernel@vger.kernel.org

The following commit has been merged into the efi/urgent branch of tip:

Commit-ID:     be59d57f98065af0b8472f66a0a969207b168680
Gitweb:        https://git.kernel.org/tip/be59d57f98065af0b8472f66a0a969207b168680
Author:        Colin Ian King <colin.king@canonical.com>
AuthorDate:    Tue, 08 Oct 2019 11:01:53 +01:00
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Tue, 08 Oct 2019 13:01:09 +02:00

efi/tpm: Fix sanity check of unsigned tbl_size being less than zero

Currently the check for tbl_size being less than zero is always false
because tbl_size is unsigned. Fix this by making it a signed int.

Addresses-Coverity: ("Unsigned compared against 0")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc: Jerry Snitselaar <jsnitsel@redhat.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: kernel-janitors@vger.kernel.org
Cc: linux-efi@vger.kernel.org
Fixes: e658c82be556 ("efi/tpm: Only set 'efi_tpm_final_log_size' after successful event log parsing")
Link: https://lkml.kernel.org/r/20191008100153.8499-1-colin.king@canonical.com
Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 drivers/firmware/efi/tpm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/efi/tpm.c b/drivers/firmware/efi/tpm.c
index 703469c..ebd7977 100644
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
