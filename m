From: Colin King <colin.king@canonical.com>
Date: Mon, 09 Jul 2018 12:23:13 +0000
Subject: [PATCH] wimax/i2400m: remove redundant variables ack_status, bcf and protocol
Message-Id: <20180709122313.14483-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Inaky Perez-Gonzalez <inaky.perez-gonzalez@intel.com>, linux-wimax@intel.com, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variables ack_status, bcf and protocol are being assigned but are
never used hence they are redundant and can be removed.

Also declare ack_type as unsigned int rather than unsigned to clean
up a checkpatch warning.

Cleans up clang warnings:
warning: variable 'ack_status' set but not used [-Wunused-but-set-variable]
warning: variable 'bcf' set but not used [-Wunused-but-set-variable]
warning: variable 'protocol' set but not used [-Wunused-but-set-variable]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wimax/i2400m/control.c | 3 +--
 drivers/net/wimax/i2400m/fw.c      | 3 +--
 drivers/net/wimax/i2400m/netdev.c  | 2 --
 3 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wimax/i2400m/control.c b/drivers/net/wimax/i2400m/control.c
index 4c417903e9be..cfb0bf3b4426 100644
--- a/drivers/net/wimax/i2400m/control.c
+++ b/drivers/net/wimax/i2400m/control.c
@@ -566,13 +566,12 @@ static void i2400m_msg_ack_hook(struct i2400m *i2400m,
 {
 	int result;
 	struct device *dev = i2400m_dev(i2400m);
-	unsigned ack_type, ack_status;
+	unsigned int ack_type;
 	char strerr[32];
 
 	/* Chew on the message, we might need some information from
 	 * here */
 	ack_type = le16_to_cpu(l3l4_hdr->type);
-	ack_status = le16_to_cpu(l3l4_hdr->status);
 	switch (ack_type) {
 	case I2400M_MT_CMD_ENTER_POWERSAVE:
 		/* This is just left here for the sake of example, as
diff --git a/drivers/net/wimax/i2400m/fw.c b/drivers/net/wimax/i2400m/fw.c
index a89b5685e68b..e9fc168bb734 100644
--- a/drivers/net/wimax/i2400m/fw.c
+++ b/drivers/net/wimax/i2400m/fw.c
@@ -1552,7 +1552,6 @@ int i2400m_dev_bootstrap(struct i2400m *i2400m, enum i2400m_bri flags)
 	int ret, itr;
 	struct device *dev = i2400m_dev(i2400m);
 	struct i2400m_fw *i2400m_fw;
-	const struct i2400m_bcf_hdr *bcf;	/* Firmware data */
 	const struct firmware *fw;
 	const char *fw_name;
 
@@ -1574,7 +1573,7 @@ int i2400m_dev_bootstrap(struct i2400m *i2400m, enum i2400m_bri flags)
 	}
 
 	/* Load firmware files to memory. */
-	for (itr = 0, bcf = NULL, ret = -ENOENT; ; itr++) {
+	for (itr = 0, ret = -ENOENT; ; itr++) {
 		fw_name = i2400m->bus_fw_names[itr];
 		if (fw_name = NULL) {
 			dev_err(dev, "Could not find a usable firmware image\n");
diff --git a/drivers/net/wimax/i2400m/netdev.c b/drivers/net/wimax/i2400m/netdev.c
index a654687b5fa2..9ab3f0fdfea4 100644
--- a/drivers/net/wimax/i2400m/netdev.c
+++ b/drivers/net/wimax/i2400m/netdev.c
@@ -535,14 +535,12 @@ void i2400m_net_erx(struct i2400m *i2400m, struct sk_buff *skb,
 {
 	struct net_device *net_dev = i2400m->wimax_dev.net_dev;
 	struct device *dev = i2400m_dev(i2400m);
-	int protocol;
 
 	d_fnstart(2, dev, "(i2400m %p skb %p [%u] cs %d)\n",
 		  i2400m, skb, skb->len, cs);
 	switch(cs) {
 	case I2400M_CS_IPV4_0:
 	case I2400M_CS_IPV4:
-		protocol = ETH_P_IP;
 		i2400m_rx_fake_eth_header(i2400m->wimax_dev.net_dev,
 					  skb->data - ETH_HLEN,
 					  cpu_to_be16(ETH_P_IP));
-- 
2.17.1

