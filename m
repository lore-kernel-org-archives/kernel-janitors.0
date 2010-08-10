From: David Miller <davem@davemloft.net>
Date: Tue, 10 Aug 2010 08:34:52 +0000
Subject: Re: [patch 2/2 v2] qlcnic: using too much stack
Message-Id: <20100810.013452.70206967.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100810074936.GG18431@bicker>
In-Reply-To: <20100810074936.GG18431@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: error27@gmail.com
Cc: amit.salecha@qlogic.com, anirban.chakraborty@qlogic.com, linux-driver@qlogic.com, sucheta.chakraborty@qlogic.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <error27@gmail.com>
Date: Tue, 10 Aug 2010 09:49:36 +0200

> qlcnic_pci_info structs are 128 bytes so an array of 8 uses 1024 bytes.
> That's a lot if you run with 4K stacks.  I allocated them with kcalloc()
> instead.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Applied.
