From: Neil Horman <nhorman@tuxdriver.com>
Date: Thu, 03 Aug 2006 20:13:57 +0000
Subject: Re: [KJ] [KJ PATCH] sh: fix proc file removal for superh store
Message-Id: <20060803201357.GB5004@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060803191828.GA5004@localhost.localdomain>
In-Reply-To: <20060803191828.GA5004@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Aug 03, 2006 at 12:42:35PM -0700, Andrew Morton wrote:
> 
> > To: kernel-janitors@lists.osdl.org
> 
> An oops fix isn't a kernel-janitors thing.  It's a
> slam-it-into-mainline-and-consider-a-backport thing.
> 
sorry, I was looking for more misc_register cleanups for KJ, and ran into this
in the process.  Wrote the email without thinking about the subject tags, my
bad.

> On Thu, 3 Aug 2006 15:18:28 -0400
> Neil Horman <nhorman@tuxdriver.com> wrote:
> 
> > Patch to balance proc file creation and removal for superh store queue module.
> 
> You have a superh machine?
> 
No, but the problem is fairly self evident.  leaving a proc file dangling on
module removal is begging to execute random data.

> 
> OK.  But we do have a stub which provides a CONFIG_PROC_FS=n implementation
> of remove_proc_entry(), so the ifdefs shouldn't be necessary?
Good point, I'll remove, and repost.
Neil

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
