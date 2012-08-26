From: Al Viro <viro@ZenIV.linux.org.uk>
Date: Sun, 26 Aug 2012 20:20:49 +0000
Subject: Re: [vfs:master 30/32] fs/proc/fd.c:87:55: sparse: incorrect type in initializer (different base typ
Message-Id: <20120826202049.GA23464@ZenIV.linux.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120826191257.GC9107@localhost>
In-Reply-To: <20120826191257.GC9107@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, Aug 26, 2012 at 11:52:36PM +0400, Cyrill Gorcunov wrote:
> -				unsigned f_mode = file->f_mode;
> +				unsigned int f_mode = file->f_mode;

This changes nothing; unsigned and unsigned int are exactly the same.
fmode_t isn't, from sparse POV, and that's what you want to use here.
