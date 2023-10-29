Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783F133C7
	for <kernel-janitors@vger.kernel.org>; Sun, 29 Oct 2023 21:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="i4AF/4ka"
Received: from smtp.smtpout.orange.fr (smtp-28.smtpout.orange.fr [80.12.242.28])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDA9EBC
	for <kernel-janitors@vger.kernel.org>; Sun, 29 Oct 2023 14:23:04 -0700 (PDT)
Received: from pop-os.home ([86.243.2.178])
	by smtp.orange.fr with ESMTPA
	id xDFLqNd5aaLS1xDFLqPqM9; Sun, 29 Oct 2023 22:23:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1698614581;
	bh=cYudL/+VuVwczFaR6V/ZH5x7fhb37FxDE0rQ3yQscdQ=;
	h=From:To:Cc:Subject:Date;
	b=i4AF/4kaLpgPF5GFykgjj0Fq6GL8kJ0whYcQI40Za4SZvoG8S7/LPDoVe/T1ldEFo
	 xdJ/j4JtagGl66mjtb3rsd1aN3nbGORUBHisFIFCtlfU9sVGsB/6c1peOaEqggVLZC
	 BmsQQLmLRNTmtC4POzvKQ8U0UuqDCQWJA5JBz1fdacvSUeQMeccHgGrRYa5ZuK06jm
	 bOCkbTHiBuItwotvdlRE8Adk7aPno13mRQi88rdW7QooKrDY7OTCX+zSBdMYbW76Fi
	 zGIrAT9iuCrsODqlvM938TU4e7spCdRAtGuwIlv1uqUNNpiPSPVWhc7Hor55mNe8UY
	 9DUNhvXcUmb3w==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 29 Oct 2023 22:23:01 +0100
X-ME-IP: 86.243.2.178
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	Hannes Reinecke <hare@suse.de>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-nvme@lists.infradead.org
Subject: [PATCH] nvme-tcp: Fix a memory leak
Date: Sun, 29 Oct 2023 22:22:57 +0100
Message-Id: <f9420cde9afdc5af40bf8a8d5aa9184a9b5da729.1698614556.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All error handling path end to the error handling path, except this one.
Go to the error handling branch as well here, otherwise 'icreq' and
'icresp' will leak.

Fixes: 2837966ab2a8 ("nvme-tcp: control message handling for recvmsg()")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/nvme/host/tcp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
index 4714a902f4ca..3c35c37112e6 100644
--- a/drivers/nvme/host/tcp.c
+++ b/drivers/nvme/host/tcp.c
@@ -1429,7 +1429,8 @@ static int nvme_tcp_init_connection(struct nvme_tcp_queue *queue)
 		if (ctype != TLS_RECORD_TYPE_DATA) {
 			pr_err("queue %d: unhandled TLS record %d\n",
 			       nvme_tcp_queue_id(queue), ctype);
-			return -ENOTCONN;
+			ret = -ENOTCONN;
+			goto free_icresp;
 		}
 	}
 	ret = -EINVAL;
-- 
2.34.1

