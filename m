From: Quentin Lambert <lambert.quentin@gmail.com>
Date: Tue, 27 Sep 2016 09:20:28 +0000
Subject: [PATCH] greybus: manifest: style fix missing space before '('
Message-Id: <20160927092028.13119-1-lambert.quentin@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, Quentin Lambert <lambert.quentin@gmail.com>

Checkpatch printed a style ERROR concerning a missing space befire '('.
This patch fix this issue.

Signed-off-by: Quentin Lambert <lambert.quentin@gmail.com>
---
 drivers/staging/greybus/manifest.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/drivers/staging/greybus/manifest.c
+++ b/drivers/staging/greybus/manifest.c
@@ -11,7 +11,7 @@
 
 static const char *get_descriptor_type_string(u8 type)
 {
-	switch(type) {
+	switch (type) {
 	case GREYBUS_TYPE_INVALID:
 		return "invalid";
 	case GREYBUS_TYPE_STRING:
