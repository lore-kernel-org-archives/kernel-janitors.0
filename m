From: Mark Fasheh <mark.fasheh@oracle.com>
Date: Mon, 18 Feb 2008 20:14:53 +0000
Subject: Re: [PATCH 3/7] fs/ocfs2: Use BUG_ON
Message-Id: <20080218201453.GA22671@ca-server1.us.oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0802171855070.28055@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0802171855070.28055@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: kurt.hackel@oracle.com, ocfs2-devel@oss.oracle.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun, Feb 17, 2008 at 06:55:49PM +0100, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> if (...) BUG(); should be replaced with BUG_ON(...) when the test has no
> side-effects to allow a definition of BUG_ON that drops the code completely.
> 
> The semantic patch that makes this change is as follows:
> (http://www.emn.fr/x-info/coccinelle/)
> 
> // <smpl>
> @ disable unlikely @ expression E,f; @@
> 
> (
>   if (<... f(...) ...>) { BUG(); }
> |
> - if (unlikely(E)) { BUG(); }
> + BUG_ON(E);
> )
> 
> @@ expression E,f; @@
> 
> (
>   if (<... f(...) ...>) { BUG(); }
> |
> - if (E) { BUG(); }
> + BUG_ON(E);
> )
> // </smpl>
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>
Acked-by: Mark Fasheh <mark.fasheh@oracle.com>

--
Mark Fasheh
Principal Software Developer, Oracle
mark.fasheh@oracle.com
