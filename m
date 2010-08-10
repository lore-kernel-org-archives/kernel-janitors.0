From: David Miller <davem@davemloft.net>
Date: Tue, 10 Aug 2010 08:42:46 +0000
Subject: Re: [PATCH 06/18 v2] isdn: avm: call disable_pci_device() if
Message-Id: <20100810.014246.15248571.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1281383439-13988-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1281383439-13988-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: segooon@gmail.com
Cc: kernel-janitors@vger.kernel.org, isdn@linux-pingi.de, adobriyan@gmail.com, tilman@imap.cc, tj@kernel.org, netdev@vger.kernel.org

From: Kulikov Vasiliy <segooon@gmail.com>
Date: Mon,  9 Aug 2010 23:50:37 +0400

> Driver should call disable_pci_device() if it returns from pci_probe()
> with error.
> 
> Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>

Applied, but please fix the template you're using for the commit
message header and the message itself, because in all of your
patches you've transposed "disable" and "pci" in "pci_disable_device()"

So I have to fix it up two times in every patch I apply of your's.

Thanks.
