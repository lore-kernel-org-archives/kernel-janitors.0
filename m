From: Joe Perches <joe@perches.com>
Date: Thu, 23 Sep 2010 09:05:38 +0000
Subject: Re: threaded patch series
Message-Id: <1285232738.31572.6.camel@Joe-Laptop>
List-Id: <kernel-janitors.vger.kernel.org>
References: <AANLkTinsM5jdU194FR8L3hTvBXk0Tr_oV2E5752NOUpq@mail.gmail.com>
	 <AANLkTikkJNwF4LS9rx5=bHM2R0Pm751Y1u9V8iAt0w1A@mail.gmail.com>
	 <1285227413.7286.47.camel@Joe-Laptop>
	 <Pine.LNX.4.64.1009231054230.15528@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1009231054230.15528@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>, git <git@vger.kernel.org>
Cc: matt mooney <mfmooney@gmail.com>, kernel-janitors@vger.kernel.org, Dan Carpenter <error27@gmail.com>

On Thu, 2010-09-23 at 10:55 +0200, Julia Lawall wrote:
> I made some changes to git-send-email to get it to send mail to different 
> people, ie a different set of addresses for each patch.  Is that now 
> possible with the standard version?  If not I can submit a patch with my 
> changes at some point.

I believe it's not currently possible to have
different "to:" addresses in a git send-email
patch series and that could be a useful patch
to submit.


