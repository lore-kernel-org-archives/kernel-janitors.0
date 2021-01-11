From: Colin Ian King <colin.king@canonical.com>
Date: Mon, 11 Jan 2021 17:37:36 +0000
Subject: Re: [PATCH][next] ASoC: soc-pcm: Fix uninitialised return value in variable ret
Message-Id: <9bef4fe5-0eed-03f8-9505-909b669ba49b@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210108123546.19601-1-colin.king@canonical.com>
 <20210111163551.GA33269@sirena.org.uk>
In-Reply-To: <20210111163551.GA33269@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, =?UTF-8?B?5pyx54G/54G/?= <zhucancan@vivo.com>, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org

On 11/01/2021 16:35, Mark Brown wrote:
> On Fri, Jan 08, 2021 at 12:35:46PM +0000, Colin King wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> Currently when attempting to start the BE fails because the
>> FE is not started the error return variable ret is not initialized
>> and garbage is returned.  Fix this by setting it to 0 so the
> 
> This doesn't apply against current code, please check and resend.
> 

Current ASoC tree now has two commits:

commit 4eeed5f40354735c4e68e71904db528ed19c9cbb
Author: Souptick Joarder <jrdr.linux@gmail.com>
Date:   Sat Jan 9 09:15:01 2021 +0530

    ASoC: soc-pcm: return correct -ERRNO in failure path

commit e91b65b36fde0690f1c694f17dd1b549295464a7
Author: Dan Carpenter <dan.carpenter@oracle.com>
Date:   Mon Jan 11 12:50:21 2021 +0300

    ASoC: soc-pcm: Fix an uninitialized error code

..both set ret to non-zero, which I believe will throw a subsequent
warning messagethat's not strictly related.

my fix was acked by zhucancan@vivo.com, so I'm now confused what is the
*correct* fix.

Colin
