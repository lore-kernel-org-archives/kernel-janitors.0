From: Minchan Kim <minchan.kim@gmail.com>
Date: Thu, 09 Dec 2010 16:09:34 +0000
Subject: Re: [PATCH] vmalloc: Remove redundant unlikely()
Message-Id: <AANLkTimNdZ4qRRFfrMUnmyZgPuoe2M8eVdCQykg1Dk-u@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1291905904-32716-1-git-send-email-tklauser@distanz.ch>
In-Reply-To: <1291905904-32716-1-git-send-email-tklauser@distanz.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tobias Klauser <tklauser@distanz.ch>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, kernel-janitors@vger.kernel.org

On Thu, Dec 9, 2010 at 11:45 PM, Tobias Klauser <tklauser@distanz.ch> wrote:
> IS_ERR() already implies unlikely(), so it can be omitted here.
>
> Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
Reviewed-by: Minchan Kim <minchan.kim@gmail.com>

Nice catch.

-- 
Kind regards,
Minchan Kim
