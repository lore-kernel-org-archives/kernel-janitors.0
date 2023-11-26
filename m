Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="J6KXICCr"
Received: from smtp.smtpout.orange.fr (smtp-15.smtpout.orange.fr [80.12.242.15])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF71FBC
	for <kernel-janitors@vger.kernel.org>; Sun, 26 Nov 2023 01:01:10 -0800 (PST)
Received: from pop-os.home ([92.140.202.140])
	by smtp.orange.fr with ESMTPA
	id 7B0krUMd82dY37B0kraNCf; Sun, 26 Nov 2023 10:01:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1700989269;
	bh=uLAwvAAw9PRiZuXD+6doOUly5ZTCKAXXgKs3wN26bqg=;
	h=From:To:Cc:Subject:Date;
	b=J6KXICCr6llIFdEffwtufDqPcslGoM3bGKSPDjuoU452CGKf816J8EgCR6YaRtrZs
	 lOz7lxE9OAu2ZKTBY5gBGEcRAZKDsW9yqzc3gdd4uRI8oxGLOW+cnsXpnasw0mjpzW
	 nOVNgCfyYJd3d0J84t/02TXF2WOcbS8LYE93dcckaCSszaLGjMaXxdwQuv7rHNQfg0
	 LAZYYG7gZwG5lEUliFKr/O+B6TUwuOoZ/1+86PfL4+uBK7VCnGSN75/g7WINy6M+WI
	 S3B6PufaqWQi7q64dvq4VHWmd5YlChz9E2tflLhmuWB1FhQm8FFKFaXGo920oFPnSo
	 vk/9AI9U+nN6A==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 26 Nov 2023 10:01:09 +0100
X-ME-IP: 92.140.202.140
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: peterz@infradead.org,
	mingo@redhat.com,
	will@kernel.org,
	longman@redhat.com,
	boqun.feng@gmail.com
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] MAINTAINERS: add include/linux/lockdep*.h
Date: Sun, 26 Nov 2023 10:00:59 +0100
Message-Id: <e722abd043e5de64d2acd28d581e4a952994a94e.1700989248.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Have lockdep_api.h and lockdep_types.h match as well.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index f2b2cd60eb20..2a1480051583 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12492,7 +12492,7 @@ S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git locking/core
 F:	Documentation/locking/
 F:	arch/*/include/asm/spinlock*.h
-F:	include/linux/lockdep.h
+F:	include/linux/lockdep*.h
 F:	include/linux/mutex*.h
 F:	include/linux/rwlock*.h
 F:	include/linux/rwsem*.h
-- 
2.34.1

