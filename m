From: Jiri Kosina <jkosina@suse.cz>
Date: Fri, 03 Jan 2014 09:08:43 +0000
Subject: Re: [PATCH 6/25]  fix error return code
Message-Id: <alpine.LNX.2.00.1401031008360.14951@pobox.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1388357260-4843-1-git-send-email-Julia.Lawall@lip6.fr> <1388357260-4843-7-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1388357260-4843-7-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, 29 Dec 2013, Julia Lawall wrote:

> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> Set the return variable to an error code as done elsewhere in the function.
> 
> A simplified version of the semantic match that finds this problem is as
> follows: (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> (
> if@p1 (\(ret < 0\|ret != 0\))
>  { ... return ret; }
> |
> ret@p1 = 0
> )
> ... when != ret = e1
>     when != &ret
> *if(...)
> {
>   ... when != ret = e2
>       when forall
>  return ret;
> }
> 
> // </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs
