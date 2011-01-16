From: David Miller <davem@davemloft.net>
Date: Sun, 16 Jan 2011 04:52:08 +0000
Subject: Re: [patch] 9p: fix min_t() casting
Message-Id: <20110115.205208.104051310.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110115203539.GF2721@bicker>
In-Reply-To: <20110115203539.GF2721@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: error27@gmail.com
Cc: ericvh@gmail.com, sripathik@in.ibm.com, jvrao@linux.vnet.ibm.com, aneesh.kumar@linux.vnet.ibm.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <error27@gmail.com>
Date: Sat, 15 Jan 2011 23:35:39 +0300

> The intent here was to cap the length to USHRT_MAX, but what the
> code actually does is it just casts the return from strlen() to
> unsigned short and truncates the significant bits away.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

If you want me to apply this, it doesn't apply cleanly to net-2.6
at all.
