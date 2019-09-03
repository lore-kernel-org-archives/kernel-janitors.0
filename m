From: =?UTF-8?Q?Andreas_Gr=C3=BCnbacher?= <andreas.gruenbacher@gmail.com>
Date: Tue, 03 Sep 2019 13:59:32 +0000
Subject: Re: [PATCH] gfs2: Delete an unnecessary check before brelse()
Message-Id: <CAHpGcMKEFaZBRNnt1edrvBMS6VUXs5hMdQ2BdNBE3ssgkmDoww@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <9250af4a-993c-e86e-678c-acbd59b0861a@web.de>
In-Reply-To: <9250af4a-993c-e86e-678c-acbd59b0861a@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: cluster-devel <cluster-devel@redhat.com>, Andreas Gruenbacher <agruenba@redhat.com>, Bob Peterson <rpeterso@redhat.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

Am Di., 3. Sept. 2019 um 15:21 Uhr schrieb Markus Elfring
<Markus.Elfring@web.de>:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 3 Sep 2019 15:10:05 +0200
>
> The brelse() function tests whether its argument is NULL
> and then returns immediately.
> Thus the test around the call is not needed.
>
> This issue was detected by using the Coccinelle software.

Thanks. The same applies to brelse() in gfs2_dir_no_add (which Coccinelle
apparently missed), so let me fix that as well.

Andreas
