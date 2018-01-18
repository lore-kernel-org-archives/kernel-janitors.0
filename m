From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 18 Jan 2018 10:45:03 +0000
Subject: [PATCH] platform/x86: dell-smbios: Fix error handling in build_tokens_sysfs()
Message-Id: <20180118104503.GA30055@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, Mario Limonciello <mario.limonciello@dell.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org

We're freeing "value_name" which is NULL, so that's a no-op, instead of
"location_name" and then we don't free the first zero-th elements of
token_location_attrs[] and token_value_attrs[].

Fixes: 33b9ca1e53b4 ("platform/x86: dell-smbios: Add a sysfs interface for SMBIOS tokens")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/platform/x86/dell-smbios.c b/drivers/platform/x86/dell-smbios.c
index 6a60db515bda..d8a21c7ba594 100644
--- a/drivers/platform/x86/dell-smbios.c
+++ b/drivers/platform/x86/dell-smbios.c
@@ -512,7 +512,7 @@ static int build_tokens_sysfs(struct platform_device *dev)
 		continue;
 
 loop_fail_create_value:
-		kfree(value_name);
+		kfree(location_name);
 		goto out_unwind_strings;
 	}
 	smbios_attribute_group.attrs = token_attrs;
@@ -523,7 +523,7 @@ static int build_tokens_sysfs(struct platform_device *dev)
 	return 0;
 
 out_unwind_strings:
-	for (i = i-1; i > 0; i--) {
+	for (i = i-1; i >= 0; i--) {
 		kfree(token_location_attrs[i].attr.name);
 		kfree(token_value_attrs[i].attr.name);
 	}
