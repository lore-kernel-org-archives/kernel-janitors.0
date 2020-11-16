From: Colin Ian King <colin.king@canonical.com>
Date: Mon, 16 Nov 2020 11:28:24 +0000
Subject: Re: [PATCH][next] drm/atomic: avoid null pointer dereference on pointer crtc
Message-Id: <af3a63a2-573b-2f72-501a-0bbc7c6a9686@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201116110316.269934-1-colin.king@canonical.com>
 <Gsgkd1PRlRQd3tlZ0nZROZwVfLvE7QmJdeOA8wkeVyE9ewGIj89RZAixoLltsvvgqB-Ica_sfpcNbwdtRCjDx16tYykgs61QOJRYm9Eumys=@emersion.fr>
In-Reply-To: <Gsgkd1PRlRQd3tlZ0nZROZwVfLvE7QmJdeOA8wkeVyE9ewGIj89RZAixoLltsvvgqB-Ica_sfpcNbwdtRCjDx16tYykgs61QOJRYm9Eumys=@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Simon Ser <contact@emersion.fr>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Sam Ravnborg <sam@ravnborg.org>

On 16/11/2020 11:08, Simon Ser wrote:
> On Monday, November 16, 2020 12:03 PM, Colin King <colin.king@canonical.com> wrote:
> 
>> From: Colin Ian King colin.king@canonical.com
>>
>> Since moving to the new debug helper functions we now have a debug message
>> that dereferences crtc to print a kernel debug message when crtc is null
>> and so this debug message will now cause a null pointer dereference. Since
>> this is a debug message it probably is just simplest to fix this by just
>> removing the debug message altogether.
> 
> NACK. This removes the log altogether instead of fixing it.
> 
> A fix has already been pushed to drm-misc-next: 0003b687ee6d ("drm: fix
> oops in drm_atomic_set_crtc_for_connector").
> 
Good to see this has already been fixed. Thanks.

Colin
