From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 19 Sep 2014 10:56:56 +0000
Subject: [patch] UBI: return on error in rename_volumes()
Message-Id: <20140919104848.GC26391@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Artem Bityutskiy <dedekind1@gmail.com>
Cc: linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>

I noticed this during a code review.  We are checking that the strlen()
of ->name is not less than the ->name_len which the user gave us.  I
believe this bug is harmless but clearly we meant to return here instead
of setting an error code and then not using it.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
I'm not totally familiar with the code so please review extra carefully.

diff --git a/drivers/mtd/ubi/cdev.c b/drivers/mtd/ubi/cdev.c
index 20aeb27..59de69a 100644
--- a/drivers/mtd/ubi/cdev.c
+++ b/drivers/mtd/ubi/cdev.c
@@ -701,7 +701,7 @@ static int rename_volumes(struct ubi_device *ubi,
 		req->ents[i].name[req->ents[i].name_len] = '\0';
 		n = strlen(req->ents[i].name);
 		if (n != req->ents[i].name_len)
-			err = -EINVAL;
+			return -EINVAL;
 	}
 
 	/* Make sure volume IDs and names are unique */
