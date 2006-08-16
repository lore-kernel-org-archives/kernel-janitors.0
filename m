From: Matthew Wilcox <matthew@wil.cx>
Date: Wed, 16 Aug 2006 17:34:20 +0000
Subject: Re: [KJ] [PATCH] Y/N value import/export
Message-Id: <20060816173420.GH4340@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060816170423.GA5897@plankton.ifup.org>
In-Reply-To: <20060816170423.GA5897@plankton.ifup.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Aug 16, 2006 at 12:04:45PM -0500, Brandon Philips wrote:
> I am wanting to export a single Y/N value via sysfs like
> debugfs_create_bool does.

Why not 0/1 like the rest of the kernel does?
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
