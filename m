From: Michael Chan <michael.chan@broadcom.com>
Date: Wed, 06 Dec 2017 19:16:55 +0000
Subject: Re: [PATCH] bnxt_en: Uninitialized variable in bnxt_tc_parse_actions()
Message-Id: <CACKFLinE9vWuooML4RhZHN0Xo2yr4cB90hEwizdEP3U6DLaoFA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171205143752.cymsw7fzlqn6ejeq@mwanda>
In-Reply-To: <20171205143752.cymsw7fzlqn6ejeq@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Sathya Perla <sathya.perla@broadcom.com>, Netdev <netdev@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Tue, Dec 5, 2017 at 6:37 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> Smatch warns that:
>
>     drivers/net/ethernet/broadcom/bnxt/bnxt_tc.c:160 bnxt_tc_parse_actions()
>     error: uninitialized symbol 'rc'.
>
> "rc" is either uninitialized or set to zero here so we can just remove
> the check.
>
> Fixes: 8c95f773b4a3 ("bnxt_en: add support for Flower based vxlan encap/decap offload")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks.

Acked-by: Michael Chan <michael.chan@broadcom.com>
