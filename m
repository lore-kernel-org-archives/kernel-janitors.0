From: Hannes Eder <hannes@hanneseder.net>
Date: Sun, 22 Feb 2009 00:05:55 +0000
Subject: [PATCH 16/16] ALSA: msnd: fix sparse warning: Using plain integer as
Message-Id: <20090222000552.17557.21537.stgit@vmbox.hanneseder.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090221235706.17557.97714.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090221235706.17557.97714.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: trivial@kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Fix this sparse warning:
  sound/isa/msnd/msnd_pinnacle.c:808:1: warning: Using plain integer as NULL pointer

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
 sound/isa/msnd/msnd_pinnacle.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/sound/isa/msnd/msnd_pinnacle.c b/sound/isa/msnd/msnd_pinnacle.c
index 60b6abd..add6c0a 100644
--- a/sound/isa/msnd/msnd_pinnacle.c
+++ b/sound/isa/msnd/msnd_pinnacle.c
@@ -805,7 +805,7 @@ module_param(calibrate_signal, int, S_IRUGO);
 #ifndef MSND_CLASSIC
 module_param_array(digital, int, NULL, S_IRUGO);
 module_param_array(cfg, long, NULL, S_IRUGO);
-module_param_array(reset, int, 0, S_IRUGO);
+module_param_array(reset, int, NULL, S_IRUGO);
 module_param_array(mpu_io, long, NULL, S_IRUGO);
 module_param_array(mpu_irq, int, NULL, S_IRUGO);
 module_param_array(ide_io0, long, NULL, S_IRUGO);

