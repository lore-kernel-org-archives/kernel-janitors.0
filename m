From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 20 Jul 2020 11:07:53 +0000
Subject: Re: [PATCH] ath11k: Fix memory leak in ath11k_qmi_init_service()
Message-Id: <9379ef46-5931-5542-c424-916bb8476a92@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Wang Yufen <wangyufen@huawei.com>, brcm80211-dev-list@cypress.com, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Franky Lin <franky.lin@broadcom.com>, Jakub Kicinski <kuba@kernel.org>, Kalle Valo <kvalo@codeaurora.org>, Wright Feng <wright.feng@cypress.com>

> When qmi_add_lookup fail, we should destroy the workqueue

Can the following wording variant be nicer for the change description?

   Destroy the work queue object in an if branch
   after a call of the function “qmi_add_lookup” failed.

Regards,
Markus
