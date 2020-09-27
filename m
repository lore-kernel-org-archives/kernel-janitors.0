From: Julia Lawall <Julia.Lawall@inria.fr>
Date: Sun, 27 Sep 2020 19:12:22 +0000
Subject: [PATCH 12/18] ACPI: use semicolons rather than commas to separate statements
Message-Id: <1601233948-11629-13-git-send-email-Julia.Lawall@inria.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1601233948-11629-1-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1601233948-11629-1-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: =?UTF-8?q?Valdis=20Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>, Joe Perches <joe@perches.com>, Thomas Gleixner <tglx@linutronix.de>, kernel-janitors@vger.kernel.org, Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org

Replace commas with semicolons.  What is done is essentially described by
the following Coccinelle semantic patch (http://coccinelle.lip6.fr/):

// <smpl>
@@ expression e1,e2; @@
e1
-,
+;
e2
... when any
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/acpi/processor_idle.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/acpi/processor_idle.c b/drivers/acpi/processor_idle.c
index f66236cff69b..85502143f506 100644
--- a/drivers/acpi/processor_idle.c
+++ b/drivers/acpi/processor_idle.c
@@ -1077,7 +1077,9 @@ static int acpi_processor_get_lpi_info(struct acpi_processor *pr)
 		/* flatten all the LPI states in this level of hierarchy */
 		flatten_lpi_states(pr, curr, prev);
 
-		tmp = prev, prev = curr, curr = tmp;
+		tmp = prev;
+		prev = curr;
+		curr = tmp;
 
 		status = acpi_get_parent(handle, &pr_ahandle);
 	}
