From: Christophe Lucas <clucas@rotomalug.org>
Date: Fri, 01 Apr 2005 12:46:35 +0000
Subject: [KJ] [PATCH] char* : drivers/acpi/battery.c
Message-Id: <20050401124635.GO5445@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="wtjvnLv0o8UUzur2"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--wtjvnLv0o8UUzur2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Description:
String form : char foo[] = "blah" is better than char *foo = "blah"

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>



--wtjvnLv0o8UUzur2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="2.6.12-rc1-pointer_drivers_acpi_battery.c.patch"

diff -urpN -X dontdiff a/drivers/acpi/battery.c b/drivers/acpi/battery.c
--- a/drivers/acpi/battery.c	2005-03-18 02:34:26.000000000 +0100
+++ b/drivers/acpi/battery.c	2005-04-01 11:53:03.136666208 +0200
@@ -347,7 +347,7 @@ static int acpi_battery_read_info(struct
 	int			result = 0;
 	struct acpi_battery	*battery = (struct acpi_battery *) seq->private;
 	struct acpi_battery_info *bif = NULL;
-	char			*units = "?";
+	char			units[] = "?";
 
 	ACPI_FUNCTION_TRACE("acpi_battery_read_info");
 
@@ -436,7 +436,7 @@ acpi_battery_read_state (struct seq_file
 	int			result = 0;
 	struct acpi_battery	*battery = (struct acpi_battery *) seq->private;
 	struct acpi_battery_status *bst = NULL;
-	char			*units = "?";
+	char			units[] = "?";
 
 	ACPI_FUNCTION_TRACE("acpi_battery_read_state");
 
@@ -514,7 +514,7 @@ static int
 acpi_battery_read_alarm (struct seq_file *seq, void *offset)
 {
 	struct acpi_battery	*battery = (struct acpi_battery *) seq->private;
-	char			*units = "?";
+	char			units[] = "?";
 
 	ACPI_FUNCTION_TRACE("acpi_battery_read_alarm");
 

--wtjvnLv0o8UUzur2
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--wtjvnLv0o8UUzur2--
