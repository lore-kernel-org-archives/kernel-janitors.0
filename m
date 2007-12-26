From: "Ray Lee" <ray-lk@madrabbit.org>
Date: Wed, 26 Dec 2007 19:58:56 +0000
Subject: Re: [PATCH 1/4] fs/autofs: Use time_before, time_before_eq, etc.
Message-Id: <2c0942db0712261158q34cddebeifceef6ceda683320@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.58.0712261621000.1185@pc-041.diku.dk>
In-Reply-To: <Pine.LNX.4.58.0712261621000.1185@pc-041.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: hpa@zytor.com, autofs@linux.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Dec 26, 2007 7:21 AM, Julia Lawall <julia@diku.dk> wrote:
> -               if (jiffies - ent->last_usage < timeout)
> +               if (time_before(jiffies, ent->last_usage + timeout))

I don't think this is a safe change? subtraction is always safe (if
you think about it as 'distance'), addition isn't always safe unless
you know the range. The time_before macro will expand that out to
(effectively):

  if ( (long)(ent->last_usage + timeout) - (long)(jiffies) < 0 )

which seems to introduce an overflow condition in the first term.

Dunno, I may be wrong (happens often), but at the very least what
you've transformed it into is no longer obviously correct, and so it's
not a great change.
