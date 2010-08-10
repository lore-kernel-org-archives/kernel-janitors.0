From: David Miller <davem@davemloft.net>
Date: Tue, 10 Aug 2010 08:34:47 +0000
Subject: Re: [patch 1/2 v2] qlcnic: clean up qlcnic_init_pci_info()
Message-Id: <20100810.013447.245408526.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100810074756.GF18431@bicker>
In-Reply-To: <20100810074756.GF18431@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: error27@gmail.com
Cc: amit.salecha@qlogic.com, anirban.chakraborty@qlogic.com, linux-driver@qlogic.com, sucheta.chakraborty@qlogic.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <error27@gmail.com>
Date: Tue, 10 Aug 2010 09:47:56 +0200

> In the original code we allocated memory conditionally and freed it in
> the error handling unconditionally.  It turns out that this function is
> only called during initialization and "adapter->npars" and
> "adapter->eswitch" are always NULL at the start of the function.  I
> removed those checks.
> 
> Also since I was cleaning things, I changed the error handling for
> qlcnic_get_pci_info() and pulled everything in an indent level.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Applied.
