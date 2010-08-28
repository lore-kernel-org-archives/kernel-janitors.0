From: Julia Lawall <julia@diku.dk>
Date: Sat, 28 Aug 2010 15:41:04 +0000
Subject: [PATCH 5/7] drivers/regulator: Remove double test
Message-Id: <1283010066-20935-6-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1283010066-20935-1-git-send-email-julia@diku.dk>
In-Reply-To: <1283010066-20935-1-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lrg@slimlogic.co.uk>
Cc: kernel-janitors@vger.kernel.org, Mark Brown <broonie@opensource.wolfsonmicro.com>, linux-kernel@vger.kernel.org

The current code tests the gpio_vid0 field twice.  Test the gpio_vid1
fields in place of the second gpio_vid0 test.

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
This is a guess as to what the code should be.

 drivers/regulator/max8952.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/max8952.c b/drivers/regulator/max8952.c
index f2af0b1..7bf63f4 100644
--- a/drivers/regulator/max8952.c
+++ b/drivers/regulator/max8952.c
@@ -139,7 +139,7 @@ static int max8952_set_voltage(struct regulator_dev *rdev,
 	u8 vid = -1, i;
 
 	if (!gpio_is_valid(max8952->pdata->gpio_vid0) ||
-			!gpio_is_valid(max8952->pdata->gpio_vid0)) {
+			!gpio_is_valid(max8952->pdata->gpio_vid1)) {
 		/* DVS not supported */
 		return -EPERM;
 	}

