From: "Pekka Enberg" <penberg@cs.helsinki.fi>
Date: Thu, 14 Feb 2008 18:18:02 +0000
Subject: Re: [PATCH 2/6] fs/direct-io.c: Use DIV_ROUND_UP
Message-Id: <84144f020802141018i235d3adfu13a84d124dc3964e@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.58.0802141614050.1185@pc-041.diku.dk>
	 <20080214173850.GC14191@us.ibm.com>
In-Reply-To: <20080214173850.GC14191@us.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nishanth Aravamudan <nacc@us.ibm.com>
Cc: Julia Lawall <julia@diku.dk>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Nishanth,

On Thu, Feb 14, 2008 at 7:38 PM, Nishanth Aravamudan <nacc@us.ibm.com> wrote:
>  Is it just me, or does
>
>         ((user_addr + iov[seg].iov_len + PAGE_SIZE - 1)/PAGE_SIZE - user_addr/PAGE_SIZE)
>
>  not simplify to
>
>         = ((iov[seg].iov_len + PAGE_SIZE - 1)/PAGE_SIZE + user_addr/PAGE_SIZE - user_addr/PAGE_SIZE)
>
>         = ((iov[seg].iov_len + PAGE_SIZE - 1)/PAGE_SIZE)
>
>         = DIV_ROUND_UP(iov[seg].iov_len, PAGE_SIZE)
>
>  CMIIW.

I double-checked this and I believe you're correct. It's simpler to
see when you do:

  x = user_addr
  y = iov[seg].iov_len
  z = PAGE_SIZE

So

  (x + y + z - 1)/z - x/z

  = [x + (y + z - 1)]/z - x/z

  = [xz + z(y + z - 1)]/z^2 - x/z

  = x/z + (y + z - 1)/z - x/z

And the rest follows from your simplifications.

                                      Pekka
