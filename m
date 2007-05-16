From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Wed, 16 May 2007 16:19:51 +0000
Subject: Re: [KJ] pm_send_all() deprecation
Message-Id: <Pine.LNX.4.64.0705161218530.7913@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <c6711b6b0705151505i14bdaa50lea8d18c6400b6846@mail.gmail.com>
In-Reply-To: <c6711b6b0705151505i14bdaa50lea8d18c6400b6846@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, 16 May 2007, Cripps wrote:

> I was under the impression cleaning up Deprecated APIs and the like
> is what KJ was all about ;)

it is.  but make sure you consult the file
Documentation/feature-removal-schedule.txt first.  there's no sense
wasting any time cleaning up code that's already scheduled for
removal.

rday

p.s.  legacy PM is not actually listed in that file, i just know that
there's already some effort being made to toss it.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
