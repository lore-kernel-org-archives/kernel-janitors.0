From: Jiri Pirko <jiri@resnulli.us>
Date: Wed, 13 Feb 2019 13:16:00 +0000
Subject: Re: [PATCH 2/3 net-next] test_objagg: Test the correct variable
Message-Id: <20190213131600.GC2186@nanopsycho>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190213085650.GB14113@kadam>
 <20190213085820.GC14113@kadam>
In-Reply-To: <20190213085820.GC14113@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jiri Pirko <jiri@mellanox.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Wed, Feb 13, 2019 at 09:58:20AM CET, dan.carpenter@oracle.com wrote:
>There is a typo here.  We intended to check "objagg2" but we instead
>test "objagg" which is not an error pointer.
>
>Fixes: 9069a3817d82 ("lib: objagg: implement optimization hints assembly and use hints for object creation")
>Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Jiri Pirko <jiri@mellanox.com>

Thanks.
