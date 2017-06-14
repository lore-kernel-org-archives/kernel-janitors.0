From: David Miller <davem@davemloft.net>
Date: Wed, 14 Jun 2017 19:31:17 +0000
Subject: Re: [PATCH net] net/act_pedit: fix an error code
Message-Id: <20170614.153117.2206133089943602575.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170614102930.GH29394@elgon.mountain>
In-Reply-To: <20170614102930.GH29394@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: jhs@mojatatu.com, amir@vadai.me, xiyou.wangcong@gmail.com, jiri@resnulli.us, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 14 Jun 2017 13:29:31 +0300

> I'm reviewing static checker warnings where we do ERR_PTR(0), which is
> the same as NULL.  I'm pretty sure we intended to return ERR_PTR(-EINVAL)
> here.  Sometimes these bugs lead to a NULL dereference but I don't
> immediately see that problem here.
> 
> Fixes: 71d0ed7079df ("net/act_pedit: Support using offset relative to the conventional network headers")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
