From: Colin King <colin.king@canonical.com>
Date: Thu, 04 Jun 2020 10:35:44 +0000
Subject: [PATCH][next] drm/amd/display: fix spelling mistake: "propogation" -> "propagation"
Message-Id: <20200604103544.14515-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191109194923.231655-1-colin.king@canonical.com>
In-Reply-To: <20191109194923.231655-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a dml_print message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
index 65da6304d6a6..2a32ed6682fc 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_mode_vba_30.c
@@ -1308,7 +1308,7 @@ static bool CalculatePrefetchSchedule(
 		dml_print("DML:  Tr0: %fus - time to fetch first row of data pagetables and first row of meta data (done in parallel)\n", TimeForFetchingRowInVBlank);
 		dml_print("DML:  Tr1: %fus - time to fetch second row of data pagetables and second row of meta data (done in parallel)\n", TimeForFetchingRowInVBlank);
 		dml_print("DML:  Tsw: %fus = time to fetch enough pixel data and cursor data to feed the scalers init position and detile\n", (double)LinesToRequestPrefetchPixelData * LineTime);
-		dml_print("DML: To: %fus - time for propogation from scaler to optc\n", (*DSTYAfterScaler + ((*DSTXAfterScaler) / (double) myPipe->HTotal)) * LineTime);
+		dml_print("DML: To: %fus - time for propagation from scaler to optc\n", (*DSTYAfterScaler + ((*DSTXAfterScaler) / (double) myPipe->HTotal)) * LineTime);
 		dml_print("DML: Tvstartup - Tsetup - Tcalc - Twait - Tpre - To > 0\n");
 		dml_print("DML: Tslack(pre): %fus - time left over in schedule\n", VStartup * LineTime - TimeForFetchingMetaPTE - 2 * TimeForFetchingRowInVBlank - (*DSTYAfterScaler + ((*DSTXAfterScaler) / (double) myPipe->HTotal)) * LineTime - TWait - TCalc - Tsetup);
 		dml_print("DML: row_bytes = dpte_row_bytes (per_pipe) = PixelPTEBytesPerRow = : %d\n", PixelPTEBytesPerRow);
-- 
2.25.1
