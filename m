From: Johannes Berg <johannes@sipsolutions.net>
Date: Tue, 09 May 2017 07:53:35 +0000
Subject: Re: [PATCH] wil6210: Replace five seq_puts() calls by seq_putc()
Message-Id: <1494316415.2410.0.camel@sipsolutions.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <64747f85-e373-a0ff-b6dc-70cdfe35f71a@users.sourceforge.net>
         (sfid-20170509_095233_422214_ACF722B1)
In-Reply-To: <64747f85-e373-a0ff-b6dc-70cdfe35f71a@users.sourceforge.net> (sfid-20170509_095233_422214_ACF722B1)
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>, wil6210@qca.qualcomm.com, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, Kalle Valo <kvalo@codeaurora.org>, Maya Erez <qca_merez@qca.qualcomm.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Tue, 2017-05-09 at 09:50 +0200, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 8 May 2017 22:22:04 +0200
> 
> Five single characters (line breaks) should be put into a sequence.
> Thus use the corresponding function "seq_putc".

Please stop, this isn't really an issue worth worrying about.

johannes
