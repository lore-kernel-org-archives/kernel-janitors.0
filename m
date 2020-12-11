From: Neil Armstrong <narmstrong@baylibre.com>
Date: Fri, 11 Dec 2020 16:01:48 +0000
Subject: Re: [PATCH] drm/panel: khadas: Fix error code in khadas_ts050_panel_add()
Message-Id: <b6a872d0-7f2f-5ddd-b165-928c5e1a1b48@baylibre.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <X9NEfmgGilaXJs2R@mwanda> <20201211110157.GA527186@ravnborg.org>
In-Reply-To: <20201211110157.GA527186@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sam Ravnborg <sam@ravnborg.org>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: David Airlie <airlied@linux.ie>, Thierry Reding <thierry.reding@gmail.com>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

Hi All,

On 11/12/2020 12:01, Sam Ravnborg wrote:
> Hi Dan,
> 
> I assume your nice tooling found this buggy.
> Nice!
> 
> On Fri, Dec 11, 2020 at 01:05:50PM +0300, Dan Carpenter wrote:
>> There is a copy and paste bug so it didn't return the correct error
>> code.
>>
>> Fixes: b215212117f7 ("drm: panel: add Khadas TS050 panel driver")
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Thanks for the fix !

> 
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> 
> Neil, I assume you will take this via next-fixes, which I think is the
> right tree at the moment.

Sure, but seems drm-misc-next-fixes is out of sync with drm-misc-next right now,
I'll apply it when it's sync'ed back.

Neil

> 
> 	Sam
> 
