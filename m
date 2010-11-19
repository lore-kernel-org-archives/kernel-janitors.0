From: Kevin Hilman <khilman@deeprootsystems.com>
Date: Fri, 19 Nov 2010 00:28:08 +0000
Subject: Re: [PATCH] mach-davinci: signedness bug
Message-Id: <87lj4qduna.fsf@deeprootsystems.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101115194028.30f8b7f0@absol.kitzblitz>
	<B85A65D85D7EB246BE421B3FB0FBB5930234A2AF08@dbde02.ent.ti.com>
In-Reply-To: <B85A65D85D7EB246BE421B3FB0FBB5930234A2AF08@dbde02.ent.ti.com>
	(Sekhar Nori's message of "Tue, 16 Nov 2010 10:19:49 +0530")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Nori, Sekhar" <nsekhar@ti.com>
Cc: Nicolas Kaiser <nikai@nikai.net>, "davinci-linux-open-source@linux.davincidsp.com" <davinci-linux-open-source@linux.davincidsp.com>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

"Nori, Sekhar" <nsekhar@ti.com> writes:

> Hi Nicolas,
>
> On Tue, Nov 16, 2010 at 00:10:28, Nicolas Kaiser wrote:
>> aemif_calc_rate() can return a negative error value, so all the
>> variables that get tested for this value need to be signed.
>>
>> The maximum bit width of WSETUP(WSETUP_MAX) appears to be 30 bits
>> (0xf << 26). Using a signed instead of an unsigned integer
>> shouldn't make a difference here.
>>
>> Signed-off-by: Nicolas Kaiser <nikai@nikai.net>
>
> Thanks for the fix. You could use the subject:
>
> "davinci: signedness bug in davinci_aemif_setup_timing()"
>
> Other than that:
>
> Acked-by: Sekhar Nori <nsekhar@ti.com>

Thanks, I fixed up the subject as Sekhar suggested.

Applied, queuing for 2.6.38.

Kevin

