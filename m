From: Hannes Eder <hannes@hanneseder.net>
Date: Sat, 14 Feb 2009 21:12:23 +0000
Subject: [PATCH 03/43] drivers/net/ni65.c: fix sparse warnings: symbol shadows
Message-Id: <20090214211218.23489.71130.stgit@vmbox.hanneseder.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090214210940.23489.95001.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090214210940.23489.95001.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Impact: Remove redundant variable declaration or move them to a more
inner scope.

Fix this sparse warnings:
  drivers/net/ni65.c:900:37: warning: symbol 'p' shadows an earlier one
  drivers/net/ni65.c:874:21: originally declared here
  drivers/net/ni65.c:925:21: warning: symbol 'p' shadows an earlier one
  drivers/net/ni65.c:874:21: originally declared here
  drivers/net/ni65.c:945:29: warning: symbol 'k' shadows an earlier one
  drivers/net/ni65.c:926:15: originally declared here

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
 drivers/net/ni65.c |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ni65.c b/drivers/net/ni65.c
index 2540572..d769a88 100644
--- a/drivers/net/ni65.c
+++ b/drivers/net/ni65.c
@@ -897,7 +897,6 @@ static irqreturn_t ni65_interrupt(int irq, void * dev_id)
 
 		if(csr0 & CSR0_ERR)
 		{
-			struct priv *p = dev->ml_priv;
 			if(debuglevel > 1)
 				printk(KERN_ERR "%s: general error: %04x.\n",dev->name,csr0);
 			if(csr0 & CSR0_BABL)
@@ -922,8 +921,7 @@ static irqreturn_t ni65_interrupt(int irq, void * dev_id)
  int j;
  for(j=0;j<RMDNUM;j++)
  {
-	struct priv *p = dev->ml_priv;
-	int i,k,num1,num2;
+	int i, num2;
 	for(i=RMDNUM-1;i>0;i--) {
 		 num2 = (p->rmdnum + i) & (RMDNUM-1);
 		 if(!(p->rmdhead[num2].u.s.status & RCV_OWN))
@@ -931,6 +929,7 @@ static irqreturn_t ni65_interrupt(int irq, void * dev_id)
 	}
 
 	if(i) {
+		int k, num1;
 		for(k=0;k<RMDNUM;k++) {
 			num1 = (p->rmdnum + k) & (RMDNUM-1);
 			if(!(p->rmdhead[num1].u.s.status & RCV_OWN))
@@ -942,7 +941,6 @@ static irqreturn_t ni65_interrupt(int irq, void * dev_id)
 		if(debuglevel > 0)
 		{
 			char buf[256],*buf1;
-			int k;
 			buf1 = buf;
 			for(k=0;k<RMDNUM;k++) {
 				sprintf(buf1,"%02x ",(p->rmdhead[k].u.s.status)); /* & RCV_OWN) ); */

