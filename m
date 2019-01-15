From: David Miller <davem@davemloft.net>
Date: Tue, 15 Jan 2019 21:45:35 +0000
Subject: Re: [PATCH net] selftests/txtimestamp: Fix an equals vs assign bug
Message-Id: <20190115.134535.1816196657240429744.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190109105007.GA14518@kadam>
In-Reply-To: <20190109105007.GA14518@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 9 Jan 2019 13:50:07 +0300

> This should be = instead of =.
> 
> Fixes: b52354aa068e ("selftests: expand txtimestamp with ipv6 dgram + raw and pf_packet")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
