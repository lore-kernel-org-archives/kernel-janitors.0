Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D788A125C8
	for <kernel-janitors@vger.kernel.org>; Sat, 11 Nov 2023 17:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="Fxc8kV+G"
Received: from smtp.smtpout.orange.fr (smtp-20.smtpout.orange.fr [80.12.242.20])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DDAC3879
	for <kernel-janitors@vger.kernel.org>; Sat, 11 Nov 2023 09:37:44 -0800 (PST)
Received: from pop-os.home ([86.243.2.178])
	by smtp.orange.fr with ESMTPA
	id 1rvQrNcO1Fh5i1rvRrEGB4; Sat, 11 Nov 2023 18:37:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1699724262;
	bh=3p8y78zf3gHeF4GPQWXy2DVL3f5hRqnTpp31RIibFuo=;
	h=From:To:Cc:Subject:Date;
	b=Fxc8kV+G8Enn/8tu+igh6v6COk98EiwnJVmlpbcFYaZIrcxRrvynh6DZ/M/TkI5WN
	 3A7a+d14YAeGc7xAs2uR0D3HAM08xyed7ofWB6IIwvfauN0t2+IOUaKnT1mNwan4KN
	 HWXcmQ16uuwE3JsnQsbusDOocXQnvPED21hOTzCbu0Cm2atUzIRyM1uGjYzKUn93CS
	 9qbqJlemRNitnBTl+4CdDIRa+qP2P8XS968v7AlMsd3TwDYg867MdakUj9Gjr8TQVS
	 dih9KCXCwL4tovkOHhzUAnMQaAe5W5AEZJyiP3VXCavv7Awy7ePhx5WBiugdJE8dCG
	 HFzH7Q3UnW4Og==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 11 Nov 2023 18:37:42 +0100
X-ME-IP: 86.243.2.178
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-sound@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH] ASoC: tegra: convert not to use dma_request_slave_channel()
Date: Sat, 11 Nov 2023 18:37:39 +0100
Message-Id: <b78685e4103f12931ddb09c1654bc6b04b640868.1699724240.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dma_request_slave_channel() is deprecated. dma_request_chan() should
be used directly instead.

Switch to the preferred function and update the error handling accordingly.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 sound/soc/tegra/tegra_pcm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/tegra/tegra_pcm.c b/sound/soc/tegra/tegra_pcm.c
index 142e8d4eefd5..42acb56543db 100644
--- a/sound/soc/tegra/tegra_pcm.c
+++ b/sound/soc/tegra/tegra_pcm.c
@@ -98,8 +98,8 @@ int tegra_pcm_open(struct snd_soc_component *component,
 		return ret;
 	}
 
-	chan = dma_request_slave_channel(cpu_dai->dev, dmap->chan_name);
-	if (!chan) {
+	chan = dma_request_chan(cpu_dai->dev, dmap->chan_name);
+	if (IS_ERR(chan)) {
 		dev_err(cpu_dai->dev,
 			"dmaengine request slave channel failed! (%s)\n",
 			dmap->chan_name);
-- 
2.34.1

