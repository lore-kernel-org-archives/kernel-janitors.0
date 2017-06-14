From: Amir Vadai <amir@vadai.me>
Date: Wed, 14 Jun 2017 13:20:42 +0000
Subject: Re: [PATCH net] net/act_pedit: fix an error code
Message-Id: <20170614131846.GA2955@office.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170614102930.GH29394@elgon.mountain>
In-Reply-To: <20170614102930.GH29394@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jamal Hadi Salim <jhs@mojatatu.com>, Cong Wang <xiyou.wangcong@gmail.com>, Jiri Pirko <jiri@resnulli.us>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Jun 14, 2017 at 01:29:31PM +0300, Dan Carpenter wrote:
> I'm reviewing static checker warnings where we do ERR_PTR(0), which is
> the same as NULL.  I'm pretty sure we intended to return ERR_PTR(-EINVAL)
> here.  Sometimes these bugs lead to a NULL dereference but I don't
> immediately see that problem here.
> 
> Fixes: 71d0ed7079df ("net/act_pedit: Support using offset relative to the conventional network headers")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
You are right, it was intended to be -EINVAL. Thanks.

Acked-by: Amir Vadai <amir@vadai.me>
