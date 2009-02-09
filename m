From: Tobias Klauser <tklauser@distanz.ch>
Date: Mon, 09 Feb 2009 21:05:06 +0000
Subject: [PATCH] ieee1394: Storage class should be before const qualifier
Message-Id: <20090209210506.GA7248@xenon.distanz.ch>
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
 drivers/ieee1394/csr.c       |    8 ++++----
 drivers/ieee1394/eth1394.c   |    2 +-
 drivers/ieee1394/highlevel.c |    2 +-
 drivers/ieee1394/raw1394.c   |    2 +-
 drivers/ieee1394/sbp2.c      |    4 ++--
 5 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/ieee1394/csr.c b/drivers/ieee1394/csr.c
index 31400c8..d696f69 100644
--- a/drivers/ieee1394/csr.c
+++ b/drivers/ieee1394/csr.c
@@ -68,22 +68,22 @@ static struct hpsb_highlevel csr_highlevel = {
 	.host_reset =	host_reset,
 };
 
-const static struct hpsb_address_ops map_ops = {
+static const struct hpsb_address_ops map_ops = {
 	.read = read_maps,
 };
 
-const static struct hpsb_address_ops fcp_ops = {
+static const struct hpsb_address_ops fcp_ops = {
 	.write = write_fcp,
 };
 
-const static struct hpsb_address_ops reg_ops = {
+static const struct hpsb_address_ops reg_ops = {
 	.read = read_regs,
 	.write = write_regs,
 	.lock = lock_regs,
 	.lock64 = lock64_regs,
 };
 
-const static struct hpsb_address_ops config_rom_ops = {
+static const struct hpsb_address_ops config_rom_ops = {
 	.read = read_config_rom,
 };
 
diff --git a/drivers/ieee1394/eth1394.c b/drivers/ieee1394/eth1394.c
index 1a919df..0ed0f80 100644
--- a/drivers/ieee1394/eth1394.c
+++ b/drivers/ieee1394/eth1394.c
@@ -181,7 +181,7 @@ static void ether1394_remove_host(struct hpsb_host *host);
 static void ether1394_host_reset(struct hpsb_host *host);
 
 /* Function for incoming 1394 packets */
-const static struct hpsb_address_ops addr_ops = {
+static const struct hpsb_address_ops addr_ops = {
 	.write =	ether1394_write,
 };
 
diff --git a/drivers/ieee1394/highlevel.c b/drivers/ieee1394/highlevel.c
index 600e391..4bc4435 100644
--- a/drivers/ieee1394/highlevel.c
+++ b/drivers/ieee1394/highlevel.c
@@ -478,7 +478,7 @@ int hpsb_unregister_addrspace(struct hpsb_highlevel *hl, struct hpsb_host *host,
 	return retval;
 }
 
-const static struct hpsb_address_ops dummy_ops;
+static const struct hpsb_address_ops dummy_ops;
 
 /* dummy address spaces as lower and upper bounds of the host's a.s. list */
 static void init_hpsb_highlevel(struct hpsb_host *host)
diff --git a/drivers/ieee1394/raw1394.c b/drivers/ieee1394/raw1394.c
index bad66c6..281229b 100644
--- a/drivers/ieee1394/raw1394.c
+++ b/drivers/ieee1394/raw1394.c
@@ -90,7 +90,7 @@ static int arm_lock(struct hpsb_host *host, int nodeid, quadlet_t * store,
 static int arm_lock64(struct hpsb_host *host, int nodeid, octlet_t * store,
 		      u64 addr, octlet_t data, octlet_t arg, int ext_tcode,
 		      u16 flags);
-const static struct hpsb_address_ops arm_ops = {
+static const struct hpsb_address_ops arm_ops = {
 	.read = arm_read,
 	.write = arm_write,
 	.lock = arm_lock,
diff --git a/drivers/ieee1394/sbp2.c b/drivers/ieee1394/sbp2.c
index f3fd865..ccf2bd7 100644
--- a/drivers/ieee1394/sbp2.c
+++ b/drivers/ieee1394/sbp2.c
@@ -265,7 +265,7 @@ static struct hpsb_highlevel sbp2_highlevel = {
 	.host_reset	= sbp2_host_reset,
 };
 
-const static struct hpsb_address_ops sbp2_ops = {
+static const struct hpsb_address_ops sbp2_ops = {
 	.write		= sbp2_handle_status_write
 };
 
@@ -275,7 +275,7 @@ static int sbp2_handle_physdma_write(struct hpsb_host *, int, int, quadlet_t *,
 static int sbp2_handle_physdma_read(struct hpsb_host *, int, quadlet_t *, u64,
 				    size_t, u16);
 
-const static struct hpsb_address_ops sbp2_physdma_ops = {
+static const struct hpsb_address_ops sbp2_physdma_ops = {
 	.read		= sbp2_handle_physdma_read,
 	.write		= sbp2_handle_physdma_write,
 };
-- 
1.5.6.5

