From: Greg KH <greg@kroah.com>
Date: Fri, 30 Jan 2004 00:15:43 +0000
Subject: Re: [Kernel-janitors] [PATCH] cpcihp_zt5550.c ioremap/iounmap audit
Message-Id: <20040130001543.GB10763@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1074294839.12959.90.camel@ibm-d.pdx.osdl.net>
In-Reply-To: <1074294839.12959.90.camel@ibm-d.pdx.osdl.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Jan 16, 2004 at 03:13:59PM -0800, Leann Ogasawara wrote:
> Hi All,
> 
> Again insert missing iounmap()
> 
> diffed against 2.6.1

Thanks, I've applied this to my pci tree.

greg k-h
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
