From: Chuck Lever <chuck.lever@oracle.com>
Date: Wed, 25 Mar 2020 14:52:44 +0000
Subject: Re: [PATCH 2/2] SUNRPC: Optimize 'svc_print_xprts()'
Message-Id: <EA5BCDB2-DB05-4B26-8635-E6F5C231DDC6@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200325070452.22043-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200325070452.22043-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: trond.myklebust@hammerspace.com, Anna Schumaker <anna.schumaker@netapp.com>, Bruce Fields <bfields@fieldses.org>, davem@davemloft.net, kuba@kernel.org, gnb@sgi.com, Neil Brown <neilb@suse.de>, Tom Tucker <tom@opengridcomputing.com>, Linux NFS Mailing List <linux-nfs@vger.kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Christophe,


> On Mar 25, 2020, at 3:04 AM, Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:
> 
> Using 'snprintf' is safer than 'sprintf' because it can avoid a buffer
> overflow.

That's true as a general statement, but how likely is such an
overflow to occur here?


> The return value can also be used to avoid a strlen a call.

That's also true of sprintf, isn't it?


> Finally, we know where we need to copy and the length to copy, so, we
> can save a few cycles by rearraging the code and using a memcpy instead of
> a strcat.

I would be OK with squashing these two patches together. I don't
see the need to keep the two changes separated.


> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> This patch should have no functionnal change.
> We could go further, use scnprintf and write directly in the destination
> buffer. However, this could lead to a truncated last line.

That's exactly what this function is trying to avoid. As part of any
change in this area, it would be good to replace the current block
comment before this function with a Doxygen-format comment that
documents that goal.


> ---
> net/sunrpc/svc_xprt.c | 8 ++++----
> 1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/net/sunrpc/svc_xprt.c b/net/sunrpc/svc_xprt.c
> index df39e7b8b06c..6df861650040 100644
> --- a/net/sunrpc/svc_xprt.c
> +++ b/net/sunrpc/svc_xprt.c
> @@ -118,12 +118,12 @@ int svc_print_xprts(char *buf, int maxlen)
> 	list_for_each_entry(xcl, &svc_xprt_class_list, xcl_list) {
> 		int slen;
> 
> -		sprintf(tmpstr, "%s %d\n", xcl->xcl_name, xcl->xcl_max_payload);
> -		slen = strlen(tmpstr);
> -		if (len + slen >= maxlen)
> +		slen = snprintf(tmpstr, sizeof(tmpstr), "%s %d\n",
> +				xcl->xcl_name, xcl->xcl_max_payload);
> +		if (slen >= sizeof(tmpstr) || len + slen >= maxlen)
> 			break;
> +		memcpy(buf + len, tmpstr, slen + 1);
> 		len += slen;
> -		strcat(buf, tmpstr);

IMO replacing the strcat makes the code harder to read, and this
is certainly not a performance path. Can you drop that part of the
patch?


> 	}
> 	spin_unlock(&svc_xprt_class_lock);
> 
> -- 
> 2.20.1
> 

--
Chuck Lever
