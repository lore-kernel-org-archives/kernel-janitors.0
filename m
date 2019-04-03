From: Brian Norris <briannorris@chromium.org>
Date: Wed, 03 Apr 2019 20:05:58 +0000
Subject: Re: [PATCH] mwifiex: add a bounds check in mwifiex_process_sta_rx_packet()
Message-Id: <CA+ASDXPrTo2b=o--Sik7iufZQ1J6c5LANDyYWof=LGAZA3ALOg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190402070338.GB15171@kadam>
In-Reply-To: <20190402070338.GB15171@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Amitkumar Karwar <amitkarwar@gmail.com>, Nishant Sarmukadam <nishants@marvell.com>, Ganapathi Bhat <gbhat@marvell.com>, Xinming Hu <huxinming820@gmail.com>, Kalle Valo <kvalo@codeaurora.org>, linux-wireless <linux-wireless@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Tue, Apr 2, 2019 at 12:03 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> Smatch complains that "local_rx_pd->priority" can't be trusted because
> it comes from skb->data and it can go up to 255 instead of being capped
> in the 0-7 range.  A few lines earlier, on the other side of the if
> statement, we cap priority so it seems harmless to add a bounds check
> here as well.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Seems right to me:

Reviewed-by: Brian Norris <briannorris@chromium.org>
