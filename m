From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Thu, 06 Sep 2012 16:09:10 +0000
Subject: [PATCH 2/10] drivers/scsi/sym53c8xx_2/sym_fw.c: removes unnecessary semicolon
Message-Id: <1346947757-10481-3-git-send-email-peter.senna@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1346947757-10481-1-git-send-email-peter.senna@gmail.com>
In-Reply-To: <1346947757-10481-1-git-send-email-peter.senna@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthew Wilcox <matthew@wil.cx>
Cc: kernel-janitors@vger.kernel.org, Peter Senna Tschudin <peter.senna@gmail.com>, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org

From: Peter Senna Tschudin <peter.senna@gmail.com>

removes unnecessary semicolon

Found by Coccinelle: http://coccinelle.lip6.fr/

Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>

---
 drivers/scsi/sym53c8xx_2/sym_fw.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff -u -p a/drivers/scsi/sym53c8xx_2/sym_fw.c b/drivers/scsi/sym53c8xx_2/sym_fw.c
--- a/drivers/scsi/sym53c8xx_2/sym_fw.c
+++ b/drivers/scsi/sym53c8xx_2/sym_fw.c
@@ -386,7 +386,7 @@ void sym_fw_bind_script(struct sym_hcb *
 				sym_name(np), (int) (cur-start));
 			++cur;
 			continue;
-		};
+		}
 
 		/*
 		 *  We use the bogus value 0xf00ff00f ;-)
@@ -494,7 +494,7 @@ void sym_fw_bind_script(struct sym_hcb *
 		default:
 			relocs = 0;
 			break;
-		};
+		}
 
 		/*
 		 *  Scriptify:) the opcode.
@@ -550,5 +550,5 @@ void sym_fw_bind_script(struct sym_hcb *
 
 			*cur++ = cpu_to_scr(new);
 		}
-	};
+	}
 }

