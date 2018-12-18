From: Colin King <colin.king@canonical.com>
Date: Tue, 18 Dec 2018 11:35:52 +0000
Subject: [PATCH][next] staging: most: sound: replace snprintf with strscpy
Message-Id: <20181218113552.26916-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Christian Gromm <christian.gromm@microchip.com>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Using snprintf without a format specifier is potentially risky if
the string device_name contains format specifiers. Replace this with
the safer and more efficient strscpy.

Cleans up clang warning:
drivers/staging/most/sound/sound.c:673:41: warning: format string is not
a string literal (potentially insecure) [-Wformat-security]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/most/sound/sound.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/most/sound/sound.c b/drivers/staging/most/sound/sound.c
index 29a4c72e6357..ccabf5922a73 100644
--- a/drivers/staging/most/sound/sound.c
+++ b/drivers/staging/most/sound/sound.c
@@ -670,7 +670,7 @@ static int audio_probe_channel(struct most_interface *iface, int channel_id,
 		goto err_free_adpt;
 
 	pcm->private_data = channel;
-	snprintf(pcm->name, sizeof(pcm->name), device_name);
+	strscpy(pcm->name, device_name, sizeof(pcm->name));
 	snd_pcm_set_ops(pcm, direction, &pcm_ops);
 
 	if (create) {
-- 
2.19.1
