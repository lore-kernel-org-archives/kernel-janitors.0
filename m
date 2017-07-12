From: Stanislaw Gruszka <sgruszka@redhat.com>
Date: Wed, 12 Jul 2017 06:49:12 +0000
Subject: Re: [PATCH] rt2x00: make const array glrt_table static
Message-Id: <20170712064911.GA2769@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170711114733.15387-1-colin.king@canonical.com>
In-Reply-To: <20170711114733.15387-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Helmut Schaa <helmut.schaa@googlemail.com>, Kalle Valo <kvalo@codeaurora.org>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org, netdev@vger.kernel.org

On Tue, Jul 11, 2017 at 12:47:33PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Don't populate array glrt_table on the stack but make it static.
> Makes the object code a smaller by over 670 bytes:
> 
> Before:
>    text	   data	    bss	    dec	    hex	filename
>  131772	   4733	      0	 136505	  21539	rt2800lib.o
> 
> After:
>    text	   data	    bss	    dec	    hex	filename
>  131043	   4789	      0	 135832	  21298	rt2800lib.o
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Acked-by: Stanislaw Gruszka <sgruszka@redhat.com>

I wonder why compiler do not optimize by itself since array is
const, but patch is ok.

Stanislaw 
