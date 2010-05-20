From: Tobias Klauser <tklauser@distanz.ch>
Date: Thu, 20 May 2010 08:31:46 +0000
Subject: [PATCH 01/11] [ARM] pxa: Storage class should be before const qualifier
Message-Id: <1274344306-8735-1-git-send-email-tklauser@distanz.ch>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

The C99 specification states in section 6.11.5:

The placement of a storage-class specifier other than at the beginning
of the declaration specifiers in a declaration is an obsolescent
feature.

Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
---
 arch/arm/mach-pxa/palmtc.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-pxa/palmtc.c b/arch/arm/mach-pxa/palmtc.c
index 033b567..ce1104d 100644
--- a/arch/arm/mach-pxa/palmtc.c
+++ b/arch/arm/mach-pxa/palmtc.c
@@ -263,11 +263,11 @@ const struct matrix_keymap_data palmtc_keymap_data = {
 	.keymap_size		= ARRAY_SIZE(palmtc_matrix_keys),
 };
 
-const static unsigned int palmtc_keypad_row_gpios[] = {
+static const unsigned int palmtc_keypad_row_gpios[] = {
 	0, 9, 10, 11
 };
 
-const static unsigned int palmtc_keypad_col_gpios[] = {
+static const unsigned int palmtc_keypad_col_gpios[] = {
 	18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 79, 80
 };
 
-- 
1.6.3.3

