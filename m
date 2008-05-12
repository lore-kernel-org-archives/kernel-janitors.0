From: Mark Fasheh <mfasheh@suse.com>
Date: Mon, 12 May 2008 21:50:00 +0000
Subject: Re: [PATCH 1/2] fs/ocfs2/cluster: compilation warning fix
Message-Id: <20080512215000.GC25156@wotan.suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200805111908.06046.lpotenza@inwind.it>
In-Reply-To: <200805111908.06046.lpotenza@inwind.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Leonardo Potenza <lpotenza@inwind.it>
Cc: kernel-janitors@vger.kernel.org, joel.becker@oracle.com, linux-kernel@vger.kernel.org

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

Ok, both of your patches look good for Ocfs2.git. Thanks.
	--Mark

--
Mark Fasheh
