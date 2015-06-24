From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 24 Jun 2015 14:30:15 +0000
Subject: [patch] ACPI / resources: free memory on error in add_region_before()
Message-Id: <20150624143015.GD1702@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, kernel-janitors@vger.kernel.org

There is a small memory leak on error.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/acpi/resource.c b/drivers/acpi/resource.c
index fcb7807..10561ce 100644
--- a/drivers/acpi/resource.c
+++ b/drivers/acpi/resource.c
@@ -660,8 +660,10 @@ static int add_region_before(u64 start, u64 end, u8 space_id,
 		return -ENOMEM;
 
 	error = request_range(start, end, space_id, flags, desc);
-	if (error)
+	if (error) {
+		kfree(reg);
 		return error;
+	}
 
 	reg->start = start;
 	reg->end = end;
