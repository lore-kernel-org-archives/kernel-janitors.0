Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC92B33E0
	for <kernel-janitors@vger.kernel.org>; Mon, 30 Oct 2023 14:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="Er2l+6Na"
Received: from smtp.smtpout.orange.fr (smtp-23.smtpout.orange.fr [80.12.242.23])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F66CC9
	for <kernel-janitors@vger.kernel.org>; Mon, 30 Oct 2023 07:49:33 -0700 (PDT)
Received: from pop-os.home ([86.243.2.178])
	by smtp.orange.fr with ESMTPA
	id xTa5qOlxecvbdxTa5q48rW; Mon, 30 Oct 2023 15:49:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1698677371;
	bh=cE6pCOkG8VB8NCmHUswVDdYmjB1x/ugVETT8yljrntY=;
	h=From:To:Cc:Subject:Date;
	b=Er2l+6NauL9234lJe7ylyNTS7h2FxAYZxIGdbUrnqT7VfXoom0z5tvfFX+wo/kwNT
	 XogrjtbgxYUWy1xFHaL9wpsWjPnsRHYyd171U+cbZ7NhD0Zrkmbq0fvI/Nlm3Dm2YI
	 697gvVaod9WwwGS9U5lEBC1TMbmpsMo3zofyGKqDDjjViKFNG7tiIJy0cu1vux2BOM
	 OFZykYnrx5D4/UXRyAglnMe8cJohqJRv5ZwAp2qcSLqjDTVPhDgsBCUyGK2281IPvB
	 5zntwOGXgeO3sKoRnUYOWvFQWIKzfmgpaWC8HEJbAIYnKBVOb/McdJpLFV/1i+MLWR
	 rBQD1EiMkBQKw==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 30 Oct 2023 15:49:31 +0100
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
Subject: [PATCH v2] nvme-tcp: Fix a memory leak
Date: Mon, 30 Oct 2023 15:49:28 +0100
Message-Id: <7f132cc47e627d63ddb084f3d0fcad10956d1e35.1698677322.git.christophe.jaillet@wanadoo.fr>
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
Reviewed-by: Christoph Hellwig <hch@lst.de>
---
v2: - move ret = -xx; to the main path   [Christoph Hellwig]
    - Add R-b tag

v1: https://lore.kernel.org/all/f9420cde9afdc5af40bf8a8d5aa9184a9b5da729.1698614556.git.christophe.jaillet@wanadoo.fr/

Personally I prefer v1. Pick the one you prefer :)
---
 drivers/nvme/host/tcp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
index 4714a902f4ca..f97711fc9f9f 100644
--- a/drivers/nvme/host/tcp.c
+++ b/drivers/nvme/host/tcp.c
@@ -1423,13 +1423,14 @@ static int nvme_tcp_init_connection(struct nvme_tcp_queue *queue)
 			nvme_tcp_queue_id(queue), ret);
 		goto free_icresp;
 	}
+	ret = -ENOTCONN;
 	if (queue->ctrl->ctrl.opts->tls) {
 		ctype = tls_get_record_type(queue->sock->sk,
 					    (struct cmsghdr *)cbuf);
 		if (ctype != TLS_RECORD_TYPE_DATA) {
 			pr_err("queue %d: unhandled TLS record %d\n",
 			       nvme_tcp_queue_id(queue), ctype);
-			return -ENOTCONN;
+			goto free_icresp;
 		}
 	}
 	ret = -EINVAL;
-- 
2.34.1

