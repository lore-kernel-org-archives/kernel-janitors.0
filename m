From: Julia Lawall <julia@diku.dk>
Date: Mon, 21 Jul 2008 07:57:47 +0000
Subject: [PATCH 3/7] drivers/net/wireless/b43legacy/main.c: Release mutex in
Message-Id: <Pine.LNX.4.64.0807210957270.24625@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Larry.Finger@lwfinger.net, stefano.brivio@polimi.it, linux-wireless@vger.kernel.org, jgarzik@pobox.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

The mutex is released on a successful return, so it would seem that it
should be released on an error return as well.

The semantic patch finds this problem is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@@
expression l;
@@

mutex_lock(l);
... when != mutex_unlock(l)
    when any
    when strict
(
if (...) { ... when != mutex_unlock(l)
+   mutex_unlock(l);
    return ...;
}
|
mutex_unlock(l);
)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
diff -u -p a/drivers/net/wireless/b43legacy/main.c b/drivers/net/wireless/b43legacy/main.c
--- a/drivers/net/wireless/b43legacy/main.c
+++ b/drivers/net/wireless/b43legacy/main.c
@@ -3862,10 +3862,10 @@ static int b43legacy_resume(struct ssb_d
 			goto out;
 		}
 	}
-	mutex_unlock(&wl->mutex);
 
 	b43legacydbg(wl, "Device resumed.\n");
 out:
+	mutex_unlock(&wl->mutex);
 	return err;
 }
 
