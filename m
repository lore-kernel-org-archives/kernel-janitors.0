From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 21 Jan 2020 13:06:42 +0000
Subject: [PATCH] ide: make drive->dn read only
Message-Id: <20200121125942.hkr3zg77i5gtgc7v@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <89d856ef-7c00-a2b7-bfcc-483c78092d20@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S. Miller" <davem@davemloft.net>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: linux-ide@vger.kernel.org, kernel-janitors@vger.kernel.org

The IDE core always sets ->dn correctly so changing it is never
required.

Setting it to a different value than assigned by IDE core is very likely
to result in data corruption (due to wrong transfer timings being set on
the controller etc.)

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---

 include/linux/ide.h    | 4 ++++
 drivers/ide/ide-proc.c | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/linux/ide.h b/include/linux/ide.h
index 06dae6438557..a254841bd315 100644
--- a/include/linux/ide.h
+++ b/include/linux/ide.h
@@ -945,6 +945,10 @@ ide_devset_get(_name, _field); \
 ide_devset_set(_name, _field); \
 IDE_DEVSET(_name, DS_SYNC, get_##_name, set_##_name)
 
+#define ide_devset_ro_field(_name, _field) \
+ide_devset_get(_name, _field); \
+IDE_DEVSET(_name, 0, get_##_name, NULL)
+
 #define ide_devset_rw_flag(_name, _field) \
 ide_devset_get_flag(_name, _field); \
 ide_devset_set_flag(_name, _field); \
diff --git a/drivers/ide/ide-proc.c b/drivers/ide/ide-proc.c
index 11a801aa92d8..15c17f3781ee 100644
--- a/drivers/ide/ide-proc.c
+++ b/drivers/ide/ide-proc.c
@@ -206,7 +206,7 @@ static int set_xfer_rate (ide_drive_t *drive, int arg)
 ide_devset_rw(current_speed, xfer_rate);
 ide_devset_rw_field(init_speed, init_speed);
 ide_devset_rw_flag(nice1, IDE_DFLAG_NICE1);
-ide_devset_rw_field(number, dn);
+ide_devset_ro_field(number, dn);
 
 static const struct ide_proc_devset ide_generic_settings[] = {
 	IDE_PROC_DEVSET(current_speed, 0, 70),
-- 
2.11.0
