From: James Bottomley <James.Bottomley@suse.de>
Date: Tue, 04 Jan 2011 16:24:39 +0000
Subject: RE: [patch] [SCSI] scsi_dh: potential null dereference in
Message-Id: <1294158279.4726.17.camel@mulgrave.site>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110103054833.GT1886@bicker>
	 <E463DF2B2E584B4A82673F53D62C2EF4F5582F42@cosmail01.lsi.com>
In-Reply-To: <E463DF2B2E584B4A82673F53D62C2EF4F5582F42@cosmail01.lsi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Moger, Babu" <Babu.Moger@lsi.com>
Cc: Dan Carpenter <error27@gmail.com>, Mike Snitzer <snitzer@redhat.com>, Menny Hamburger <Menny_Hamburger@Dell.com>, "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Tue, 2011-01-04 at 09:13 -0700, Moger, Babu wrote:
> Looks good to me.

It does?  The first check is the bogus one, surely.  The queue is
created and destroyed by scsi_alloc_sdev(), so queuedata can never be
NULL for a SCSI queue.  There's no check anywhere in the rest of SCSI,
so there shouldn't be one here, should there?

James


