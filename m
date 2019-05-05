From: James Bottomley <James.Bottomley@HansenPartnership.com>
Date: Sun, 05 May 2019 03:34:34 +0000
Subject: Re: [PATCH] mptsas:  fix undefined behaviour of a shift of an int by more than 31 places
Message-Id: <1557027274.2821.2.camel@HansenPartnership.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190504164010.24937-1-colin.king@canonical.com>
In-Reply-To: <20190504164010.24937-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Sathya Prakash <sathya.prakash@broadcom.com>, Chaitra P B <chaitra.basappa@broadcom.com>, Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>, MPT-FusionLinux.pdl@broadcom.com, linux-scsi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, 2019-05-04 at 17:40 +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently the shift of int value 1 by more than 31 places can result
> in undefined behaviour. Fix this by making the 1 a ULL value before
> the shift operation.

Fusion SAS is pretty ancient.  I thought the largest one ever produced
had four phys, so how did you produce the overflow?

James
