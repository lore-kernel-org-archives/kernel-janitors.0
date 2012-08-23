From: ebiederm@xmission.com (Eric W. Biederman)
Date: Thu, 23 Aug 2012 07:34:53 +0000
Subject: Re: [userns:userns-always-map-user-v47 38/148] xattr.c:(.text+0x1fb99): undefined reference to `posi
Message-Id: <87obm2m57m.fsf@xmission.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120823030003.GA5629@localhost>
In-Reply-To: <20120823030003.GA5629@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fengguang Wu <fengguang.wu@intel.com> writes:

> Hi Eric,
>
> FYI, kernel build failed on
>
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ebiederm/user-namespace.git userns-always-map-user-v47
> head:   ec9c45ed97cdb9e75f8ef22ea86999be29591713
> commit: 0067dd0c6d8d6b9a89cdaab4e5259dcc8ef45e34 [38/148] userns: Convert vfs posix_acl support to use kuid and kgid where appripriate.
> config: i386-randconfig-k786 (attached as .config)
>
> All related error/warning messages:
>
> fs/built-in.o: In function `getxattr':
> xattr.c:(.text+0x1fb99): undefined reference to `posix_acl_fix_xattr_to_user'
> fs/built-in.o: In function `setxattr':
> xattr.c:(.text+0x1ff2b): undefined reference to
> `posix_acl_fix_xattr_from_user'

Thanks I hadn't realized you could enable xattr support and disable
posix acl support.

Eric
