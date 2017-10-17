From: Colin King <colin.king@canonical.com>
Date: Tue, 17 Oct 2017 15:54:52 +0000
Subject: [PATCH][ipmi-next] ipmi_si: fix memory leak on new_smi
Message-Id: <20171017155452.24807-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Corey Minyard <minyard@acm.org>, openipmi-developer@lists.sourceforge.net
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The error exit path omits kfree'ing the allocated new_smi, causing a memory
leak.  Fix this by kfree'ing new_smi.

Detected by CoverityScan, CID#14582571 ("Resource Leak")

Fixes: 7e030d6dff71 ("ipmi: Prefer ACPI system interfaces over SMBIOS ones")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/char/ipmi/ipmi_si_intf.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/char/ipmi/ipmi_si_intf.c b/drivers/char/ipmi/ipmi_si_intf.c
index 55e0c42bee4d..4c16af64f73a 100644
--- a/drivers/char/ipmi/ipmi_si_intf.c
+++ b/drivers/char/ipmi/ipmi_si_intf.c
@@ -2004,6 +2004,7 @@ int ipmi_si_add_smi(struct si_sm_io *io)
 				 ipmi_addr_src_to_str(new_smi->io.addr_source),
 				 si_to_str[new_smi->io.si_type]);
 			rv = -EBUSY;
+			kfree(new_smi);
 			goto out_err;
 		}
 	}
-- 
2.14.1

