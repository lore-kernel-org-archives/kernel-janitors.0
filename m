From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Mon, 24 Aug 2015 21:12:25 +0000
Subject: [PATCH 0/2] convert null test to IS_ERR test
Message-Id: <1440450747-10080-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

Since commit 323de9efdf3e ("pinctrl: make pinctrl_register() return proper
error code"), pinctrl_register returns an error code rather than NULL on
failure.  Most drivers were updated at that time.  Update some drivers that
were introduced more recently.

