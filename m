From: David Miller <davem@davemloft.net>
Date: Thu, 14 Feb 2019 06:13:48 +0000
Subject: Re: [PATCH 3/3 net-next] test_objagg: Uninitialized variable in error handling
Message-Id: <20190213.221348.256498581984900019.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190213085650.GB14113@kadam>
        <20190213085931.GD14113@kadam>
In-Reply-To: <20190213085931.GD14113@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: jiri@mellanox.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 13 Feb 2019 11:59:31 +0300

> We need to set the error message on this path otherwise some of the
> callers, such as test_hints_case(), print from an uninitialized pointer.
> 
> We had a similar bug earlier and set "errmsg" to NULL in the caller,
> test_delta_action_item().  That code is no longer required so I have
> removed it.
> 
> Fixes: 9069a3817d82 ("lib: objagg: implement optimization hints assembly and use hints for object creation")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
