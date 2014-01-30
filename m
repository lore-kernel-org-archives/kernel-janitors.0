From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 30 Jan 2014 11:56:56 +0000
Subject: [patch] ACPI: remove a pointless NULL check
Message-Id: <20140130115656.GG12734@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Len Brown <lenb@kernel.org>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-acpi@vger.kernel.org, kernel-janitors@vger.kernel.org

"element" can't be NULL because it is the address of a struct member.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/acpi/utils.c b/drivers/acpi/utils.c
index 492cf4f409fd..94dbbcb5827b 100644
--- a/drivers/acpi/utils.c
+++ b/drivers/acpi/utils.c
@@ -98,10 +98,6 @@ acpi_extract_package(union acpi_object *package,
 
 		union acpi_object *element = &(package->package.elements[i]);
 
-		if (!element) {
-			return AE_BAD_DATA;
-		}
-
 		switch (element->type) {
 
 		case ACPI_TYPE_INTEGER:
