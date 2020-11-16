From: "Andrew Jeffery" <andrew@aj.id.au>
Date: Mon, 16 Nov 2020 04:22:55 +0000
Subject: =?UTF-8?Q?Re:_[PATCH]_soc:_aspeed:_Fix_a_reference_leak_in_aspeed=5Fsoci?= =?UTF-8?Q?nfo=5Finit()?=
Message-Id: <07558590-438a-4347-820e-c117b19dac20@www.fastmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201113100850.GA168908@mwanda>
In-Reply-To: <20201113100850.GA168908@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Joel Stanley <joel@jms.id.au>
Cc: Tom Rix <trix@redhat.com>, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org



On Fri, 13 Nov 2020, at 20:38, Dan Carpenter wrote:
> This needs to call of_node_put(np) before returning if of_iomap() fails.
> 
> Fixes: e0218dca5787 ("soc: aspeed: Add soc info driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
