From: Jesper Nilsson <jesper.nilsson@axis.com>
Date: Wed, 08 Apr 2009 12:35:37 +0000
Subject: Re: [PATCH 08/56] cris: Remove void casts
Message-Id: <20090408123537.GI8115@axis.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1239189748-11703-1-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-2-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-3-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-4-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-5-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-6-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-7-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-8-git-send-email-jwjstone@fastmail.fm> <1239189748-11703-9-git-send-email-jwjstone@fastmail.fm>
In-Reply-To: <1239189748-11703-9-git-send-email-jwjstone@fastmail.fm>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jack Stone <jwjstone@fastmail.fm>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "jeff@garzik.org" <jeff@garzik.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Wed, Apr 08, 2009 at 01:21:40PM +0200, Jack Stone wrote:
> Remove uneeded void casts
>
> Signed-Off-By: Jack Stone <jwjstone@fastmail.fm>


Thanks, I'm adding the following patch to the CRIS tree:


From: Jack Stone <jwjstone@fastmail.fm>

Remove uneeded void casts

Signed-off-by: Jack Stone <jwjstone@fastmail.fm>
Signed-off-by: Jesper Nilsson <jesper.nilsson@axis.com>

--
 cryptocop.c |   14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/arch/cris/arch-v32/drivers/cryptocop.c b/arch/cris/arch-v32/drivers/cryptocop.c
index 67c61ea..beb914d 100644
--- a/arch/cris/arch-v32/drivers/cryptocop.c
+++ b/arch/cris/arch-v32/drivers/cryptocop.c
@@ -2455,7 +2455,8 @@ static int map_pages_to_iovec(struct iovec *iov, int iovlen, int *iovix, struct
 			DEBUG_API(printk("map_page_to_iovec: *pageix=%d >= nopages=%d\n", *pageix, nopages));
 			return 0;
 		}
-		iov[*iovix].iov_base = (unsigned char*)page_address(pages[*pageix]) + *pageoffset;
+		iov[*iovix].iov_base +			page_address(pages[*pageix]) + *pageoffset;
 		tmplen = PAGE_SIZE - *pageoffset;
 		if (tmplen < map_length){
 			(*pageoffset) = 0;
@@ -2780,16 +2781,21 @@ static int cryptocop_ioctl_process(struct inode *inode, struct file *filp, unsig
 		size_t tmplen = cop->tfrm_op.inlen;
 
 		cop->tfrm_op.indata[0].iov_len = PAGE_SIZE - ((unsigned long int)(oper.indata + prev_ix) & ~PAGE_MASK);
-		cop->tfrm_op.indata[0].iov_base = (unsigned char*)page_address(inpages[0]) + ((unsigned long int)(oper.indata + prev_ix) & ~PAGE_MASK);
+		cop->tfrm_op.indata[0].iov_base = page_address(inpages[0]) +
+			((unsigned long int)(oper.indata + prev_ix) &
+			~PAGE_MASK);
 		tmplen -= cop->tfrm_op.indata[0].iov_len;
 		for (i = 1; i<noinpages; i++){
 			cop->tfrm_op.indata[i].iov_len = tmplen < PAGE_SIZE ? tmplen : PAGE_SIZE;
-			cop->tfrm_op.indata[i].iov_base = (unsigned char*)page_address(inpages[i]);
+			cop->tfrm_op.indata[i].iov_base +				page_address(inpages[i]);
 			tmplen -= PAGE_SIZE;
 		}
 	} else {
 		cop->tfrm_op.indata[0].iov_len = oper.inlen - prev_ix;
-		cop->tfrm_op.indata[0].iov_base = (unsigned char*)page_address(inpages[0]) + ((unsigned long int)(oper.indata + prev_ix) & ~PAGE_MASK);
+		cop->tfrm_op.indata[0].iov_base = page_address(inpages[0]) +
+			((unsigned long int)(oper.indata + prev_ix) &
+			~PAGE_MASK);
 	}
 
 	iovlen = nooutpages + 6;

A small nit: If you're going to change stylistic issues please
run it through checkpatch and fix them all.

/^JN - Jesper Nilsson
-- 
               Jesper Nilsson -- jesper.nilsson@axis.com
