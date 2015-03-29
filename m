From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 29 Mar 2015 12:54:14 +0000
Subject: [PATCH 3/4] staging: ft1000: Drop unneeded cast on netdev_priv
Message-Id: <1427633655-32103-3-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marek Belisko <marek.belisko@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

The result of netdev_priv is already implicitly cast to the type of the
left side of the assignment.

The semantic patch that fixes this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
type T;
T *x;
@@

x = 
- (T *)
  netdev_priv(...)
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/staging/ft1000/ft1000-pcmcia/ft1000_dnld.c |   14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff -u -p a/drivers/staging/ft1000/ft1000-pcmcia/ft1000_dnld.c b/drivers/staging/ft1000/ft1000-pcmcia/ft1000_dnld.c
--- a/drivers/staging/ft1000/ft1000-pcmcia/ft1000_dnld.c
+++ b/drivers/staging/ft1000/ft1000-pcmcia/ft1000_dnld.c
@@ -116,7 +116,7 @@ struct dsp_image_info {
 
 void card_bootload(struct net_device *dev)
 {
-	struct ft1000_info *info = (struct ft1000_info *)netdev_priv(dev);
+	struct ft1000_info *info = netdev_priv(dev);
 	unsigned long flags;
 	u32 *pdata;
 	u32 size;
@@ -148,7 +148,7 @@ void card_bootload(struct net_device *de
 
 u16 get_handshake(struct net_device *dev, u16 expected_value)
 {
-	struct ft1000_info *info = (struct ft1000_info *)netdev_priv(dev);
+	struct ft1000_info *info = netdev_priv(dev);
 	u16 handshake;
 	u32 tempx;
 	int loopcnt;
@@ -182,7 +182,7 @@ u16 get_handshake(struct net_device *dev
 
 void put_handshake(struct net_device *dev, u16 handshake_value)
 {
-	struct ft1000_info *info = (struct ft1000_info *)netdev_priv(dev);
+	struct ft1000_info *info = netdev_priv(dev);
 	u32 tempx;
 
 	if (info->AsicID = ELECTRABUZZ_ID) {
@@ -198,7 +198,7 @@ void put_handshake(struct net_device *de
 
 u16 get_request_type(struct net_device *dev)
 {
-	struct ft1000_info *info = (struct ft1000_info *)netdev_priv(dev);
+	struct ft1000_info *info = netdev_priv(dev);
 	u16 request_type;
 	u32 tempx;
 
@@ -217,7 +217,7 @@ u16 get_request_type(struct net_device *
 
 long get_request_value(struct net_device *dev)
 {
-	struct ft1000_info *info = (struct ft1000_info *)netdev_priv(dev);
+	struct ft1000_info *info = netdev_priv(dev);
 	long value;
 	u16 w_val;
 
@@ -246,7 +246,7 @@ long get_request_value(struct net_device
 
 void put_request_value(struct net_device *dev, long lvalue)
 {
-	struct ft1000_info *info = (struct ft1000_info *)netdev_priv(dev);
+	struct ft1000_info *info = netdev_priv(dev);
 	u16 size;
 	u32 tempx;
 
@@ -285,7 +285,7 @@ u16 hdr_checksum(struct pseudo_hdr *pHdr
 int card_download(struct net_device *dev, const u8 *pFileStart,
 		  size_t FileLength)
 {
-	struct ft1000_info *info = (struct ft1000_info *)netdev_priv(dev);
+	struct ft1000_info *info = netdev_priv(dev);
 	int Status = SUCCESS;
 	u32 uiState;
 	u16 handshake;

