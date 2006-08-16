From: Brandon Philips <brandon@ifup.org>
Date: Wed, 16 Aug 2006 17:52:24 +0000
Subject: Re: [KJ] [PATCH] Y/N value import/export
Message-Id: <20060816175211.GB5897@plankton.ifup.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060816170423.GA5897@plankton.ifup.org>
In-Reply-To: <20060816170423.GA5897@plankton.ifup.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 11:34 Wed 16 Aug 2006, Matthew Wilcox wrote:
> On Wed, Aug 16, 2006 at 12:04:45PM -0500, Brandon Philips wrote:
> > I am wanting to export a single Y/N value via sysfs like
> > debugfs_create_bool does.
> 
> Why not 0/1 like the rest of the kernel does?

I couldn't find an example of a boolean values exported via sysfs.
Could you point me to an attr that uses 0/1 values?

Thanks,

	Brandon

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
