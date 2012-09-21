From: ebiederm@xmission.com (Eric W. Biederman)
Date: Fri, 21 Sep 2012 08:31:25 +0000
Subject: Re: [userns:userns-always-map-user-v58 86/150] fs/ncpfs/inode.c:335 ncp_show_options() warn: if();
Message-Id: <87y5k3rd42.fsf@xmission.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120921082232.GA5132@localhost>
In-Reply-To: <20120921082232.GA5132@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fengguang Wu <fengguang.wu@intel.com> writes:

> Hi Eric,
>
> FYI, there are new smatch warnings show up in
>
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ebiederm/user-namespace.git userns-always-map-user-v58
> head:   cf7198a6b74906aa363a8507d6f9cbdf56e42dc1
> commit: 84ec77ea8a96e568f20bec4465c1fbde2c066cf8 [86/150] userns: Convert ncpfs to use kuid and kgid where appropriate
>
> All smatch warnings:
>
> + fs/ncpfs/inode.c:335 ncp_show_options() warn: if();
>   fs/ncpfs/inode.c:654 ncp_fill_super() Error invalid range 4096 to -1

Good catch.  Thanks.

Did you just start running smatch tests?  I haven't looked at ncpfs for
a long time.

Eric



> vim +335 fs/ncpfs/inode.c
>    319			flush_work_sync(&server->tx.tq);
>    320		else
>    321			flush_work_sync(&server->timeout_tq);
>    322	}
>    323	
>    324	static int  ncp_show_options(struct seq_file *seq, struct dentry *root)
>    325	{
>    326		struct ncp_server *server = NCP_SBP(root->d_sb);
>    327		unsigned int tmp;
>    328	
>    329		if (!uid_eq(server->m.uid, GLOBAL_ROOT_UID))
>    330			seq_printf(seq, ",uid=%u",
>    331				   from_kuid_munged(&init_user_ns, server->m.uid));
>    332		if (!gid_eq(server->m.gid, GLOBAL_ROOT_GID))
>    333			seq_printf(seq, ",gid=%u",
>    334				   from_kgid_munged(&init_user_ns, server->m.gid));
>  > 335		if (!uid_eq(server->m.mounted_uid, GLOBAL_ROOT_UID));
>    336			seq_printf(seq, ",owner=%u",
>    337				   from_kuid_munged(&init_user_ns, server->m.mounted_uid));
>    338		tmp = server->m.file_mode & S_IALLUGO;
>    339		if (tmp != NCP_DEFAULT_FILE_MODE)
>    340			seq_printf(seq, ",mode=0%o", tmp);
>    341		tmp = server->m.dir_mode & S_IALLUGO;
>    342		if (tmp != NCP_DEFAULT_DIR_MODE)
>    343			seq_printf(seq, ",dirmode=0%o", tmp);
>
> ---
> 0-DAY kernel build testing backend         Open Source Technology Centre
> Fengguang Wu, Yuanhan Liu                              Intel Corporation
