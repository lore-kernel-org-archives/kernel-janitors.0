From: Julia Lawall <julia@diku.dk>
Date: Mon, 16 Aug 2010 16:28:34 +0000
Subject: [PATCH 14/16] drivers/w1/masters: Use available error codes
Message-Id: <Pine.LNX.4.64.1008161828190.19313@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Evgeniy Polyakov <johnpol@2ka.mipt.ru>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Error codes are stored in ret, but the return value is always 0.  Return
ret instead.

The semantic match that finds this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@r@
local idexpression x;
constant C;
@@

if (...) { ...
  x = -C
  ... when != x
(
  return <+...x...+>;
|
  return NULL;
|
  return;
|
* return ...;
)
}
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
This changes the semantics of the function and has not been tested.

 drivers/w1/masters/omap_hdq.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/w1/masters/omap_hdq.c b/drivers/w1/masters/omap_hdq.c
index 3a7e9ff..2a71e62 100644
--- a/drivers/w1/masters/omap_hdq.c
+++ b/drivers/w1/masters/omap_hdq.c
@@ -396,7 +396,7 @@ static int hdq_read_byte(struct hdq_data *hdq_data, u8 *val)
 out:
 	mutex_unlock(&hdq_data->hdq_mutex);
 rtn:
-	return 0;
+	return ret;
 
 }
 
