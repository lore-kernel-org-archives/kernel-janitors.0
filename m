From: Al Viro <viro@ZenIV.linux.org.uk>
Date: Wed, 22 Aug 2012 15:34:33 +0000
Subject: Re: [vfs:for-next 10/15] ERROR: "alloc_fd" [fs/autofs4/autofs4.ko] undefined!
Message-Id: <20120822153432.GO23464@ZenIV.linux.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120822152032.GA31020@localhost>
In-Reply-To: <20120822152032.GA31020@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Aug 22, 2012 at 11:20:32PM +0800, Fengguang Wu wrote:
> Hi Al,
> 
> FYI, kernel build failed on
> 
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git for-next
> head:   39deef7d31321f6694c3f495556fee1ed98320c8
> commit: 860f1ca09512287227cc1bbefb1a71c2975af510 [10/15] autofs4: don't open-code fd_install()
> config: i386-randconfig-k780 (attached as .config)
> 
> Build errors:
> 
> ERROR: "alloc_fd" [fs/autofs4/autofs4.ko] undefined!

Grr...  cherry-pick missing prereq commit ;-/  Will fix...
