From: Stefan Richter <stefanr@s5r6.in-berlin.de>
Date: Sat, 02 Aug 2008 18:16:13 +0000
Subject: Re: [PATCH 3/10] drivers/ieee1394: Use DIV_ROUND_UP
Message-Id: <4894A46D.10607@s5r6.in-berlin.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0808021712460.20095@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0808021712460.20095@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: ben.collins@ubuntu.com, linux1394-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Julia Lawall wrote:
> -#define bytes_to_quads(_b) (((_b) + sizeof(u32) - 1) / sizeof(u32))
> +#define bytes_to_quads(_b) DIV_ROUND_UP(_b, sizeof(u32))
...
> -	return (dg_size + adj_max_payload - 1) / adj_max_payload;
> +	return DIV_ROUND_UP(dg_size, adj_max_payload);

I cut the changelog down to the necessary and committed it to 
linux1394-2.6.git.  Thanks,
-- 
Stefan Richter
-===-=--- =--- ---=-
http://arcgraph.de/sr/
