From: "Nicholas A. Bellinger" <nab@linux-iscsi.org>
Date: Sun, 18 Mar 2012 00:59:24 +0000
Subject: Re: [patch] target: remove improper externs
Message-Id: <1332032364.10203.289.camel@haakon2.linux-iscsi.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120317131152.GA23316@elgon.mountain>
In-Reply-To: <20120317131152.GA23316@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Christoph Hellwig <hch@lst.de>, Andy Grover <agrover@redhat.com>, Joern Engel <joern@logfs.org>, Roland Dreier <roland@kernel.org>, linux-scsi@vger.kernel.org, target-devel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, 2012-03-17 at 16:11 +0300, Dan Carpenter wrote:
> These externs aren't needed and Sparse complains about them.
> 
> drivers/target/iscsi/iscsi_target_nodeattrib.c:52:12: warning:
> 	function 'iscsit_na_dataout_timeout' with external linkage has
> 	definition
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 

Applied.  Thanks Dan!

--nab

