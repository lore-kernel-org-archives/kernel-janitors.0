From: Vasiliy Kulikov <segooon@gmail.com>
Date: Sun, 10 Oct 2010 17:28:47 +0000
Subject: [PATCH] staging: intel_sst: fix signess error
Message-Id: <1286731728-18039-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Harsha Priya <priya.harsha@intel.com>, Vinod Koul <vinod.koul@intel.com>, Alan Cox <alan@linux.intel.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

str_id was unsigned, so check for (str_id <= 0) made no sense.
Made it signed.

Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
---
 Compile tested.

 drivers/staging/intel_sst/intel_sst_stream.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/drivers/staging/intel_sst/intel_sst_stream.c b/drivers/staging/intel_sst/intel_sst_stream.c
index ff46d5c..1ce3a9c 100644
--- a/drivers/staging/intel_sst/intel_sst_stream.c
+++ b/drivers/staging/intel_sst/intel_sst_stream.c
@@ -117,7 +117,8 @@ int sst_alloc_stream(char *params, unsigned int stream_ops,
 {
 	struct ipc_post *msg = NULL;
 	struct snd_sst_alloc_params alloc_param;
-	unsigned int pcm_slot = 0, num_ch, str_id;
+	unsigned int pcm_slot = 0, num_ch;
+	int str_id;
 	struct snd_sst_stream_params *sparams;
 	struct stream_info *str_info;
 
-- 
1.7.0.4

