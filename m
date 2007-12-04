From: David Miller <davem@davemloft.net>
Date: Tue, 04 Dec 2007 08:33:52 +0000
Subject: Re: [PATCH 2/3] arch/sparc: Add missing of_node_put
Message-Id: <20071204.003352.120654801.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0712022104110.3361@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0712022104110.3361@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: julia@diku.dk
Cc: wli@holomorphy.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>
Date: Sun, 2 Dec 2007 21:05:24 +0100 (CET)

> From: Julia Lawall <julia@diku.dk>
> 
> There should be an of_node_put when breaking out of a loop that iterates
> using for_each_node_by_type.
> 
> This was detected and fixed using the following semantic patch.
> (http://www.emn.fr/x-info/coccinelle/)
> 
> // <smpl>
> @@
> identifier d;
> type T;
> expression e;
> iterator for_each_node_by_type;
> @@
> 
> T *d;
> ...
> for_each_node_by_type(d,...)
>   {... when != of_node_put(d)
>        when != e = d
> (
>    return d;
> |
> +  of_node_put(d);
> ?  return ...;
> )
> ...}
> // </smpl>
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>

Applied, but I had to fixup the trailing whitespace on this line:

> -		if (!err)
> +		if (!err) {			 

As indicated by GIT:

Adds trailing whitespace.
diff:9:		if (!err) {			 
warning: 1 line adds whitespace errors.

Please correct these kinds of errors before submitting in
the future, thanks.
