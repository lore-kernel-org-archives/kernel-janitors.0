Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020E4246BB0;
	Mon, 29 Sep 2025 06:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759127101; cv=none; b=Oy8X1ARzm60GQq9zNnEHzJz/nUOkobvRa/z95QgrxeOZq44RcvSl4wYfPe27xL/cDUdqH6Di57yR2OqcK2XTTmppb0FkHIryULLm4YrufTT5fYX+kVu2ZdiTRwl7z4iZHnPz34ChBUcm7Q7MQtD93uY5FKGYd/98JRwrNfAIut0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759127101; c=relaxed/simple;
	bh=4LP1zP3tFhREnlFcfSbKMkHdOYwYDaxND1PaGhW1QyU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lrv37LluqD8ZRwVQlq8KoyzoMuBigbauaZQvTv2LmzWS/amqMadz8+4opcINlzPZtAHa2Pl22x9CPTfkVRnOax6loyxCtYfnOnHnLB68rJDjbHmIKquE3OXAv6ky61bJQktZRkzLSwQZA9PiCJTtg5EofwFgKjjDdCufDnYD/Jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=LBR/heQ2; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="LBR/heQ2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=9r
	mEW4WnEuxsk91dTOPK04lhmoFmpu0P8N59LJ9RW2o=; b=LBR/heQ2QMnMYoh+jk
	GZFFSnr9AYIxnzwEg8JSYuDg6SFqlEXm5p2BSgaxMB/BIhh1eEKgwKL4gWXCWHk9
	ZTzV3tA4jOvegpvlj3/w/jBhJVn3707wjrrbvDbLaAVEmsl27Qahr9Z3xaGqH3jG
	KMW2PM7S3Or5uCuz7xc2DAp+0=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wD3P_UtJtpoQc2vAw--.11601S2;
	Mon, 29 Sep 2025 14:24:46 +0800 (CST)
From: Zhou Yuhang <zhouyuhang1010@163.com>
To: akpm@linux-foundation.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhou Yuhang <zhouyuhang@kylinos.cn>
Subject: [PATCH] samples: fix coding style issues in Kconfig
Date: Mon, 29 Sep 2025 14:24:34 +0800
Message-Id: <20250929062434.4114607-1-zhouyuhang1010@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3P_UtJtpoQc2vAw--.11601S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Kw1UCw47Kw13ZFWUGr1rJFb_yoW8KF15p3
	s3X3ZIgrs8AFnYka17X3yvgFyrC39xJrW5Jrn3J343ZFyq9rWUAF4DKrWYyay7J3s2grya
	vryrAr40k3yDZFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UKZXwUUUUU=
X-CM-SenderInfo: 52kr35xxkd0warqriqqrwthudrp/1tbiEQXXJmjaHST7fwAAsq

From: Zhou Yuhang <zhouyuhang@kylinos.cn>

Fix some coding style issues in Kconfig: use
one tab to indent lines under a config definition,
and use an additional two spaces to indent help text.

Signed-off-by: Zhou Yuhang <zhouyuhang@kylinos.cn>
---
 samples/Kconfig | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/samples/Kconfig b/samples/Kconfig
index 6e072a5f1ed8..5bc7c9e5a59e 100644
--- a/samples/Kconfig
+++ b/samples/Kconfig
@@ -23,11 +23,11 @@ config SAMPLE_TRACE_CUSTOM_EVENTS
 	  This builds the custom trace event example module.
 
 config SAMPLE_TRACE_PRINTK
-        tristate "Build trace_printk module - tests various trace_printk formats"
+	tristate "Build trace_printk module - tests various trace_printk formats"
 	depends on EVENT_TRACING && m
 	help
-	 This builds a module that calls trace_printk() and can be used to
-	 test various trace_printk() calls from a module.
+	  This builds a module that calls trace_printk() and can be used to
+	  test various trace_printk() calls from a module.
 
 config SAMPLE_FTRACE_DIRECT
 	tristate "Build register_ftrace_direct() example"
@@ -54,11 +54,11 @@ config SAMPLE_FTRACE_OPS
 	  measures the time taken to invoke one function a number of times.
 
 config SAMPLE_TRACE_ARRAY
-        tristate "Build sample module for kernel access to Ftrace instances"
+	tristate "Build sample module for kernel access to Ftrace instances"
 	depends on EVENT_TRACING && m
 	help
-	 This builds a module that demonstrates the use of various APIs to
-	 access Ftrace instances from within the kernel.
+	  This builds a module that demonstrates the use of various APIs to
+	  access Ftrace instances from within the kernel.
 
 config SAMPLE_KOBJECT
 	tristate "Build kobject examples"
@@ -290,11 +290,11 @@ config SAMPLE_CORESIGHT_SYSCFG
 	  configurations and easily load them into the system at runtime.
 
 config SAMPLE_KMEMLEAK
-        tristate "Simple test for the kernel memory leak detector"
-        depends on DEBUG_KMEMLEAK && m
-        help
-          Build a sample program which have explicitly leaks memory to test
-          kmemleak
+	tristate "Simple test for the kernel memory leak detector"
+	depends on DEBUG_KMEMLEAK && m
+	help
+	  Build a sample program which have explicitly leaks memory to test
+	  kmemleak.
 
 config SAMPLE_CGROUP
 	bool "Build cgroup sample code"
-- 
2.27.0

