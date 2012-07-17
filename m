From: David Teigland <teigland@redhat.com>
Date: Tue, 17 Jul 2012 14:35:12 +0000
Subject: Re: [dlm:next 1/6] fs/dlm/lock.c:1049:9: sparse: context imbalance in 'dlm_master_lookup' - differen
Message-Id: <20120717143512.GA27745@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120717001014.GC16944@localhost>
In-Reply-To: <20120717001014.GC16944@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Jul 17, 2012 at 08:10:14AM +0800, Fengguang Wu wrote:
> Hi David,
> 
> I don't know enough to tell whether this if false alarm. Would you
> help confirm it? Thank you.

Yes, I just changed the locking there.  I've checked it again and it's
correct; the kind of lock taken depends on which list the structure was
found on.
Thanks


> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/teigland/linux-dlm.git next
> head:   96006ea6d4eea73466e90ef353bf34e507724e77
> commit: c04fecb4d9f7753e0cbff7edd03ec68f8721cdce [1/6] dlm: use rsbtbl as resource directory
> 
> One new sparse warning is triggered (and there were no old warnings before patch):
> 
> + fs/dlm/lock.c:1049:9: sparse: context imbalance in 'dlm_master_lookup' - different lock contexts for basic block
> 
> vim +1049 fs/dlm/lock.c
>   1046			unlock_rsb(r);
>   1047			put_rsb(r);
>   1048		}
> > 1049		return 0;
>   1050	
>   1051	 not_found:
>   1052		error = get_rsb_struct(ls, name, len, &r);
> 
> ---
> 0-DAY kernel build testing backend         Open Source Technology Centre
> Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation
