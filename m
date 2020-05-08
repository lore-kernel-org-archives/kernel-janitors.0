From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Fri, 08 May 2020 12:30:22 +0000
Subject: [PATCH 4.4 031/312] MIPS: RM7000: Double locking bug in rm7k_tc_disable()
Message-Id: <20200508123126.677472805@linuxfoundation.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200508123124.574959822@linuxfoundation.org>
In-Reply-To: <20200508123124.574959822@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>, linux-mips@linux-mips.org, kernel-janitors@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>

From: Dan Carpenter <dan.carpenter@oracle.com>

commit 58a7e1c140f3ad61646bc0cd9a1f6a9cafc0b225 upstream.

We obviously intended to enable IRQs again at the end.

Fixes: 745aef5df1e2 ('MIPS: RM7000: Add support for tertiary cache')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-mips@linux-mips.org
Cc: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org
Patchwork: https://patchwork.linux-mips.org/patch/13815/
Signed-off-by: Ralf Baechle <ralf@linux-mips.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
 arch/mips/mm/sc-rm7k.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/arch/mips/mm/sc-rm7k.c
+++ b/arch/mips/mm/sc-rm7k.c
@@ -161,7 +161,7 @@ static void rm7k_tc_disable(void)
 	local_irq_save(flags);
 	blast_rm7k_tcache();
 	clear_c0_config(RM7K_CONF_TE);
-	local_irq_save(flags);
+	local_irq_restore(flags);
 }
 
 static void rm7k_sc_disable(void)
