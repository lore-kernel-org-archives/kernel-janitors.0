From: YueHaibing <yuehaibing@huawei.com>
Date: Sat, 27 Oct 2018 02:39:37 +0000
Subject: [PATCH -next] sgi-xp: drop pointless static qualifier in xpc_setup_msg_structures_uv
Message-Id: <1540607977-166833-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Cliff Whickman <cpw@sgi.com>, Robin Holt <robinmholt@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

There is no need to have the 'enum xp_retval ret' variable static since
new value always be assigned before use it.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/misc/sgi-xp/xpc_uv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/sgi-xp/xpc_uv.c b/drivers/misc/sgi-xp/xpc_uv.c
index 0441abe..0323bfe 100644
--- a/drivers/misc/sgi-xp/xpc_uv.c
+++ b/drivers/misc/sgi-xp/xpc_uv.c
@@ -1151,7 +1151,7 @@ struct uv_IO_APIC_route_entry {
 static enum xp_retval
 xpc_setup_msg_structures_uv(struct xpc_channel *ch)
 {
-	static enum xp_retval ret;
+	enum xp_retval ret;
 	struct xpc_channel_uv *ch_uv = &ch->sn.uv;
 
 	DBUG_ON(ch->flags & XPC_C_SETUP);
