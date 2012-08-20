From: ebiederm@xmission.com (Eric W. Biederman)
Date: Mon, 20 Aug 2012 07:37:00 +0000
Subject: Re: [userns:userns-always-map-user-v46 78/99] include/linux/proc_fs.h:233:13: error: 'proc_ns_inode'
Message-Id: <87boi6vwtf.fsf@xmission.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120819115031.GA20588@localhost>
In-Reply-To: <20120819115031.GA20588@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fengguang Wu <fengguang.wu@intel.com> writes:

> Hi Eric,
>
> FYI, kernel build failed on

I was definitely missing an inline, but did that really cause a build failure?

Does sh set -Werr across the entire kerenl?  That seems reckless.

Eric

> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ebiederm/user-namespace.git userns-always-map-user-v46
> head:   271556925ff7981a48391295134f3245cf815bb6
> commit: 148991415a3e6b6da4381ef2f7a896c3cce7b58a [78/99] vfs: Add setns support for the mount namespace
> config: sh-allnoconfig (attached as .config)
>
> All related error/warning messages:
>
> In file included from init/main.c:14:0:
> include/linux/proc_fs.h:233:13: warning: 'proc_ns_inode' defined but not used [-Wunused-function]
> --
> In file included from include/linux/sunrpc/stats.h:12:0,
>                  from include/linux/sunrpc/clnt.h:21,
>                  from include/linux/nfs_fs.h:57,
>                  from init/do_mounts.c:30:
> include/linux/proc_fs.h:233:13: warning: 'proc_ns_inode' defined but not used [-Wunused-function]
> --
> In file included from drivers/tty/tty_io.c:88:0:
> include/linux/proc_fs.h:233:13: warning: 'proc_ns_inode' defined but not used [-Wunused-function]
> ..
>
> vim +233 include/linux/proc_fs.h
>    230		return ERR_PTR(-EINVAL);
>    231	}
>    232	
>  > 233	static bool proc_ns_inode(struct inode *inode)
>                ^ missing inline
>    234	{
>    235		return false;
>    236	}
>
> ---
> 0-DAY kernel build testing backend         Open Source Technology Centre
> Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation
