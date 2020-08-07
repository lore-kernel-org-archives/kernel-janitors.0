From: Can Guo <cang@codeaurora.org>
Date: Fri, 07 Aug 2020 13:01:45 +0000
Subject: Re: [PATCH 9/9] scsi: ufs: Properly release resources if a task is aborted successfully
Message-Id: <fc5c328732792aca1dd451d0109f00b5@codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <a752927b-dd9b-ebf0-8c77-e2ae0b2aa475@web.de>
In-Reply-To: <a752927b-dd9b-ebf0-8c77-e2ae0b2aa475@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Rajendra Nayak <rnayak@codeaurora.org>, Bart Van Assche <bvanassche@acm.org>, linux-scsi@vger.kernel.org, Saravana Kannan <saravanak@google.com>, "James E. J. Bottomley" <jejb@linux.ibm.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, "Bao D. Nguyen" <nguyenb@codeaurora.org>, Avri Altman <avri.altman@wdc.com>, Mark Salyzyn <salyzyn@google.com>, linux-mediatek@lists.infradead.org, Hongwu Su <hongwus@codeaurora.org>, Alim Akhtar <alim.akhtar@samsung.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Bean Huo <beanhuo@micron.com>, Stanley Chu <stanley.chu@mediatek.com>, kernel-team@android.com, linux-arm-kernel@lists.infradead.org, Asutosh Das <asutoshd@codeaurora.org>

Hi Markus,

On 2020-08-07 17:33, Markus Elfring wrote:
>> … To fix it, …
> 
> I propose to replace this wording by the tag “Fixes”.
> 
> 
>> … "mannually", …
> 
> Please avoid a typo:
> … "manually", …
> 
> 
> Regards,
> Markus

Thanks, will fix these in next version.

Regards,
Can Guo.
