From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 28 Nov 2016 13:24:45 +0000
Subject: Re: [PATCH] bnx2fc: shift wrapping bug in bnx2fc_process_unsol_compl()
Message-Id: <20161128132137.GR6266@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161126183629.9969-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20161126183629.9969-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: QLogic-Storage-Upstream@qlogic.com, jejb@linux.vnet.ibm.com, martin.petersen@oracle.com, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, Nov 26, 2016 at 07:36:29PM +0100, Christophe JAILLET wrote:
> BNX2FC_NUM_ERR_BITS is 63. err_warn_bit_map is a u64. So, to make sure that
> no shift wrapping will occur, we need need additionnal casting.
> 
> The same test is already done a few lines above and '(u64)1' is already
> used there. So just do the same here.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> I guess that this could also be written with a '1ULL << i' which would be
> cleaner and less verbose IMHO, but apparently this driver does not use
> such things yet. So keep the current style with casting.

Ugh...  No.  This is not code to emulate.  Use 1ULL << i.  Even if we
did the cast, you would only need one:

			if (err_warn_bit_map & ((u64)1 << i)) {


regards,
dan carpenter

