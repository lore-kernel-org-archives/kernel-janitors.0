From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 12 Mar 2019 11:12:57 +0000
Subject: Re: [PATCH] Minor fix for comment section
Message-Id: <20190312111257.GI2434@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190312092509.GA10303@machine1>
In-Reply-To: <20190312092509.GA10303@machine1>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Mar 12, 2019 at 02:55:09PM +0530, Milan P. Gandhi wrote:
> Corrected a small alignment issue with comment.
> 
> Signed-off-by: Milan P. Gandhi <mgandhi@redhat.com>

Hi Milan,

This patch is basically fine, but there are a few people missing from
the CC list.

./scripts/get_maintainer.pl -f drivers/scsi/qla2xxx/qla_bsg.c

The subject needs to be updated as well because it doesn't have the
subsystem prefix.  Use git log --oneline drivers/scsi/qla2xxx/qla_bsg.c
to see what people are using as the prefix for that file.

Update those two issues, and resend.

regards,
dan carpenter
