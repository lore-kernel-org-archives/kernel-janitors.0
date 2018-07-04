From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 04 Jul 2018 09:34:49 +0000
Subject: [PATCH] mei: bus: type promotion bug in mei_nfc_if_version()
Message-Id: <20180704093449.vryluk7khaudstgp@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tomas Winkler <tomas.winkler@intel.com>, Alexander Usyskin <alexander.usyskin@intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We accidentally removed the check for negative returns without
considering the issue of type promotion.  The "if_version_length"
variable is type size_t so if __mei_cl_recv() returns a negative then
"bytes_recv" is type promoted to a high positive value and treated as
success.

Fixes: 582ab27a063a ("mei: bus: fix received data size check in NFC fixup")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/misc/mei/bus-fixup.c b/drivers/misc/mei/bus-fixup.c
index 0208c4b027c5..fa0236a5e59a 100644
--- a/drivers/misc/mei/bus-fixup.c
+++ b/drivers/misc/mei/bus-fixup.c
@@ -267,7 +267,7 @@ static int mei_nfc_if_version(struct mei_cl *cl,
 
 	ret = 0;
 	bytes_recv = __mei_cl_recv(cl, (u8 *)reply, if_version_length, 0);
-	if (bytes_recv < if_version_length) {
+	if (bytes_recv < 0 || bytes_recv < if_version_length) {
 		dev_err(bus->dev, "Could not read IF version\n");
 		ret = -EIO;
 		goto err;
