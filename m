From: Bryan Schumaker <bjschuma@netapp.com>
Date: Tue, 17 Jul 2012 18:40:19 +0000
Subject: Re: [nfs:nfs-for-bryan 86/99] WARNING: fs/built-in.o(.init.text+0x309d): Section mismatch in referen
Message-Id: <5005B193.5050306@netapp.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120717183641.GA6987@localhost>
In-Reply-To: <20120717183641.GA6987@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fengguang Wu <fengguang.wu@intel.com>
Cc: kernel-janitors@vger.kernel.org, Trond Myklebust <Trond.Myklebust@netapp.com>, Linux-NFS <linux-nfs@vger.kernel.org>

Thanks for catching these!  I was just looking over these patches again, so I'll fix this up while I'm at it.

- Bryan

On 07/17/2012 02:36 PM, Fengguang Wu wrote:
> Hi Bryan,
> 
> There are new compile warnings show up in
> 
> tree:   git://git.linux-nfs.org/projects/trondmy/linux-nfs.git nfs-for-bryan
> head:   98ff07b7c3bb45b3c5f9fde8231277d45500c2ba
> commit: 129d1977ed39cbb4f091a518e4a12498c04f45ba [86/99] NFS: Create an init_nfs_v4() function
> config: x86_64-allyesdebian (attached as .config)
> 
> All warnings:
> 
> 
> WARNING: fs/built-in.o(.init.text+0x309d): Section mismatch in reference from the function init_nfs_fs() to the function .exit.text:exit_nfs_v4()
> The function __init init_nfs_fs() references
> a function __exit exit_nfs_v4().
> This is often seen when error handling in the init function
> uses functionality in the exit path.
> The fix is often to remove the __exit annotation of
> exit_nfs_v4() so it may be used outside an exit section.
> 
> WARNING: fs/nfs/nfs.o(.init.text+0x17d): Section mismatch in reference from the function init_nfs_fs() to the function .exit.text:exit_nfs_v4()
> The function __init init_nfs_fs() references
> a function __exit exit_nfs_v4().
> This is often seen when error handling in the init function
> uses functionality in the exit path.
> The fix is often to remove the __exit annotation of
> exit_nfs_v4() so it may be used outside an exit section.
> 
> WARNING: fs/nfs/built-in.o(.init.text+0x17d): Section mismatch in reference from the function init_nfs_fs() to the function .exit.text:exit_nfs_v4()
> The function __init init_nfs_fs() references
> a function __exit exit_nfs_v4().
> This is often seen when error handling in the init function
> uses functionality in the exit path.
> The fix is often to remove the __exit annotation of
> exit_nfs_v4() so it may be used outside an exit section.
> 
> WARNING: vmlinux.o(.init.text+0x27f81): Section mismatch in reference from the function init_nfs_fs() to the function .exit.text:exit_nfs_v4()
> The function __init init_nfs_fs() references
> a function __exit exit_nfs_v4().
> This is often seen when error handling in the init function
> uses functionality in the exit path.
> The fix is often to remove the __exit annotation of
> exit_nfs_v4() so it may be used outside an exit section.
> 
> ---
> 0-DAY kernel build testing backend         Open Source Technology Centre
> Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation
> 


