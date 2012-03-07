From: Matthew Wilcox <matthew@wil.cx>
Date: Wed, 07 Mar 2012 15:56:25 +0000
Subject: Re: [PATCH] [SCSI] sd: set BIO_MAPPED_INTEGRITY bit correctly in sd_dif_prepare().
Message-Id: <20120307155624.GC19570@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1331131295-3707-1-git-send-email-santoshprasadnayak@gmail.com>
In-Reply-To: <1331131295-3707-1-git-send-email-santoshprasadnayak@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: santosh nayak <santoshprasadnayak@gmail.com>
Cc: JBottomley@parallels.com, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, mkp@mkp.net

On Wed, Mar 07, 2012 at 08:11:35PM +0530, santosh nayak wrote:
> From: Santosh Nayak <santoshprasadnayak@gmail.com>
> 
> Value of BIO_MAPPED_INTEGRITY is 11. Intention was to set the 11th bit.

Also, can we introduce:

#define bio_set_flag(bio, flag)	((bio)->bi_flags |= (1 << (flag)))

Then hunt down and kill all the places that manipulate bi_flags by hand?
We might also need:

#define bio_set_flag_atomic(bio, flag) set_bit(&(bio)->bi_flags, (flag))

-- 
Matthew Wilcox				Intel Open Source Technology Centre
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."
