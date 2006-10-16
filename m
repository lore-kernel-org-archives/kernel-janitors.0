From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Mon, 16 Oct 2006 13:40:28 +0000
Subject: Re: [KJ] [PATCH] drivers/atm: No need to return void
Message-Id: <20061016134028.GA31926@martell.zuzino.mipt.ru>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20061004093523.GA14108@distanz.ch>
In-Reply-To: <20061004093523.GA14108@distanz.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Oct 04, 2006 at 11:35:23AM +0200, Tobias Klauser wrote:
> The module_exit function has return-type void and
> pci_unregister_driver() returns void anyway.

> -  return pci_unregister_driver(&amb_driver);
> +  pci_unregister_driver(&amb_driver);

Logical continuation would be a patch so sparse(1) would start warning
about such things.

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
