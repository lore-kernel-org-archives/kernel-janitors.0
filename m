From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 03 Dec 2020 11:33:37 +0000
Subject: Re: [PATCH net] rtw88: debug: Fix uninitialized memory in debugfs code
Message-Id: <20201203113337.GL2789@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <X8ilOfVz3pf0T5ec@mwanda>
 <87pn3rgsgi.fsf@codeaurora.org>
In-Reply-To: <87pn3rgsgi.fsf@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Yan-Hsuan Chuang <tony0620emma@gmail.com>, Stanislaw Gruszka <sgruszka@redhat.com>, Brian Norris <briannorris@chromium.org>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Dec 03, 2020 at 11:16:29AM +0200, Kalle Valo wrote:
> Dan Carpenter <dan.carpenter@oracle.com> writes:
> 
> > This code does not ensure that the whole buffer is initialized and none
> > of the callers check for errors so potentially none of the buffer is
> > initialized.  Add a memset to eliminate this bug.
> >
> > Fixes: e3037485c68e ("rtw88: new Realtek 802.11ac driver")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> >  drivers/net/wireless/realtek/rtw88/debug.c | 2 ++
> >  1 file changed, 2 insertions(+)
> 
> I'll take this to wireless-drivers, this shouldn't go to net.

Ugh...  The worst part about that is that I manually added the "net"
part without thinking thouroughly.  :/  Anyway, I've modified my QC
scripts now.

regards,
dan carpenter
