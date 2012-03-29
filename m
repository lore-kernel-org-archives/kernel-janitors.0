From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 29 Mar 2012 06:43:54 +0000
Subject: [patch] Staging: vt6655-6: check keysize before memcpy()
Message-Id: <20120329064354.GA17647@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We need to check the we don't copy too much memory.  This comes from a
copy_from_user() in the ioctl.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/vt6656/key.c b/drivers/staging/vt6656/key.c
index 27bb523..ee62a06 100644
--- a/drivers/staging/vt6656/key.c
+++ b/drivers/staging/vt6656/key.c
@@ -684,6 +684,9 @@ BOOL KeybSetDefaultKey(
         return (FALSE);
     }
 
+    if (uKeyLength > MAX_KEY_LEN)
+	    return false;
+
     pTable->KeyTable[MAX_KEY_TABLE-1].bInUse = TRUE;
     for (ii = 0; ii < ETH_ALEN; ii++)
         pTable->KeyTable[MAX_KEY_TABLE-1].abyBSSID[ii] = 0xFF;
diff --git a/drivers/staging/vt6655/key.c b/drivers/staging/vt6655/key.c
index 0ff8d7b..774b0d4 100644
--- a/drivers/staging/vt6655/key.c
+++ b/drivers/staging/vt6655/key.c
@@ -655,6 +655,9 @@ bool KeybSetDefaultKey (
         return (false);
     }
 
+    if (uKeyLength > MAX_KEY_LEN)
+	    return false;
+
     pTable->KeyTable[MAX_KEY_TABLE-1].bInUse = true;
     for(ii=0;ii<ETH_ALEN;ii++)
         pTable->KeyTable[MAX_KEY_TABLE-1].abyBSSID[ii] = 0xFF;
