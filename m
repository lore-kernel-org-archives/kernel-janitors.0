From: David Miller <davem@davemloft.net>
Date: Thu, 14 Feb 2019 06:13:43 +0000
Subject: Re: [PATCH 2/3 net-next] test_objagg: Test the correct variable
Message-Id: <20190213.221343.2173421181139173051.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190213085650.GB14113@kadam>
        <20190213085820.GC14113@kadam>
In-Reply-To: <20190213085820.GC14113@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: jiri@mellanox.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 13 Feb 2019 11:58:20 +0300

> There is a typo here.  We intended to check "objagg2" but we instead
> test "objagg" which is not an error pointer.
> 
> Fixes: 9069a3817d82 ("lib: objagg: implement optimization hints assembly and use hints for object creation")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
