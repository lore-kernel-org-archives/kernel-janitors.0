From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 28 Mar 2018 12:52:22 +0000
Subject: [PATCH -next] efi/libstub/tpm: efi_retrieve_tpm2_eventlog_1_2() can be static
Message-Id: <1522241542-77900-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAKv+Gu8VFYEjo_Uy44QARj3j3WEtayyh92+Db=np=ig-z+PZ2g@mail.gmail.com>
In-Reply-To: <CAKv+Gu8VFYEjo_Uy44QARj3j3WEtayyh92+Db=np=ig-z+PZ2g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fixes the following sparse warning:

drivers/firmware/efi/libstub/tpm.c:62:6: warning:
 symbol 'efi_retrieve_tpm2_eventlog_1_2' was not declared. Should it be static?

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/firmware/efi/libstub/tpm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/efi/libstub/tpm.c b/drivers/firmware/efi/libstub/tpm.c
index 9d08cea..caa37a6 100644
--- a/drivers/firmware/efi/libstub/tpm.c
+++ b/drivers/firmware/efi/libstub/tpm.c
@@ -59,7 +59,7 @@ void efi_enable_reset_attack_mitigation(efi_system_table_t *sys_table_arg)
 
 #endif
 
-void efi_retrieve_tpm2_eventlog_1_2(efi_system_table_t *sys_table_arg)
+static void efi_retrieve_tpm2_eventlog_1_2(efi_system_table_t *sys_table_arg)
 {
 	efi_guid_t tcg2_guid = EFI_TCG2_PROTOCOL_GUID;
 	efi_guid_t linux_eventlog_guid = LINUX_EFI_TPM_EVENT_LOG_GUID;

