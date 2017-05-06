From: Michael Chan <michael.chan@broadcom.com>
Date: Sat, 06 May 2017 01:04:48 +0000
Subject: Re: [PATCH net] bnxt_en: allocate enough space for ->ntp_fltr_bmap
Message-Id: <CACKFLin+_b2wVk_8Jvy7znR4Ny8QqOwz=A=wE8BvtZ-47FmUNA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170506004901.ruf3g47szijai4yk@mwanda>
In-Reply-To: <20170506004901.ruf3g47szijai4yk@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Netdev <netdev@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Fri, May 5, 2017 at 5:49 PM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> We have the number of longs, but we need to calculate the number of
> bytes required.
>
> Fixes: c0c050c58d84 ("bnxt_en: New Broadcom ethernet driver.")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Michael Chan <michael.chan@broadcom.com>

David, please send this to -stable as well.  Thanks.
