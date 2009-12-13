From: Julia Lawall <julia@diku.dk>
Date: Sun, 13 Dec 2009 11:41:29 +0000
Subject: [PATCH 4/9] drivers/net/sfc: Correct code taking the size of a
Message-Id: <Pine.LNX.4.64.0912131241130.24267@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-net-drivers@solarflare.com, Steve Hodgson <shodgson@solarflare.com>, Ben Hutchings <bhutchings@solarflare.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

The function efx_iterate_state contains the code
memcpy(&payload->msg, payload_msg, sizeof(payload_msg));
This is the only use of payload_msg.  The type of payload_msg is
changed from a pointer to an array, so that the result of sizeof really is
the length of the string.

A simplified version of the semantic patch that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
expression *x;
expression f;
type T;
@@

*f(...,(T)x,...)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/net/sfc/selftest.c          |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/net/sfc/selftest.c b/drivers/net/sfc/selftest.c
index 14949bb..af39335 100644
--- a/drivers/net/sfc/selftest.c
+++ b/drivers/net/sfc/selftest.c
@@ -47,7 +47,7 @@ static const unsigned char payload_source[ETH_ALEN] = {
 	0x00, 0x0f, 0x53, 0x1b, 0x1b, 0x1b,
 };
 
-static const char *payload_msg +static const char payload_msg[]  	"Hello world! This is an Efx loopback test in progress!";
 
 /**
