From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 27 Sep 2011 06:44:41 +0000
Subject: [patch] 9p: fix min_t() casting in p9pdu_vwritef()
Message-Id: <20110927064441.GA4461@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eric Van Hensbergen <ericvh@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, Venkateswararao Jujjuri <jvrao@linux.vnet.ibm.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>, Harsh Prateek Bora <harsh@linux.vnet.ibm.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

I don't think we're actually likely to hit this limit but if we do
then the comparison should be done as size_t.  The original code
is equivalent to:
	len = strlen(sptr) % USHRT_MAX;

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/net/9p/protocol.c b/net/9p/protocol.c
index 55e10a9..39a4c18 100644
--- a/net/9p/protocol.c
+++ b/net/9p/protocol.c
@@ -368,7 +368,7 @@ p9pdu_vwritef(struct p9_fcall *pdu, int proto_version, const char *fmt,
 				const char *sptr = va_arg(ap, const char *);
 				uint16_t len = 0;
 				if (sptr)
-					len = min_t(uint16_t, strlen(sptr),
+					len = min_t(size_t, strlen(sptr),
 								USHRT_MAX);
 
 				errcode = p9pdu_writef(pdu, proto_version,
