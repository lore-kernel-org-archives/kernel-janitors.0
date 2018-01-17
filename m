From: Colin King <colin.king@canonical.com>
Date: Wed, 17 Jan 2018 11:54:27 +0000
Subject: [PATCH] USB: serial: remove redundant initializations of 'mos_parport'
Message-Id: <20180117115427.20686-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johan Hovold <johan@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The pointer mos_parport is being initialized to pp->private_data and
then the assignment is duplicated after a spin lock.  Remove the
initialization as it occurs before the spin lock and it is a redundant
assignment.

Cleans up clang warnings:
drivers/usb/serial/mos7720.c:521:26: warning: Value stored to
'mos_parport' during its initialization is never read
drivers/usb/serial/mos7720.c:557:26: warning: Value stored to
'mos_parport' during its initialization is never read

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/serial/mos7720.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/serial/mos7720.c b/drivers/usb/serial/mos7720.c
index f4df3d5bf69c..bd57630e67e2 100644
--- a/drivers/usb/serial/mos7720.c
+++ b/drivers/usb/serial/mos7720.c
@@ -518,7 +518,7 @@ static void parport_mos7715_write_control(struct parport *pp, unsigned char d)
 
 static unsigned char parport_mos7715_read_control(struct parport *pp)
 {
-	struct mos7715_parport *mos_parport = pp->private_data;
+	struct mos7715_parport *mos_parport;
 	__u8 dcr;
 
 	spin_lock(&release_lock);
@@ -554,7 +554,7 @@ static unsigned char parport_mos7715_frob_control(struct parport *pp,
 static unsigned char parport_mos7715_read_status(struct parport *pp)
 {
 	unsigned char status;
-	struct mos7715_parport *mos_parport = pp->private_data;
+	struct mos7715_parport *mos_parport;
 
 	spin_lock(&release_lock);
 	mos_parport = pp->private_data;
-- 
2.15.1

