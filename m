From: Mao Wenan <maowenan@huawei.com>
Date: Tue, 19 Nov 2019 03:25:34 +0000
Subject: [PATCH -next] vsock/vmci: make vmci_vsock_cb_host_called static
Message-Id: <20191119032534.52090-1-maowenan@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: arnd@arndb.de, gregkh@linuxfoundation.org, davem@davemloft.net, sgarzare@redhat.com, kstewart@linuxfoundation.org, alexios.zavras@intel.com, tglx@linutronix.de, maowenan@huawei.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>

When using make C=2 drivers/misc/vmw_vmci/vmci_driver.o
to compile, below warning can be seen:
drivers/misc/vmw_vmci/vmci_driver.c:33:6: warning:
symbol 'vmci_vsock_cb_host_called' was not declared. Should it be static?

This patch make symbol vmci_vsock_cb_host_called static.

Fixes: b1bba80a4376 ("vsock/vmci: register vmci_transport only when VMCI guest/host are active")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Mao Wenan <maowenan@huawei.com>
---
 drivers/misc/vmw_vmci/vmci_driver.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/vmw_vmci/vmci_driver.c b/drivers/misc/vmw_vmci/vmci_driver.c
index 95fed46..cbb706d 100644
--- a/drivers/misc/vmw_vmci/vmci_driver.c
+++ b/drivers/misc/vmw_vmci/vmci_driver.c
@@ -30,7 +30,7 @@ static bool vmci_host_personality_initialized;
 
 static DEFINE_MUTEX(vmci_vsock_mutex); /* protects vmci_vsock_transport_cb */
 static vmci_vsock_cb vmci_vsock_transport_cb;
-bool vmci_vsock_cb_host_called;
+static bool vmci_vsock_cb_host_called;
 
 /*
  * vmci_get_context_id() - Gets the current context ID.
-- 
2.7.4
