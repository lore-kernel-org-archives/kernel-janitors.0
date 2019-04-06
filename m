From: David Miller <davem@davemloft.net>
Date: Sat, 06 Apr 2019 22:04:48 +0000
Subject: Re: [PATCH 2/2 net] nfc: nci: Potential off by one in ->pipes[] array
Message-Id: <20190406.150448.531006720566146319.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190403071248.GA5758@kadam>
        <20190403071351.GB5758@kadam>
In-Reply-To: <20190403071351.GB5758@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: sameo@linux.intel.com, christophe.ricard@gmail.com, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org, netdev@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 3 Apr 2019 10:13:51 +0300

> This is similar to commit e285d5bfb7e9 ("NFC: Fix the number of pipes")
> where we changed NFC_HCI_MAX_PIPES from 127 to 128.
> 
> As the comment next to the define explains, the pipe identifier is 7
> bits long.  The highest possible pipe is 127, but the number of possible
> pipes is 128.  As the code is now, then there is potential for an
> out of bounds array access:
> 
>     net/nfc/nci/hci.c:297 nci_hci_cmd_received() warn: array off by one?
>     'ndev->hci_dev->pipes[pipe]' '0-127 = 127'
> 
> Fixes: 11f54f228643 ("NFC: nci: Add HCI over NCI protocol support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
