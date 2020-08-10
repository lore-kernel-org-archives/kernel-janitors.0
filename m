From: Can Guo <cang@codeaurora.org>
Date: Mon, 10 Aug 2020 00:48:07 +0000
Subject: Re: [9/9] scsi: ufs: Properly release resources if a task is aborted successfully
Message-Id: <8082186eed74798a403f3e3cb80a1751@codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <a752927b-dd9b-ebf0-8c77-e2ae0b2aa475@web.de>
 <fc5c328732792aca1dd451d0109f00b5@codeaurora.org>
 <cb9dbb7d-5515-0190-d336-be657e1ca31c@web.de>
In-Reply-To: <cb9dbb7d-5515-0190-d336-be657e1ca31c@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Rajendra Nayak <rnayak@codeaurora.org>, Bart Van Assche <bvanassche@acm.org>, linux-scsi@vger.kernel.org, Saravana Kannan <saravanak@google.com>, "James E. J. Bottomley" <jejb@linux.ibm.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, "Bao D. Nguyen" <nguyenb@codeaurora.org>, Avri Altman <avri.altman@wdc.com>, Mark Salyzyn <salyzyn@google.com>, linux-mediatek@lists.infradead.org, Hongwu Su <hongwus@codeaurora.org>, Alim Akhtar <alim.akhtar@samsung.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Bean Huo <beanhuo@micron.com>, Stanley Chu <stanley.chu@mediatek.com>, kernel-team@android.com, linux-arm-kernel@lists.infradead.org, Asutosh Das <asutoshd@codeaurora.org>

Hi Markus,

On 2020-08-10 02:00, Markus Elfring wrote:
>> Thanks, will fix these in next version.
> 
> Thanks for your adjustment of the proposed commit message.
> Should the corresponding patch be marked with an other version number?
> https://lore.kernel.org/linux-arm-kernel/1596975355-39813-10-git-send-email-cang@codeaurora.org/
> https://lore.kernel.org/patchwork/patch/1285629/
> https://lkml.org/lkml/2020/8/9/87
> 
> Should a cover letter be provided for such a patch series?
> 
> Regards,
> Markus

I am not sure if you got my mails, this patch is included in
a patch series with other 8 changes and they do have a cover
letter. Let me re-send them to you.

Thanks,

Can Guo.
