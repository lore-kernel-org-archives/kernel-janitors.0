From: Hannes Eder <hannes@hanneseder.net>
Date: Sat, 14 Feb 2009 23:10:33 +0000
Subject: [PATCH v2] drivers/isdn/hardware/mISDN: change type of hfc_jiffies to
Message-Id: <20090214230701.21991.75646.stgit@vmbox.hanneseder.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Jiri Slaby <jirislaby@gmail.com>

Jiffies are unsigned long, make sure we fit in jiffies store variable
on archs with bits per long > 32.

Patch suggested by Jiri Slaby.

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---

On Sat, Feb 14, 2009 at 11:48 PM, Jiri Slaby <jirislaby@gmail.com> wrote:
> Hannes Eder wrote:
>>...
>> -static u32 hfc_jiffies;
>> +static ulong hfc_jiffies;
>
> Ok, unsigned long would be nicer. I though it would be implicit when writing
> about ulong, but I see not in this uint-et-al context...

Uhm, it was not clear in this context, as uint is used all over the place.

Thank you Jiri.

Best,
Hannes

 drivers/isdn/hardware/mISDN/hfcpci.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/isdn/hardware/mISDN/hfcpci.c b/drivers/isdn/hardware/mISDN/hfcpci.c
index 2bb85c4..641a9cd 100644
--- a/drivers/isdn/hardware/mISDN/hfcpci.c
+++ b/drivers/isdn/hardware/mISDN/hfcpci.c
@@ -57,7 +57,7 @@ static int HFC_cnt;
 static uint debug;
 static uint poll, tics;
 static struct timer_list hfc_tl;
-static u32 hfc_jiffies;
+static unsigned long hfc_jiffies;
 
 MODULE_AUTHOR("Karsten Keil");
 MODULE_LICENSE("GPL");

