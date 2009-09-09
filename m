From: Avi Kivity <avi@redhat.com>
Date: Wed, 09 Sep 2009 14:42:19 +0000
Subject: Re: [PATCH 3/9] virt/kvm: correct error-handling code
Message-Id: <4AA7BECB.2090903@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0907281752560.28189@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0907281752560.28189@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 07/28/2009 06:53 PM, Julia Lawall wrote:
> From: Julia Lawall<julia@diku.dk>
>
> This code is not executed before file has been initialized to the result of
> calling eventfd_fget.  This function returns an ERR_PTR value in an error
> case instead of NULL.  Thus the test that file is not NULL is always true.
>
> A simplified version of the semantic match that finds this problem is as
> follows: (http://coccinelle.lip6.fr/)
>
> //<smpl>
> @match exists@
> expression x, E;
> statement S1, S2;
> @@
>
> x = eventfd_fget(...)
> ... when != x = E
> (
> *  if (x = NULL || ...) S1 else S2
> |
> *  if (x = NULL&&  ...) S1 else S2
> )
> //</smpl>
>
>    

Applied, thanks (yes, old patch, missed it).

-- 
error compiling committee.c: too many arguments to function

