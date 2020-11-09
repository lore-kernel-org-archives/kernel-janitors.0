From: Colin Ian King <colin.king@canonical.com>
Date: Mon, 09 Nov 2020 13:21:51 +0000
Subject: re: scsi: ufs: Try to save power mode change and UIC cmd completion timeout
Message-Id: <fa7ed8c9-8b5d-c499-a498-245364b18f63@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Can Guo <cang@codeaurora.org>, "Martin K. Petersen" <martin.petersen@oracle.com>, Stanley Chu <stanley.chu@mediatek.com>
Cc: "James E.J. Bottomley" <jejb@linux.ibm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

Hi

Static analysis with Coverity on linux-next has detected a potential
null pointer deference issue with commit:

commit 0f52fcb99ea2738a0a0f28e12cf4dd427069dd2a
Author: Can Guo <cang@codeaurora.org>
Date:   Mon Nov 2 22:24:40 2020 -0800

    scsi: ufs: Try to save power mode change and UIC cmd completion timeout


The analysis is as follows:

4925 static irqreturn_t ufshcd_uic_cmd_compl(struct ufs_hba *hba, u32
intr_status)
4926 {
4927        irqreturn_t retval = IRQ_NONE;
4928

    1. Condition intr_status & 1024, taking true branch.
    2. Condition hba->active_uic_cmd, taking false branch.
    3. var_compare_op: Comparing hba->active_uic_cmd to null implies
that hba->active_uic_cmd might be null.

4929        if ((intr_status & UIC_COMMAND_COMPL) && hba->active_uic_cmd) {
4930                hba->active_uic_cmd->argument2 |4931                        ufshcd_get_uic_cmd_result(hba);
4932                hba->active_uic_cmd->argument3 4933                        ufshcd_get_dme_attr_val(hba);
4934                if (!hba->uic_async_done)
4935                        hba->active_uic_cmd->cmd_active = 0;
4936                complete(&hba->active_uic_cmd->done);
4937                retval = IRQ_HANDLED;
4938        }
4939

    4. Condition intr_status & (112U /* (0x40 | 0x20) | 0x10 */), taking
true branch.
    5. Condition hba->uic_async_done, taking true branch.

4940        if ((intr_status & UFSHCD_UIC_PWR_MASK) &&
hba->uic_async_done) {

Dereference after null check (FORWARD_NULL)
    6. var_deref_op: Dereferencing null pointer hba->active_uic_cmd.

4941                hba->active_uic_cmd->cmd_active = 0;
4942                complete(hba->uic_async_done);
4943                retval = IRQ_HANDLED;
4944        }
4945

Line 4929 checks to see if hba->active_uic_cmd is null, so there is a
potential it may be null.  However, on line 4941 hba->active_uic_cmd is
being dereferenced without a null check, so Coverity has flagged this is
a potential null pointer dereference issue.

If it is null, then cmd_active shouldn't be assigned, but I'm unsure if
this is a false positive warning and/or what the ramifications of not
seeting cmd_active to zero is if hba->active_uic_cmd is null.

Colin
