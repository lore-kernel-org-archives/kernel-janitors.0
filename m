From: Jeff Garzik <jeff@garzik.org>
Date: Mon, 13 Apr 2009 09:35:02 +0000
Subject: Re: [PATCH 56/56] xfs: Remove void casts
Message-Id: <49E30746.3010509@garzik.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1239189748-11703-49-git-send-email-jwjstone@fastmail.fm>
	<1239189748-11703-50-git-send-email-jwjstone@fastmail.fm>
	<1239189748-11703-51-git-send-email-jwjstone@fastmail.fm>
	<1239189748-11703-52-git-send-email-jwjstone@fastmail.fm>
	<1239189748-11703-53-git-send-email-jwjstone@fastmail.fm>
	<1239189748-11703-54-git-send-email-jwjstone@fastmail.fm>
	<1239189748-11703-55-git-send-email-jwjstone@fastmail.fm>
	<1239189748-11703-56-git-send-email-jwjstone@fastmail.fm>
	<1239189748-11703-57-git-send-email-jwjstone@fastmail.fm>
	<81C20178-5096-4E2E-A588-28AAE674748F@sgi.com>
	<20090413093232.GA14320@infradead.org>
In-Reply-To: <20090413093232.GA14320@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jack Stone <jwjstone@fastmail.fm>
Cc: Christoph Hellwig <hch@infradead.org>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, xfs mailing list <xfs@oss.sgi.com>

Christoph Hellwig wrote:
> On Thu, Apr 09, 2009 at 12:37:08PM -0500, Felix Blyakher wrote:
>> On Apr 8, 2009, at 6:22 AM, Jack Stone wrote:
>>
>>> Remove uneeded void casts
>>>
>>> Signed-Off-By: Jack Stone <jwjstone@fastmail.fm>
>> See comments below.
> 
> Agree with the comments, als the subject line seems wrong, the patch
> doesn't remove void casts, but casts from a void pointer to a typed
> one which aren't nessecary.
> 
> Also please don't submit patches like this in a large series to the
> world but separately to the listed maintainer / mailinglist of each
> subsystem as there is no interdependency nor a general interest.

And what evil have I committed, to be cursed with being CC'd on every 
damn one of these things?

	Jeff




