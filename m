From: Tobias Klauser <tklauser@distanz.ch>
Date: Mon, 09 Feb 2009 21:02:42 +0000
Subject: [PATCH] drm/i915: Storage class should be before const qualifier
Message-Id: <20090209210242.GA7163@xenon.distanz.ch>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The C99 specification states in section 6.11.5:

The placement of a storage-class specifier other than at the beginning
of the declaration specifiers in a declaration is an obsolescent
feature.

Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
---
 drivers/gpu/drm/i915/intel_sdvo.c |    2 +-
 drivers/gpu/drm/i915/intel_tv.c   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/intel_sdvo.c b/drivers/gpu/drm/i915/intel_sdvo.c
index 4072154..249e0a3 100644
--- a/drivers/gpu/drm/i915/intel_sdvo.c
+++ b/drivers/gpu/drm/i915/intel_sdvo.c
@@ -147,7 +147,7 @@ static bool intel_sdvo_write_byte(struct intel_output *intel_output, int addr,
 
 #define SDVO_CMD_NAME_ENTRY(cmd) {cmd, #cmd}
 /** Mapping of command numbers to names, for debug output */
-const static struct _sdvo_cmd_name {
+static const struct _sdvo_cmd_name {
     u8 cmd;
     char *name;
 } sdvo_cmd_names[] = {
diff --git a/drivers/gpu/drm/i915/intel_tv.c b/drivers/gpu/drm/i915/intel_tv.c
index fbb35dc..56485d6 100644
--- a/drivers/gpu/drm/i915/intel_tv.c
+++ b/drivers/gpu/drm/i915/intel_tv.c
@@ -411,7 +411,7 @@ struct tv_mode {
  * These values account for -1s required.
  */
 
-const static struct tv_mode tv_modes[] = {
+static const struct tv_mode tv_modes[] = {
 	{
 		.name		= "NTSC-M",
 		.clock		= 107520,
-- 
1.5.6.5

