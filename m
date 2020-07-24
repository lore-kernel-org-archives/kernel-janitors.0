From: garritfra <garritfranke@gmail.com>
Date: Fri, 24 Jul 2020 16:02:39 +0000
Subject: [PATCH] trivial: acpi: replace some bitshifts with BIT macro
Message-Id: <20200724160239.16284-1-garritfranke@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: robert.moore@intel.com, rafael.j.wysocki@intel.com, lenb@kernel.org, trivial@kernel.org, linux-acpi@vger.kernel.org, devel@acpica.org, kernel-janitors@vger.kernel.org
Cc: garritfra <garritfranke@gmail.com>

Signed-off-by: garritfra <garritfranke@gmail.com>
---
 drivers/acpi/acpica/exfldio.c   | 2 +-
 drivers/acpi/acpica/utownerid.c | 6 +++---
 drivers/acpi/bus.c              | 2 +-
 drivers/acpi/sleep.c            | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/acpi/acpica/exfldio.c b/drivers/acpi/acpica/exfldio.c
index ade35ff1c7..92fc702456 100644
--- a/drivers/acpi/acpica/exfldio.c
+++ b/drivers/acpi/acpica/exfldio.c
@@ -298,7 +298,7 @@ acpi_ex_register_overflow(union acpi_operand_object *obj_desc, u64 value)
 		return (FALSE);
 	}
 
-	if (value >= ((u64) 1 << obj_desc->common_field.bit_length)) {
+	if (value >= ((u64) BIT(obj_desc->common_field.bit_length))) {
 		/*
 		 * The Value is larger than the maximum value that can fit into
 		 * the register.
diff --git a/drivers/acpi/acpica/utownerid.c b/drivers/acpi/acpica/utownerid.c
index d3525ef8ed..c4e2db2f54 100644
--- a/drivers/acpi/acpica/utownerid.c
+++ b/drivers/acpi/acpica/utownerid.c
@@ -74,13 +74,13 @@ acpi_status acpi_ut_allocate_owner_id(acpi_owner_id *owner_id)
 			 * int. Some compilers or runtime error detection may flag this as
 			 * an error.
 			 */
-			if (!(acpi_gbl_owner_id_mask[j] & ((u32)1 << k))) {
+			if (!(acpi_gbl_owner_id_mask[j] & (u32)BIT(k))) {
 				/*
 				 * Found a free ID. The actual ID is the bit index plus one,
 				 * making zero an invalid Owner ID. Save this as the last ID
 				 * allocated and update the global ID mask.
 				 */
-				acpi_gbl_owner_id_mask[j] |= ((u32)1 << k);
+				acpi_gbl_owner_id_mask[j] |= (u32)BIT(k);
 
 				acpi_gbl_last_owner_id_index = (u8)j;
 				acpi_gbl_next_owner_id_offset = (u8)(k + 1);
@@ -171,7 +171,7 @@ void acpi_ut_release_owner_id(acpi_owner_id *owner_id_ptr)
 	/* Decode ID to index/offset pair */
 
 	index = ACPI_DIV_32(owner_id);
-	bit = (u32)1 << ACPI_MOD_32(owner_id);
+	bit = (u32)BIT(ACPI_MOD_32(owner_id));
 
 	/* Free the owner ID only if it is valid */
 
diff --git a/drivers/acpi/bus.c b/drivers/acpi/bus.c
index 54002670cb..39ead80c45 100644
--- a/drivers/acpi/bus.c
+++ b/drivers/acpi/bus.c
@@ -233,7 +233,7 @@ acpi_status acpi_run_osc(acpi_handle handle, struct acpi_osc_context *context)
 		goto out_kfree;
 	}
 	/* Need to ignore the bit0 in result code */
-	errors = *((u32 *)out_obj->buffer.pointer) & ~(1 << 0);
+	errors = *((u32 *)out_obj->buffer.pointer) & BIT(0);
 	if (errors) {
 		if (errors & OSC_REQUEST_ERROR)
 			acpi_print_osc_error(handle, context,
diff --git a/drivers/acpi/sleep.c b/drivers/acpi/sleep.c
index aff13bf4d9..38f5210313 100644
--- a/drivers/acpi/sleep.c
+++ b/drivers/acpi/sleep.c
@@ -880,7 +880,7 @@ static void acpi_sleep_run_lps0_dsm(unsigned int func)
 {
 	union acpi_object *out_obj;
 
-	if (!(lps0_dsm_func_mask & (1 << func)))
+	if (!(lps0_dsm_func_mask & BIT(func)))
 		return;
 
 	out_obj = acpi_evaluate_dsm(lps0_device_handle, &lps0_dsm_guid, 1, func, NULL);
-- 
2.25.1
