From: Colin King <colin.king@canonical.com>
Date: Wed, 15 Nov 2017 15:45:09 +0000
Subject: [PATCH] drm/amd/display: remove unnecessary cast and use kcalloc instead of kzalloc
Message-Id: <20171115154509.18054-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie <airlied@linux.ie>, Harry Wentland <harry.wentland@amd.com>, Tony Cheng <tony.cheng@amd.com>, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Use kcalloc instead of kzalloc and the cast on the return from kzalloc is
unnecessary and can be removed.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/amd/display/dc/basics/logger.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/basics/logger.c b/drivers/gpu/drm/amd/display/dc/basics/logger.c
index e04e8ecd4874..2ff5b467603d 100644
--- a/drivers/gpu/drm/amd/display/dc/basics/logger.c
+++ b/drivers/gpu/drm/amd/display/dc/basics/logger.c
@@ -70,9 +70,8 @@ static bool construct(struct dc_context *ctx, struct dal_logger *logger,
 {
 	/* malloc buffer and init offsets */
 	logger->log_buffer_size = DAL_LOGGER_BUFFER_MAX_SIZE;
-	logger->log_buffer = (char *)kzalloc(logger->log_buffer_size * sizeof(char),
-					     GFP_KERNEL);
-
+	logger->log_buffer = kcalloc(logger->log_buffer_size, sizeof(char),
+				     GFP_KERNEL);
 	if (!logger->log_buffer)
 		return false;
 
-- 
2.14.1

