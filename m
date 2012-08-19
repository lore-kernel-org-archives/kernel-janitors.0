From: Al Viro <viro@ZenIV.linux.org.uk>
Date: Sun, 19 Aug 2012 17:50:13 +0000
Subject: Re: [vfs:master 18/24] fs/open.c:1011:2: error: implicit declaration of function '__put_unused_fd'
Message-Id: <20120819175013.GD23464@ZenIV.linux.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5031211c.++F68pYIBlY8vRjF%fengguang.wu@intel.com>
In-Reply-To: <5031211c.++F68pYIBlY8vRjF%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Aug 20, 2012 at 01:23:40AM +0800, Fengguang Wu wrote:
> Hi Al,
> 
> FYI, kernel build failed on
> 
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git master
> head:   6ecc22edff41e8a76c7eecd43a0ff62f24059349
> commit: 3b9a69947c3a296240131d67c9e9f5f24edb8538 [18/24] move put_unused_fd() and fd_install() to fs/file.c
> config: i386-randconfig-k750 (attached as .config)

Resplit/reorder damage...  Note that the next commit is already OK.
Braino fixed and pushed...
