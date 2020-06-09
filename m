From: gubbaven@codeaurora.org
Date: Tue, 09 Jun 2020 15:51:06 +0000
Subject: Re: [PATCH] Bluetooth: hci_qca: Fix double free during SSR timeout
Message-Id: <51c4dfe5daf8497bd99a013458d93b92@codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d3444be6-28e6-bef5-08cf-6038620f65c6@web.de>
In-Reply-To: <d3444be6-28e6-bef5-08cf-6038620f65c6@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org, Balakrishna Godavarthi <bgodavar@codeaurora.org>, hemantg@codeaurora.org, Johan Hedberg <johan.hedberg@gmail.com>, Marcel Holtmann <marcel@holtmann.org>, Matthias Kaehlcke <mka@chromium.org>, Rocky Liao <rjliao@codeaurora.org>, Rob Herring <robh@kernel.org>, Sean Paul <seanpaul@chromium.org>, Claire Chang <tientzu@chromium.org>, yshavit@google.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Markus,

Sure we will update in next patch set.

Regards,
Lakshmi Narayna.
On 2020-06-04 23:54, Markus Elfring wrote:
>> Due to race conditions between qca_hw_error and qca_controller_memdump
>> during SSR timeout,the same pointer is freed twice.
> 
> This is an unfortunate software situation.
> 
> 
>> Which results to double free error.
> 
> How do you think about to omit this sentence from the change 
> description?
> 
> 
>> Now a lock is acquired while SSR state moved to timeout.
> 
> I suggest to convert this information into an imperative wording.
> 
> Would you like to add the tag “Fixes” to the commit message?
> 
> Regards,
> Markus
