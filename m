From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Date: Thu, 23 Mar 2017 19:37:18 +0000
Subject: Re: [PATCH] leds: mt6323: Fix an off by one bug in probe
Message-Id: <af65e771-f0ae-193d-5ece-74e76489d726@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170323104049.GC20154@mwanda> <20170323111655.GA12792@amd>
In-Reply-To: <20170323111655.GA12792@amd>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pavel Machek <pavel@ucw.cz>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: Richard Purdie <rpurdie@rpsys.net>, Sean Wang <sean.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-leds@vger.kernel.org, linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org

On 03/23/2017 12:16 PM, Pavel Machek wrote:
> On Thu 2017-03-23 13:40:49, Dan Carpenter wrote:
>> It should be ">= MT6323_MAX_LEDS" instead of ">".  Also "reg" is a u32
>> so it can't be negative and we can remove the test for negative values.
>>
>> Fixes: 216ec6cc4c19 ("leds: Add LED support for MT6323 PMIC")
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Acked-by: Pavel Machek <pavel@ucw.cz>

Applied, thanks.

-- 
Best regards,
Jacek Anaszewski
