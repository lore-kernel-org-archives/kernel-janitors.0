From: Cyrill Gorcunov <gorcunov@openvz.org>
Date: Sun, 26 Aug 2012 19:26:20 +0000
Subject: Re: [vfs:master 30/32] fs/proc/fd.c:87:55: sparse: incorrect type in initializer (different base typ
Message-Id: <20120826192620.GD7428@moon>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120826191257.GC9107@localhost>
In-Reply-To: <20120826191257.GC9107@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Aug 27, 2012 at 03:12:57AM +0800, Fengguang Wu wrote:
> Hi Cyrill,
> 
> FYI, there are new sparse warnings show up in
> 
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git master
> head:   9283194882d18e3755c4ebc0b86db9f9a4f4c81a
> commit: c8506285ded8009f7c1ab937fc0021c6294ba424 [30/32] procfs: Move /proc/pid/fd[info] handling code to fd.[ch]
> 
> All sparse warnings:
> 
> + fs/proc/fd.c:87:55: sparse: incorrect type in initializer (different base types)
>   fs/proc/fd.c:87:55:    expected unsigned int [unsigned] f_mode
>   fs/proc/fd.c:87:55:    got restricted fmode_t [usertype] f_mode
> + fs/proc/fd.c:105:54: sparse: restricted fmode_t degrades to integer
>   fs/proc/fd.c:107:54: sparse: restricted fmode_t degrades to integer
> 
> vim +87 fs/proc/fd.c
>     84				rcu_read_lock();
>     85				file = fcheck_files(files, fd);
>     86				if (file) {
>   > 87					unsigned f_mode = file->f_mode;
>     88	
>     89					rcu_read_unlock();
>     90					put_files_struct(files);

Sigh. Thanks a lot, Fengguang! This routine has been moved from base.c
(which had this nit already). Al, could you please make it unsigned int,
and push fix intou your tree?

	Cyrill
