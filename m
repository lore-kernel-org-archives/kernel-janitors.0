From: David Miller <davem@davemloft.net>
Date: Tue, 10 Aug 2010 08:43:04 +0000
Subject: Re: [PATCH 07/18 v2] isdn: avm: call disable_pci_device() if
Message-Id: <20100810.014304.242143517.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1281383448-14050-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1281383448-14050-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: segooon@gmail.com
Cc: kernel-janitors@vger.kernel.org, isdn@linux-pingi.de, adobriyan@gmail.com, tilman@imap.cc, netdev@vger.kernel.org

From: Kulikov Vasiliy <segooon@gmail.com>
Date: Mon,  9 Aug 2010 23:50:47 +0400

> Driver should call disable_pci_device() if it returns from pci_probe()
> with error.
> 
> Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>

Applied, but as previously mentioned disable_pci_device() is wrong.
