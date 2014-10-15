From: Stanislav Yakovlev <stas.yakovlev@gmail.com>
Date: Wed, 15 Oct 2014 20:51:07 +0000
Subject: Re: [patch 1/2] ipw2x00: remove unused ->ibss_dfs pointer
Message-Id: <CA++WF2NinL3_pGtqZxjr6p4BpHBkGRbBTXaXFNSdoxgzX_Lb=Q@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20141009095742.GA20875@mwanda>
In-Reply-To: <20141009095742.GA20875@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "John W. Linville" <linville@tuxdriver.com>, wireless <linux-wireless@vger.kernel.org>, kernel-janitors@vger.kernel.org

Hello Dan,

On 9 October 2014 02:57, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> The ->ibss_dfs pointer is always allocated with a user controlled
> length.  This caused a static checker warning because what if the length
> was zero?  In that case, any dereference of ->ibss_dfs would lead to an
> Oops.
>
> It turns out that this isn't a problem because the ->ibss_dfs pointer is
> never used.  This patch deletes it along with all the related code.  In
> particular the entire libipw_network_reset() function can be removed.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Looks fine, thanks.

Stanislav.
