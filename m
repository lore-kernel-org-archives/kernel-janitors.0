From: Christoph Hellwig <hch@infradead.org>
Date: Mon, 13 Apr 2009 09:32:33 +0000
Subject: Re: [PATCH 56/56] xfs: Remove void casts
Message-Id: <20090413093232.GA14320@infradead.org>
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
In-Reply-To: <81C20178-5096-4E2E-A588-28AAE674748F@sgi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Felix Blyakher <felixb@sgi.com>
Cc: kernel-janitors@vger.kernel.org, Jack Stone <jwjstone@fastmail.fm>, LKML <linux-kernel@vger.kernel.org>, jeff@garzik.org, xfs mailing list <xfs@oss.sgi.com>

On Thu, Apr 09, 2009 at 12:37:08PM -0500, Felix Blyakher wrote:
>
> On Apr 8, 2009, at 6:22 AM, Jack Stone wrote:
>
>> Remove uneeded void casts
>>
>> Signed-Off-By: Jack Stone <jwjstone@fastmail.fm>
>
> See comments below.

Agree with the comments, als the subject line seems wrong, the patch
doesn't remove void casts, but casts from a void pointer to a typed
one which aren't nessecary.

Also please don't submit patches like this in a large series to the
world but separately to the listed maintainer / mailinglist of each
subsystem as there is no interdependency nor a general interest.

