From: "Madhani, Himanshu" <Himanshu.Madhani@cavium.com>
Date: Mon, 10 Sep 2018 17:49:38 +0000
Subject: Re: [PATCH] scsi: qla2xxx: Fix an endian bug in fcpcmd_is_corrupted()
Message-Id: <9B696B5E-9A5C-4E91-A5FD-1C56FED9AA82@cavium.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180908084227.xo4g5aekndokopus@kili.mountain>
In-Reply-To: <20180908084227.xo4g5aekndokopus@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


> On Sep 8, 2018, at 1:42 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> 
> External Email
> 
> We should first do the le16_to_cpu endian conversion and then apply
> the FCP_CMD_LENGTH_MASK mask.
> 
> Fixes: 5f35509db179 ("qla2xxx: Terminate exchange if corrupted")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> I just happened to spot this when I was reviewing something unrelated.
> I don't have the hardware to test it, so please review carefully.
> 
> diff --git a/drivers/scsi/qla2xxx/qla_target.h b/drivers/scsi/qla2xxx/qla_target.h
> index fecf96f0225c..199d3ba1916d 100644
> --- a/drivers/scsi/qla2xxx/qla_target.h
> +++ b/drivers/scsi/qla2xxx/qla_target.h
> @@ -374,8 +374,8 @@ struct atio_from_isp {
> static inline int fcpcmd_is_corrupted(struct atio *atio)
> {
>        if (atio->entry_type == ATIO_TYPE7 &&
> -           (le16_to_cpu(atio->attr_n_length & FCP_CMD_LENGTH_MASK) <
> -           FCP_CMD_LENGTH_MIN))
> +           ((le16_to_cpu(atio->attr_n_length) & FCP_CMD_LENGTH_MASK) <
> +            FCP_CMD_LENGTH_MIN))
>                return 1;
>        else
>                return 0;

Acked-By: Himanshu Madhani <himanshu.madhani@cavium.com>

Thanks,
- Himanshu
