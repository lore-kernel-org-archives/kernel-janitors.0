From: Ursula Braun <ubraun@linux.vnet.ibm.com>
Date: Tue, 18 Sep 2012 10:52:19 +0000
Subject: [Re: [PATCH 2/2] drivers/s390/net/ctcm_main.c: fix error return code]
Message-Id: <1347965539.29091.3.camel@br9gv9yg.de.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Senna Tschudin <peter.senna@gmail.com>
Cc: blaschka@linux.vnet.ibm.com, mschwid2@linux.vnet.ibm.com, heicars2@linux.vnet.ibm.com, linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


thanks, Peter, your patch will be added to our next patch series
submission.

Ursula Braun











________________________________________________________________________



From: Peter Senna Tschudin <peter.senna@gmail.com>

Convert a nonnegative error return code to a negative one, as returned
elsewhere in the function.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
(
if@p1 (\(ret < 0\|ret != 0\))
{ ... return ret; }
|
ret@p1 = 0
)
... when != ret = e1
   when != &ret
*if(...)
{
 ... when != ret = e2
     when forall
return ret;
}
// </smpl>

Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>
---
drivers/s390/net/ctcm_main.c | 2 +-
1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/s390/net/ctcm_main.c b/drivers/s390/net/ctcm_main.c
index 5227e57..98ea9cc 100644
--- a/drivers/s390/net/ctcm_main.c
+++ b/drivers/s390/net/ctcm_main.c
@@ -1454,7 +1454,7 @@ static int add_channel(struct ccw_device *cdev,
enum ctcm_channel_types type,

ch_fsm_len, GFP_KERNEL);
                 }
                 if (ch->fsm = NULL)
-
 goto free_return;
+
 goto nomem_return;

                 fsm_newstate(ch->fsm, CTC_STATE_IDLE);

-- 
1.7.11.4




