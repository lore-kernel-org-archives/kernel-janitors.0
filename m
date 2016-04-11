From: Jiri Benc <jbenc@redhat.com>
Date: Mon, 11 Apr 2016 12:59:46 +0000
Subject: Re: vxlan: implement GPE
Message-Id: <20160411145946.0fc8f876@griffin>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160411072718.GA14676@mwanda>
In-Reply-To: <20160411072718.GA14676@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, 11 Apr 2016 10:27:18 +0300, Dan Carpenter wrote:
> Hello Jiri Benc,
> 
> The patch e1e5314de08b: "vxlan: implement GPE" from Apr 5, 2016,
> leads to the following static checker warning:
> 
> 	drivers/net/vxlan.c:1206 vxlan_parse_gpe_hdr()
> 	error: wrong number of bits for 'htons' (32 vs 16) left= '*protocol' *protocol = (())

Thanks a lot, Dan. It should be __be16. I don't know what I was
thinking. I'll submit a fix.

 Jiri
