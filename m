From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Fri, 04 Mar 2005 15:49:45 +0000
Subject: Re: [KJ] compile warnings due to change of pci resource element type
Message-Id: <42288399.9060609@osdl.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <42287935.30573.366952@localhost>
In-Reply-To: <42287935.30573.366952@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Stephen Biggs wrote:
> Trying to comple the latest version (2.6.11-rc5-mm1) gives a huge amount 
> of warnings in a lot of files due to printf formats (and a couple of 
> other minor issues) that have %lx instead of %llx for the "start" element 
> in the pci_resource struct whose type was changed from u32 to u64.
> 
> These are relatively easy to fix and need to be fixed because of 
> potential stack issues with var arg functions like printk and friends.
> 
> My question is: should I do this or is someone else working on this, 
> perhaps a better fix than simply changing the majority of occurrences of 
> "%lx" to "%llx"?

I read messages on lkml that the pci resource patch was being dropped
temporarily to fix some issues.... Perhaps its patch submitter will
be fixing those, I dunno.

-- 
~Randy
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
