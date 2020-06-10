From: Greg KH <gregkh@linuxfoundation.org>
Date: Wed, 10 Jun 2020 14:54:53 +0000
Subject: Re: [PATCH] Bluetooth: hci_qca: Fix double free during SSR timeout
Message-Id: <20200610145453.GC2102023@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d3444be6-28e6-bef5-08cf-6038620f65c6@web.de>
In-Reply-To: <d3444be6-28e6-bef5-08cf-6038620f65c6@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org, Balakrishna Godavarthi <bgodavar@codeaurora.org>, hemantg@codeaurora.org, Johan Hedberg <johan.hedberg@gmail.com>, Marcel Holtmann <marcel@holtmann.org>, Matthias Kaehlcke <mka@chromium.org>, Rocky Liao <rjliao@codeaurora.org>, Rob Herring <robh@kernel.org>, Sean Paul <seanpaul@chromium.org>, Claire Chang <tientzu@chromium.org>, yshavit@google.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Jun 04, 2020 at 08:24:34PM +0200, Markus Elfring wrote:
> > Due to race conditions between qca_hw_error and qca_controller_memdump
> > during SSR timeout,the same pointer is freed twice.
> 
> This is an unfortunate software situation.
> 
> 
> > Which results to double free error.
> 
> How do you think about to omit this sentence from the change description?
> 
> 
> > Now a lock is acquired while SSR state moved to timeout.
> 
> I suggest to convert this information into an imperative wording.
> 
> Would you like to add the tag “Fixes” to the commit message?
> 
> Regards,
> Markus

Hi,

This is the semi-friendly patch-bot of Greg Kroah-Hartman.

Markus, you seem to have sent a nonsensical or otherwise pointless
review comment to a patch submission on a Linux kernel developer mailing
list.  I strongly suggest that you not do this anymore.  Please do not
bother developers who are actively working to produce patches and
features with comments that, in the end, are a waste of time.

Patch submitter, please ignore Markus's suggestion; you do not need to
follow it at all.  The person/bot/AI that sent it is being ignored by
almost all Linux kernel maintainers for having a persistent pattern of
behavior of producing distracting and pointless commentary, and
inability to adapt to feedback.  Please feel free to also ignore emails
from them.

thanks,

greg k-h's patch email bot
