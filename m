From: Joel Becker <Joel.Becker@oracle.com>
Date: Fri, 23 Apr 2010 21:45:05 +0000
Subject: Re: [patch] ocfs2: potential ERR_PTR dereference on error paths
Message-Id: <20100423214505.GB8330@mail.oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100422093929.GK29647@bicker>
In-Reply-To: <20100422093929.GK29647@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ocfs2-devel@oss.oracle.com

On Thu, Apr 22, 2010 at 11:39:29AM +0200, Dan Carpenter wrote:
> If "handle" is non null at the end of the function then we assume it's a
> valid pointer and pass it to ocfs2_commit_trans();
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

	This patch is now in the 'fixes' branch of ocfs2.git.

Joel

-- 

"And yet I fight,
 And yet I fight this battle all alone.
 No one to cry to;
 No place to call home."

Joel Becker
Principal Software Developer
Oracle
E-mail: joel.becker@oracle.com
Phone: (650) 506-8127
