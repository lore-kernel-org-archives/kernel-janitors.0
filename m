From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 15 Jan 2019 19:52:41 +0000
Subject: [PATCH] XArray: Fix a math problem in xa_is_err()
Message-Id: <20190115195241.GB1074@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthew Wilcox <willy@infradead.org>
Cc: linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org

There is a math problem here which leads to a lot of static checker
warnings for me:

net/sunrpc/clnt.c:451 rpc_new_client() error: (-4096) too low for ERR_PTR

Error values are from -1 to -4095 or from 0xffffffff to 0xfffff001 in
hexadecimal.  (I am assuming a 32 bit system for simplicity).  We are
using the lowest two bits to hold some internal XArray data so the
error is shifted two spaces to the left.  0xfffff001 << 2 is 0xffffc004.
And finally we want to check that BIT(1) is set so we add 2 which gives
us 0xffffc006.

In other words, we should be checking that "entry >= 0xffffc006", but
the check is actually testing if "entry >= 0xffffc002".

Fixes: 76b4e5299565 ("XArray: Permit storing 2-byte-aligned pointers")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 include/linux/xarray.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/linux/xarray.h b/include/linux/xarray.h
index 12244aa98a69..4208042f939a 100644
--- a/include/linux/xarray.h
+++ b/include/linux/xarray.h
@@ -177,7 +177,8 @@ static inline bool xa_is_internal(const void *entry)
 static inline bool xa_is_err(const void *entry)
 {
 	return unlikely(xa_is_internal(entry) &&
-			(unsigned long)entry >= -((MAX_ERRNO << 2) + 2));
+			(unsigned long)entry >+				(((unsigned long)(-MAX_ERRNO << 2) + 2)));
 }
 
 /**
-- 
2.17.1
