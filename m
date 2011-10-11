From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 11 Oct 2011 13:22:29 +0000
Subject: [patch] cipso: remove an unneeded NULL check in cipso_v4_doi_add()
Message-Id: <20111011132228.GA27127@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, James Morris <jmorris@namei.org>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, Patrick McHardy <kaber@trash.net>, kernel-janitors@vger.kernel.org

We dereference doi_def on the line before the NULL check.  It has
been this way since 2008.  I checked all the callers and doi_def is
always non-NULL here.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/net/ipv4/cipso_ipv4.c b/net/ipv4/cipso_ipv4.c
index 2c2a98e..86f3b88 100644
--- a/net/ipv4/cipso_ipv4.c
+++ b/net/ipv4/cipso_ipv4.c
@@ -476,7 +476,7 @@ int cipso_v4_doi_add(struct cipso_v4_doi *doi_def,
 	doi = doi_def->doi;
 	doi_type = doi_def->type;
 
-	if (doi_def = NULL || doi_def->doi = CIPSO_V4_DOI_UNKNOWN)
+	if (doi_def->doi = CIPSO_V4_DOI_UNKNOWN)
 		goto doi_add_return;
 	for (iter = 0; iter < CIPSO_V4_TAG_MAXCNT; iter++) {
 		switch (doi_def->tags[iter]) {
