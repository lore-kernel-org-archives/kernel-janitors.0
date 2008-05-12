From: Joel Becker <Joel.Becker@oracle.com>
Date: Mon, 12 May 2008 21:54:22 +0000
Subject: Re: [PATCH 1/2] fs/ocfs2/cluster: compilation warning fix
Message-Id: <20080512215422.GG12100@mail.oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200805111908.06046.lpotenza@inwind.it>
In-Reply-To: <200805111908.06046.lpotenza@inwind.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Leonardo Potenza <lpotenza@inwind.it>
Cc: kernel-janitors@vger.kernel.org, mfasheh@suse.com, linux-kernel@vger.kernel.org, sunil.mushran@oracle.com

On Sun, May 11, 2008 at 07:08:05PM +0200, Leonardo Potenza wrote:
> From: Leonardo Potenza <lpotenza@inwind.it>
> 
> Removed the warning messages:
> fs/ocfs2/cluster/tcp.h:132: warning: 'o2net_debugfs_init' defined but not used
> fs/ocfs2/cluster/tcp.h:136: warning: 'o2net_debugfs_exit' defined but not used
> fs/ocfs2/cluster/tcp.h:139: warning: 'o2net_debug_add_nst' defined but not used
> fs/ocfs2/cluster/tcp.h:142: warning: 'o2net_debug_del_nst' defined but not used
> fs/ocfs2/cluster/tcp.h:145: warning: 'o2net_debug_add_sc' defined but not used
> fs/ocfs2/cluster/tcp.h:148: warning: 'o2net_debug_del_sc' defined but not used
> 
> If not in debug build (CONFIG_DEBUG_FS), the definition of those functions
> has been moved from 'tcp.h' to 'netdebug.c'.

	They should stay in tcp.h but be static inline.  That's the
problem.

Joel

-- 

"Too much walking shoes worn thin.
 Too much trippin' and my soul's worn thin.
 Time to catch a ride it leaves today
 Her name is what it means.
 Too much walking shoes worn thin."

Joel Becker
Principal Software Developer
Oracle
E-mail: joel.becker@oracle.com
Phone: (650) 506-8127
