From: David Miller <davem@davemloft.net>
Date: Fri, 06 Mar 2020 05:33:21 +0000
Subject: Re: [PATCH net] net: nfc: fix bounds checking bugs on "pipe"
Message-Id: <20200305.213321.1243150631582322410.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200304142429.2734khtbfyyoxmwc@kili.mountain>
In-Reply-To: <20200304142429.2734khtbfyyoxmwc@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: christophe.ricard@gmail.com, kuba@kernel.org, gregkh@linuxfoundation.org, kstewart@linuxfoundation.org, allison@lohutok.net, netdev@vger.kernel.org, surenb@google.com, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 4 Mar 2020 17:24:31 +0300

> This is similar to commit 674d9de02aa7 ("NFC: Fix possible memory
> corruption when handling SHDLC I-Frame commands") and commit d7ee81ad09f0
> ("NFC: nci: Add some bounds checking in nci_hci_cmd_received()") which
> added range checks on "pipe".
> 
> The "pipe" variable comes skb->data[0] in nfc_hci_msg_rx_work().
> It's in the 0-255 range.  We're using it as the array index into the
> hdev->pipes[] array which has NFC_HCI_MAX_PIPES (128) members.
> 
> Fixes: 118278f20aa8 ("NFC: hci: Add pipes table to reference them with a tuple {gate, host}")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied and queued up for -stable, thanks Dan.
