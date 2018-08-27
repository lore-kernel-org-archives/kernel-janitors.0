From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Mon, 27 Aug 2018 17:02:11 +0000
Subject: Re: [PATCH] scsi: aacraid: fix a signednes bug
Message-Id: <yq1r2ij68vg.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180827092301.xtbunhvpl3ht2mjx@kili.mountain>
In-Reply-To: <20180827092301.xtbunhvpl3ht2mjx@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Dan,

> The problem is that ->reset_state is a u8 but it can be set to -1 or
> -2 in aac_tmf_callback() and the error handling in
> aac_eh_target_reset() relies on it to be signed.

Applied to 4.19/scsi-fixes, thank you!

-- 
Martin K. Petersen	Oracle Linux Engineering
