From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Thu, 02 Jan 2014 22:45:48 +0000
Subject: [PATCH 0/3] use named constants for pci_power_t values
Message-Id: <1388706031-22180-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alsa-devel@alsa-project.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org

Replace numbers by named constants.  The complete semantic patch used is as
follows (http://coccinelle.lip6.fr/):

// <smpl>
@@
expression pdev;
@@

pci_set_power_state(pdev,
(
- 0
+ PCI_D0
|
- 1
+ PCI_D1
|
- 2
+ PCI_D2
|
- 3
+ PCI_D3hot
|
- 4
+ PCI_D3cold
|
- 5
+ PCI_UNKNOWN
|
- -1
+ PCI_POWER_ERROR
)
 )

@@
expression e1,e2;
@@

pci_enable_wake(e1,
(
- 0
+ PCI_D0
|
- 1
+ PCI_D1
|
- 2
+ PCI_D2
|
- 3
+ PCI_D3hot
|
- 4
+ PCI_D3cold
|
- 5
+ PCI_UNKNOWN
|
- -1
+ PCI_POWER_ERROR
)
,e2)
// </smpl>

