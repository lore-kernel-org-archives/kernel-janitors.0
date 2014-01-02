From: Jiri Kosina <jkosina@suse.cz>
Date: Thu, 02 Jan 2014 12:51:10 +0000
Subject: Re: [PATCH 12/25] HID: sony: fix error return code
Message-Id: <alpine.LNX.2.00.1401021351000.14951@pobox.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1388357260-4843-1-git-send-email-Julia.Lawall@lip6.fr> <1388357260-4843-13-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1388357260-4843-13-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, 29 Dec 2013, Julia Lawall wrote:

> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> Currently the return variable ret is always 0.  Set it to other values in
> error cases, as used in the direct return.
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
