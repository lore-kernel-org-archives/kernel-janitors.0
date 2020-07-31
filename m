From: Julia Lawall <Julia.Lawall@inria.fr>
Date: Fri, 31 Jul 2020 19:28:21 +0000
Subject: [PATCH] ALSA: doc: use correct config variable name
Message-Id: <1596223701-7558-1-git-send-email-Julia.Lawall@inria.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@perex.cz>
Cc: alsa-devel@alsa-project.org, linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>

CONFIG_PCM_XRUN_DEBUG should be CONFIG_SND_PCM_XRUN_DEBUG

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 Documentation/sound/designs/procfile.rst |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/sound/designs/procfile.rst b/Documentation/sound/designs/procfile.rst
index 29a4668..e9f7e0c 100644
--- a/Documentation/sound/designs/procfile.rst
+++ b/Documentation/sound/designs/procfile.rst
@@ -91,7 +91,7 @@ PCM Proc Files
 
 ``card*/pcm*/xrun_debug``
 	This file appears when ``CONFIG_SND_DEBUG=y`` and
-	``CONFIG_PCM_XRUN_DEBUG=y``.
+	``CONFIG_SND_PCM_XRUN_DEBUG=y``.
 	This shows the status of xrun (= buffer overrun/xrun) and
 	invalid PCM position debug/check of ALSA PCM middle layer.
 	It takes an integer value, can be changed by writing to this
