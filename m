From: Julia Lawall <julia@diku.dk>
Date: Sat, 28 Aug 2010 15:41:05 +0000
Subject: [PATCH 6/7] drivers/media/dvb/siano: Remove double test
Message-Id: <1283010066-20935-7-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1283010066-20935-1-git-send-email-julia@diku.dk>
In-Reply-To: <1283010066-20935-1-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: kernel-janitors@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

The same expression is tested twice and the result is the same each time.

The sematic match that finds this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@expression@
expression E;
@@

(
* E
  || ... || E
|
* E
  && ... && E
)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/media/dvb/siano/smscoreapi.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/dvb/siano/smscoreapi.c b/drivers/media/dvb/siano/smscoreapi.c
index d93468c..70e3e0c 100644
--- a/drivers/media/dvb/siano/smscoreapi.c
+++ b/drivers/media/dvb/siano/smscoreapi.c
@@ -1511,8 +1511,7 @@ int smscore_gpio_set_level(struct smscore_device_t *coredev, u8 PinNum,
 		u32 msgData[3]; /* keep it 3 ! */
 	} *pMsg;
 
-	if ((NewLevel > 1) || (PinNum > MAX_GPIO_PIN_NUMBER) ||
-			(PinNum > MAX_GPIO_PIN_NUMBER))
+	if ((NewLevel > 1) || (PinNum > MAX_GPIO_PIN_NUMBER))
 		return -EINVAL;
 
 	totalLen = sizeof(struct SmsMsgHdr_ST) +

