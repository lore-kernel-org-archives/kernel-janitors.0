From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 10 Jan 2018 15:34:34 +0000
Subject: [PATCH 3/3] misc/ti-st: Delete an unnecessary return statement in two functions
Message-Id: <4b83dec4-c493-eb70-f60e-6bc490821d4a@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <b038e780-8cd2-a550-108c-2f8a35f3571e@users.sourceforge.net>
In-Reply-To: <b038e780-8cd2-a550-108c-2f8a35f3571e@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Arvind Yadav <arvind.yadav.cs@gmail.com>, "David S. Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Johannes Berg <johannes.berg@intel.com>, Stephen Hemminger <stephen@networkplumber.org>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 10 Jan 2018 16:16:55 +0100

The script "checkpatch.pl" pointed information out like the following.

WARNING: void function return statements are not generally useful

Thus remove such a statement in the affected functions.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/misc/ti-st/st_kim.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/misc/ti-st/st_kim.c b/drivers/misc/ti-st/st_kim.c
index 948e3461d02e..e33eb4bcb608 100644
--- a/drivers/misc/ti-st/st_kim.c
+++ b/drivers/misc/ti-st/st_kim.c
@@ -206,7 +206,6 @@ static void kim_int_recv(struct kim_data_s *kim_gdata,
 		kim_gdata->rx_skb->cb[1] = 0;
 
 	}
-	return;
 }
 
 static long read_local_version(struct kim_data_s *kim_gdata, char *bts_scr_name)
@@ -436,7 +435,6 @@ void st_kim_recv(void *disc_data, const unsigned char *data, long count)
 	 * from other fw responses when data gathering is complete
 	 */
 	kim_int_recv(kim_gdata, data, count);
-	return;
 }
 
 /* to signal completion of line discipline installation
-- 
2.15.1

