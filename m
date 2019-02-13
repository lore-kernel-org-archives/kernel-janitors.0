From: Jiri Pirko <jiri@resnulli.us>
Date: Wed, 13 Feb 2019 13:16:47 +0000
Subject: Re: [PATCH 3/3 net-next] test_objagg: Uninitialized variable in error handling
Message-Id: <20190213131647.GD2186@nanopsycho>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190213085650.GB14113@kadam>
 <20190213085931.GD14113@kadam>
In-Reply-To: <20190213085931.GD14113@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jiri Pirko <jiri@mellanox.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Wed, Feb 13, 2019 at 09:59:31AM CET, dan.carpenter@oracle.com wrote:
>We need to set the error message on this path otherwise some of the
>callers, such as test_hints_case(), print from an uninitialized pointer.
>
>We had a similar bug earlier and set "errmsg" to NULL in the caller,
>test_delta_action_item().  That code is no longer required so I have
>removed it.
>
>Fixes: 9069a3817d82 ("lib: objagg: implement optimization hints assembly and use hints for object creation")
>Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Jiri Pirko <jiri@mellanox.com>
