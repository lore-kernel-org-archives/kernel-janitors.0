From: KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>
Date: Mon, 12 Jul 2010 00:23:38 +0000
Subject: Re: [patch] cgroups: save space for the terminator
Message-Id: <20100712092338.1be8ebf7.kamezawa.hiroyu@jp.fujitsu.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100710105429.GW19184@bicker>
In-Reply-To: <20100710105429.GW19184@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Paul Menage <menage@google.com>, Li Zefan <lizf@cn.fujitsu.com>, Andrew Morton <akpm@linux-foundation.org>, Ben Blum <bblum@andrew.cmu.edu>, containers@lists.linux-foundation.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, 10 Jul 2010 12:54:29 +0200
Dan Carpenter <error27@gmail.com> wrote:

> The original code didn't leave enough space for a NULL terminator.
> These strings are copied with strcpy() into fixed length buffers in
> cgroup_root_from_opts().
>  
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> 

Nice!,
Reviewd-by: KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>

