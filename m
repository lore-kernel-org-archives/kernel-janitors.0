From: "H. Peter Anvin" <hpa@zytor.com>
Date: Wed, 26 Dec 2007 20:45:32 +0000
Subject: Re: [PATCH 1/4] fs/autofs: Use time_before, time_before_eq, etc.
Message-Id: <4772BD6C.1010502@zytor.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.58.0712261621000.1185@pc-041.diku.dk> <2c0942db0712261158q34cddebeifceef6ceda683320@mail.gmail.com>
In-Reply-To: <2c0942db0712261158q34cddebeifceef6ceda683320@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ray Lee <ray-lk@madrabbit.org>
Cc: Julia Lawall <julia@diku.dk>, autofs@linux.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Ray Lee wrote:
> On Dec 26, 2007 7:21 AM, Julia Lawall <julia@diku.dk> wrote:
>> -               if (jiffies - ent->last_usage < timeout)
>> +               if (time_before(jiffies, ent->last_usage + timeout))
> 
> I don't think this is a safe change? subtraction is always safe (if
> you think about it as 'distance'), addition isn't always safe unless
> you know the range. The time_before macro will expand that out to
> (effectively):
> 
>   if ( (long)(ent->last_usage + timeout) - (long)(jiffies) < 0 )
> 
> which seems to introduce an overflow condition in the first term.
> 
> Dunno, I may be wrong (happens often), but at the very least what
> you've transformed it into is no longer obviously correct, and so it's
> not a great change.

Indeed.  The bottom form will have overflow issues at time 
jiffies_wraparound/2, whereas the top form will have overflow issues 
only near jiffies_wraparound/1.

	-hpa
