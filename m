Received: from smtp.smtpout.orange.fr (smtp-81.smtpout.orange.fr [80.12.242.81])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8308372B51;
	Thu, 26 Feb 2026 20:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772139169; cv=none; b=LBAqrmWLMZYv42/dyZqjKh8BjF2OSjzVhVbQn0LSCo4G1+ttQkho4QTGtdaU9WZCJwhYfETDdTnhegbfK5bzV9vpFdB2FKkGyUTBaUVZRf0/UstwO9uG+BBNgkatH/KlHzpDxB3YlDG8YAxBiIdx4g0cDIN5sKMDsUJieaPOySE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772139169; c=relaxed/simple;
	bh=RpZviqvGWVJR1tcATAIWAtKC+QlaZLR+DGJO/TZlyz0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z4prY5Db0z/Kt/qPjLRGd3IEV5bnkh5ZTb/SIKWbpAGt3sefuy3nFfhuJCa0v3ESk0h/SVB2cQVc3u6P3CLHmCNNuieSliiz+daWuAHFfpSHT5Fa0HvMSCaFbajrNFDKX/bYyp14zxaFUfEPGPLfQnq2oTziwGM7LOOGyfkC+Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=eZ7aCq2w; arc=none smtp.client-ip=80.12.242.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="eZ7aCq2w"
Received: from fedora.home ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPSA
	id viCtvYCtLgy1AviCtvArnH; Thu, 26 Feb 2026 21:43:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1772138617;
	bh=DacmWtirnDJ8c5FfO60izxCVDBNId/jIFsPzSSFKxMk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=eZ7aCq2wjCWG0RHDmt9Ufs1JdOdT5ftNgWwm0PPOJoL7DTWeMBn3lMbrT1t7W/6lj
	 bxCX7MR8Pk/ndt49pSC2ygnwqvXIpgPzGYnLBzYKLfCp9LclYz79GoDkmjxAGNlg7/
	 aOES8EGeUgiHO2/zhaziIJeq57x8DGH6vhJ1PxMQxVwS7r9tdM18t7ujjWbCis3UCb
	 G/qapnySNgtbFuc0LUNMtYzS7y/P8WLAw7y4gxibVtjsvmOQrIAfcquZKn0fn5RX5W
	 mCV9RyyYHrbOxCUfqZx75dusobe6CBCPn1SETv9QhqQbF9E2OCe2Z/mrtlabg9XXHJ
	 wiODN5Imqnalw==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Thu, 26 Feb 2026 21:43:37 +0100
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Johannes Berg <johannes@sipsolutions.net>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org
Subject: [PATCH v1] ALSA: aoa: Constify struct configfs_item_operations and configfs_group_operations
Date: Thu, 26 Feb 2026 21:43:27 +0100
Message-ID: <803ed3c1a19faab6481f3b3b4bf1eb86739061bd.1772138561.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'struct codec_connection' are not modified in this driver.

Constifying these structures moves some data to a read-only section, so
increases overall security.

On a x86_64, with allmodconfig:
Before:
======
   text	   data	    bss	    dec	    hex	filename
  10034	   3392	     12	  13438	   347e	sound/aoa/fabrics/layout.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
  10370	   3040	     12	  13422	   346e	sound/aoa/fabrics/layout.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only.

The fabric_data field in struct aoa_codecis is only used in
sound/aoa/fabrics/layout.c, so there should be no side effect for other
files that include sound/aoa/aoa.h
---
 sound/aoa/aoa.h            |  2 +-
 sound/aoa/fabrics/layout.c | 28 ++++++++++++++--------------
 2 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/sound/aoa/aoa.h b/sound/aoa/aoa.h
index badff9f7cd54..b92593f170ca 100644
--- a/sound/aoa/aoa.h
+++ b/sound/aoa/aoa.h
@@ -48,7 +48,7 @@ struct aoa_codec {
 	u32 connected;
 
 	/* data the fabric can associate with this structure */
-	void *fabric_data;
+	const void *fabric_data;
 
 	/* private! */
 	struct list_head list;
diff --git a/sound/aoa/fabrics/layout.c b/sound/aoa/fabrics/layout.c
index c18b55305294..c3ebb6de4789 100644
--- a/sound/aoa/fabrics/layout.c
+++ b/sound/aoa/fabrics/layout.c
@@ -55,7 +55,7 @@ struct codec_connection {
 
 struct codec_connect_info {
 	char *name;
-	struct codec_connection *connections;
+	const struct codec_connection *connections;
 };
 
 #define LAYOUT_FLAG_COMBO_LINEOUT_SPDIF	(1<<0)
@@ -116,7 +116,7 @@ MODULE_ALIAS("aoa-device-id-35");
 MODULE_ALIAS("aoa-device-id-44");
 
 /* onyx with all but microphone connected */
-static struct codec_connection onyx_connections_nomic[] = {
+static const struct codec_connection onyx_connections_nomic[] = {
 	{
 		.connected = CC_SPEAKERS | CC_HEADPHONE | CC_LINEOUT,
 		.codec_bit = 0,
@@ -133,7 +133,7 @@ static struct codec_connection onyx_connections_nomic[] = {
 };
 
 /* onyx on machines without headphone */
-static struct codec_connection onyx_connections_noheadphones[] = {
+static const struct codec_connection onyx_connections_noheadphones[] = {
 	{
 		.connected = CC_SPEAKERS | CC_LINEOUT |
 			     CC_LINEOUT_LABELLED_HEADPHONE,
@@ -157,7 +157,7 @@ static struct codec_connection onyx_connections_noheadphones[] = {
 };
 
 /* onyx on machines with real line-out */
-static struct codec_connection onyx_connections_reallineout[] = {
+static const struct codec_connection onyx_connections_reallineout[] = {
 	{
 		.connected = CC_SPEAKERS | CC_LINEOUT | CC_HEADPHONE,
 		.codec_bit = 0,
@@ -174,7 +174,7 @@ static struct codec_connection onyx_connections_reallineout[] = {
 };
 
 /* tas on machines without line out */
-static struct codec_connection tas_connections_nolineout[] = {
+static const struct codec_connection tas_connections_nolineout[] = {
 	{
 		.connected = CC_SPEAKERS | CC_HEADPHONE,
 		.codec_bit = 0,
@@ -191,7 +191,7 @@ static struct codec_connection tas_connections_nolineout[] = {
 };
 
 /* tas on machines with neither line out nor line in */
-static struct codec_connection tas_connections_noline[] = {
+static const struct codec_connection tas_connections_noline[] = {
 	{
 		.connected = CC_SPEAKERS | CC_HEADPHONE,
 		.codec_bit = 0,
@@ -204,7 +204,7 @@ static struct codec_connection tas_connections_noline[] = {
 };
 
 /* tas on machines without microphone */
-static struct codec_connection tas_connections_nomic[] = {
+static const struct codec_connection tas_connections_nomic[] = {
 	{
 		.connected = CC_SPEAKERS | CC_HEADPHONE | CC_LINEOUT,
 		.codec_bit = 0,
@@ -217,7 +217,7 @@ static struct codec_connection tas_connections_nomic[] = {
 };
 
 /* tas on machines with everything connected */
-static struct codec_connection tas_connections_all[] = {
+static const struct codec_connection tas_connections_all[] = {
 	{
 		.connected = CC_SPEAKERS | CC_HEADPHONE | CC_LINEOUT,
 		.codec_bit = 0,
@@ -233,7 +233,7 @@ static struct codec_connection tas_connections_all[] = {
 	{} /* terminate array by .connected == 0 */
 };
 
-static struct codec_connection toonie_connections[] = {
+static const struct codec_connection toonie_connections[] = {
 	{
 		.connected = CC_SPEAKERS | CC_HEADPHONE,
 		.codec_bit = 0,
@@ -241,7 +241,7 @@ static struct codec_connection toonie_connections[] = {
 	{} /* terminate array by .connected == 0 */
 };
 
-static struct codec_connection topaz_input[] = {
+static const struct codec_connection topaz_input[] = {
 	{
 		.connected = CC_DIGITALIN,
 		.codec_bit = 0,
@@ -249,7 +249,7 @@ static struct codec_connection topaz_input[] = {
 	{} /* terminate array by .connected == 0 */
 };
 
-static struct codec_connection topaz_output[] = {
+static const struct codec_connection topaz_output[] = {
 	{
 		.connected = CC_DIGITALOUT,
 		.codec_bit = 1,
@@ -257,7 +257,7 @@ static struct codec_connection topaz_output[] = {
 	{} /* terminate array by .connected == 0 */
 };
 
-static struct codec_connection topaz_inout[] = {
+static const struct codec_connection topaz_inout[] = {
 	{
 		.connected = CC_DIGITALIN,
 		.codec_bit = 0,
@@ -772,7 +772,7 @@ static int check_codec(struct aoa_codec *codec,
 {
 	const u32 *ref;
 	char propname[32];
-	struct codec_connection *cc;
+	const struct codec_connection *cc;
 
 	/* if the codec has a 'codec' node, we require a reference */
 	if (of_node_name_eq(codec->node, "codec")) {
@@ -895,7 +895,7 @@ static void layout_notify(void *data)
 
 static void layout_attached_codec(struct aoa_codec *codec)
 {
-	struct codec_connection *cc;
+	const struct codec_connection *cc;
 	struct snd_kcontrol *ctl;
 	int headphones, lineout;
 	struct layout_dev *ldev = layout_device;
-- 
2.53.0

