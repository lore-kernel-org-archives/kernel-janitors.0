From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 17 Jul 2020 07:47:41 +0000
Subject: Re: [PATCH v2] nfc: nci: add missed destroy_workqueue in nci_register_device
Message-Id: <26e73d0c-4afb-2c14-d411-6d14c5007419@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Wang Hai <wanghai38@huawei.com>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Vincent Cuissard <cuissard@marvell.com>, Samuel Ortiz <sameo@linux.intel.com>, Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>

> When nfc_register_device fails in nci_register_device,
> destroy_workqueue() shouled be called to destroy ndev->tx_wq.

Would an other imperative wording be preferred for the commit message?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?id=f8456690ba8eb18ea4714e68554e242a04f65cff#n151


…
> +++ b/net/nfc/nci/core.c
> @@ -1228,10 +1228,13 @@  int nci_register_device(struct nci_dev *ndev)
>
>  	rc = nfc_register_device(ndev->nfc_dev);
>  	if (rc)
> -		goto destroy_rx_wq_exit;
> +		goto destroy_tx_wq_exit;
>
>  	goto exit;
>
> +destroy_tx_wq_exit:
> +	destroy_workqueue(ndev->tx_wq);
…


How do you think about to use the following source code variant
for this function implementation?

	if (!rc)
		goto exit;

	destroy_workqueue(ndev->tx_wq);


Regards,
Markus
