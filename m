From: Jiri Pirko <jiri@resnulli.us>
Date: Wed, 13 Feb 2019 13:15:42 +0000
Subject: Re: [PATCH 1/3 net-next] lib: objagg: Fix an error code in objagg_hints_get()
Message-Id: <20190213131542.GB2186@nanopsycho>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190213085650.GB14113@kadam>
In-Reply-To: <20190213085650.GB14113@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jiri Pirko <jiri@mellanox.com>, netdev@vger.kernel.org, Ido Schimmel <idosch@mellanox.com>, kernel-janitors@vger.kernel.org

Wed, Feb 13, 2019 at 09:56:50AM CET, dan.carpenter@oracle.com wrote:
>We need to set the error code on this path otherwise we return
>ERR_PTR(0) which would result in a NULL dereference in the caller.
>
>Fixes: 9069a3817d82 ("lib: objagg: implement optimization hints assembly and use hints for object creation")
>Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

I have the same patch in my queue.

Acked-by: Jiri Pirko <jiri@mellanox.com>
