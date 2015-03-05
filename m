From: Richard Weinberger <richard@nod.at>
Date: Thu, 05 Mar 2015 10:33:14 +0000
Subject: Re: [PATCH 0/5] UBI: Coverity-inspired fixes
Message-Id: <54F830EA.4080106@nod.at>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1425119009-28634-1-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1425119009-28634-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Brian Norris <computersforpeace@gmail.com>, Artem Bityutskiy <dedekind1@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org

Brian,

Am 28.02.2015 um 11:23 schrieb Brian Norris:
> Except for the last one, these were inspired by Coverity Scan results.
> 
> These fixes have barely been tested, but they are pretty straightforward
> logically. As they've been sitting in my dust pile too long, I thought I'd at
> least get them out there.
> 
> Brian Norris (5):
>   UBI: account for bitflips in both the VID header and data
>   UBI: fix out of bounds write
>   UBI: initialize LEB number variable
>   UBI: fix check for "too many bytes"
>   UBI: align comment for readability

Nice work!
I'll test them later today.
Just a quick question, no patch has a stable tag, is this by design?
From a first look most of them look like stable material.

Thanks,
//richard
