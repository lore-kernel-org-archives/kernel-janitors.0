From: Lionel Debroux <lionel_debroux@yahoo.fr>
Date: Mon, 08 Nov 2010 06:29:55 +0000
Subject: [PATCH] scripts/checkpatch.pl: add ata_port_operations to the list of ops that ought to be const.
Message-Id: <684104.78681.qm@smtp127.mail.ukl.yahoo.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Patch against mainline.

---

Subject: [PATCH] scripts/checkpatch.pl: add ata_port_operations to the list of ops that ought to be const.

I noticed that many ata_port_operations instances are constified
by the grsecurity patch, so it may be desirable to reduce the
introduction of non-const instances through checkpatch.pl.

Signed-off-by: Lionel Debroux <lionel_debroux@yahoo.fr>
---
 scripts/checkpatch.pl |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index e3c7fc0..33fab2e 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2810,6 +2810,7 @@ sub process {
 # check for various ops structs, ensure they are const.
 		my $struct_ops = qr{acpi_dock_ops|
 				address_space_operations|
+				ata_port_operations|
 				backlight_ops|
 				block_device_operations|
 				dentry_operations|
-- 
1.7.3.2.161.g3089c
