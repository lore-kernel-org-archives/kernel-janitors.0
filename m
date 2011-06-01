From: Joel Becker <jlbec@evilplan.org>
Date: Wed, 01 Jun 2011 02:24:06 +0000
Subject: Re: [patch] ocfs2: null deref on allocation error
Message-Id: <20110601022405.GC29741@noexit.corp.google.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110529195716.GD3099@shale.localdomain>
In-Reply-To: <20110529195716.GD3099@shale.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ocfs2-devel@oss.oracle.com

On Sun, May 29, 2011 at 10:57:16PM +0300, Dan Carpenter wrote:
> The original code had a null derefence in the error handling.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

This patch is now in the 'fixes' branch of ocfs2.git.

Joel


-- 

"The trouble with being punctual is that nobody's there to
 appreciate it."
	- Franklin P. Jones

			http://www.jlbec.org/
			jlbec@evilplan.org
