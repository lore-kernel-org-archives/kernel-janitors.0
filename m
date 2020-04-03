From: Alan Mikhak <alan.mikhak@sifive.com>
Date: Fri, 03 Apr 2020 19:51:34 +0000
Subject: [PATCH][next] PCI: endpoint: functions/pci-epf-test: fix memory leak of buf
Message-Id: <1585943494-23977-1-git-send-email-alan.mikhak@sifive.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200401223541.403438-1-colin.king@canonical.com>
In-Reply-To: <20200401223541.403438-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kishon@ti.com
Cc: lorenzo.pieralisi@arm.com, bhelgaas@google.com, linux-pci@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Colin,

Please note a similar leak in pci_epf_test_write().

Regards,
Alan Mikhak
