From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 18 Oct 2013 09:01:43 +0000
Subject: [patch] ACPI / osl: remove an unneeded NULL check
Message-Id: <20131018090143.GB14256@longonot.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Len Brown <lenb@kernel.org>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-acpi@vger.kernel.org, kernel-janitors@vger.kernel.org

"str" is never NULL here so I have removed the check.  There are static
checkers which complain about superfluous NULL checks because it may
indicate confusion or a bug.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/acpi/osl.c b/drivers/acpi/osl.c
index 50d40e5..a0c09ad 100644
--- a/drivers/acpi/osl.c
+++ b/drivers/acpi/osl.c
@@ -1355,7 +1355,7 @@ static int __init acpi_os_name_setup(char *str)
 	if (!str || !*str)
 		return 0;
 
-	for (; count-- && str && *str; str++) {
+	for (; count-- && *str; str++) {
 		if (isalnum(*str) || *str = ' ' || *str = ':')
 			*p++ = *str;
 		else if (*str = '\'' || *str = '"')
